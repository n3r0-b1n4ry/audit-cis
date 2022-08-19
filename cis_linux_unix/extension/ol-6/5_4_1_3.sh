cis_test_name="Ensure password expiration warning days is 7 or more"

function cis_test_run()
{
        cmd=$(grep -E "^PASS_WARN_AGE" /etc/login.defs | awk {'print $2'})
        if [[ $cmd -eq '' || $cmd -lt 7 ]]; then
                return 1
        fi
        for i in $(egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 ); do
                cmd=$(chage --list $i | grep "Number of days of warning before password expires" | cut -d: -f2)
                if [[ $cmd -lt 7 ]]; then
                        return 1
                fi
        done
        return 0
}
