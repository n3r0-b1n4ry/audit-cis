cis_test_name="Ensure only approved MAC algorithms are used"

function cis_test_run()
{
        MACs=$(grep "MACs" /etc/ssh/sshd_config  | awk {'print $2'})

        if [[ -z $MACs ]]; then
                return 1
        fi
        return 0
}
