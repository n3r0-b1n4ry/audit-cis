cis_test_name="Ensure inactive password lock is 30 days or less"

function cis_test_run()
{
        cmd=$(useradd -D | grep INACTIVE | cut -d= -f2)
        if [[ $cmd -eq '' || $cmd -gt 30 ]]; then
                return 1
        fi
        for i in $(egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 ); do
                cmd=$(chage --list $i | grep "Password inactive" | cut -d: -f2)
                if [[ $cmd -lt 7 ]]; then
                        return 1
                fi
        done
        return 0
}
