cis_test_name="Ensure SSH MaxAuthTries is set to 4 or less"

function cis_test_run()
{
        cmd=$(grep "^MaxAuthTries" /etc/ssh/sshd_config |awk {'print $2'})

        if [[ $cmd -eq '' || $cmd -gt 4 ]]; then
                return 1
        fi
        return 0
}
