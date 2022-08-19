cis_test_name="Ensure SSH LoginGraceTime is set to one minute or less"

function cis_test_run()
{
        LGT=$(grep "^LoginGraceTime" /etc/ssh/sshd_config | awk {'print $2'})
        if [[ $LGT -eq '' || $LGT -gt 60 || $LGT -lt 1 ]]; then
                return 1
        fi
        return 0
}
