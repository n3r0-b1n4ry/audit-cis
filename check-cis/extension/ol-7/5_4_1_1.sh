cis_test_name="Ensure password expiration is 365 days or less"

function cis_test_run()
{
        PMD=$(grep -E "^PASS_MAX_DAYS" /etc/login.defs | awk {'print $2'})

        if [[ $PMD -eq '' || $PMD -gt 365 ]]; then
                return 1
        fi

        for i in $(egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 ); do
                UPA=$(chage --list $i | grep "Maximum number of days between password change" | cut -d: -f2)
                if [[ $UPA -gt 365 ]]; then
                        return 1
                fi
        done
        return 0
}