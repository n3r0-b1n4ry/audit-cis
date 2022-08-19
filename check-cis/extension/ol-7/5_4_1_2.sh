cis_test_name="Ensure minimum days between password changes is 7 or more"

function cis_test_run()
{
        cmd=$(grep -E "^PASS_MIN_DAYS" /etc/login.defs | awk {'print $2'})
        if [[ $cmd -eq '' || $cmd -lt 7 ]]; then
                return 1
        fi
        for i in $(egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 ); do
                cmd=$(chage --list $i | grep "Minimum number of days between password change" | cut -d: -f2)
                if [[ $cmd -lt 7 ]]; then
                        return 1
                fi
        done
        return 0
}
