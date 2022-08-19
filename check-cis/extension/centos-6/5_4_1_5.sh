cis_test_name="Ensure all users last password change date is in the past"

function cis_test_run()
{
        NOW=$(date +%s)
        for i in $(egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 ); do
                UPA=$(chage --list $i | grep "Last password change" | cut -d: -f2)
                EPOCH=$(date -d "$UPA" +%s)
                if [[ $EPOCH -gt $NOW ]]; then
                        return 1
                fi
        done
        return 0
}
