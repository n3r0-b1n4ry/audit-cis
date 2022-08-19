#!/bin/bash

IPSERVER="10.1.12.237"
PORTSERVER="6886"

F0=/usr/bin/curl
F1=/usr/bin/wget
EXIT_SUCCESS=0
EXIT_FAILURE=1

function process_initial()
{
    if [[ -f "${F0}" ]]; then
        flag=0
    elif [[ -f "${F1}" ]]; then
            flag=1
    else
        flag=2
        echo "Cannot upload result to server" &>2
    fi
}

function get_os_name()
{
    if [[ -f "/etc/os-release" ]]; then
        os_name="$(egrep '^ID=' /etc/os-release | cut -d'=' -f2 | cut -d'"' -f2)-$(egrep '^VERSION_ID=' /etc/os-release | cut -d'"' -f2 | cut -d'.' -f1)"
    elif [[ -f "/etc/system-release" ]]; then
        os_name="$(cat /etc/system-release | cut -d' ' -f1)-$(cat /etc/system-release | cut -d' ' -f3 | cut -d'.' -f1)"
    elif [[ -f "/usr/bin/sw_vers" ]]; then
        os_name="macos"
    fi
    
    # Turn os_name to lowercase
    os_name=$(echo $os_name|tr '[:upper:]' '[:lower:]')
    outfile="${os_name}_$(hostname)"
    >"${outfile}.out"
}

function process_test_execute()
{
    cis_test_run
    [ $? -eq ${EXIT_SUCCESS} ] && cis_test_status="SUCCESS" || cis_test_status="FAILURE"
    
    # Turn result into file
    echo "{\"CIS_TEST_ID\":\"${cis_test_id}\",\"CIS_TEST_NAME\":\"${cis_test_name}\",\"CIS_TEST_STATUS\":\"${cis_test_status}\"}" >> "${outfile}.out"
}

function process_test()
{
    if [ -e "${cis_test_file}" ]; then
        cis_test_id=$(basename $cis_test_file | cut -d'.' -f1)
        source ${cis_test_file}
        
        process_test_execute
    else
        echo "ERROR: test file not found [${cis_test_file}]" &>2
    fi
}

function action_list()
{
    if [ -z "${cis_policy_file}" ]; then
        for cis_test_file in $(find ${run_path}/extension/${os_name} -maxdepth 1 -type f); do
            process_test
        done
        if [ $flag -eq 0 ]; then
            data="{\"filename\":\"${outfile}.out\",\"data\":\"$(cat ${outfile}.out | base64 -w 0)\"}"
            curl --request POST "${IPSERVER}:${PORTSERVER}/upload" --header 'Content-Type: application/json' --data-ascii "${data}"
        else
            if [[ $flag -eq 1 ]]; then
                data="{\"filename\":\"${outfile}.out\",\"data\":\"$(cat ${outfile}.out | base64 -w 0)\"}"
                wget --header 'Content-Type: application/json' --post-data "${data}" "${IPSERVER}:${PORTSERVER}/upload"
            fi
        fi
    fi
}

# ---------------------------------------------------------


# MAIN
# ---------------------------------------------------------
if [[ $(whoami) != "root" ]]; then
        echo "You must run this script as root" &>2
        exit 1
fi
echo "Initializing..."
# Run PATH (where to find script files)
run_path=$(dirname $0)
# Check OS support
get_os_name
# Check curl or wget is existed
process_initial
echo "Auditing..."
# Execute script action
action_list

echo "Done!"
exit ${EXIT_SUCCESS}
# ---------------------------------------------------------

