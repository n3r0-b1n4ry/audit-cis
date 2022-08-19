cis_test_name="Ensure SSH Idle Timeout Interval is configured"

function cis_test_run()
{
        CAI=$(grep "^ClientAliveInterval" /etc/ssh/sshd_config | awk {'print $2'})

        if [[ $CAI -eq '' || $CAI -lt 1 || $CAI -gt 300 ]]; then
                return 1
        fi
        CACM=$(grep "^ClientAliveCountMax" /etc/ssh/sshd_config |awk {'print $2'})
        if [[ $CACM -gt 3 ]]; then
                return 1
        fi
        return 0
}
