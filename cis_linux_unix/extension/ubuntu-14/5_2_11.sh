cis_test_name="Ensure only approved MAC algorithms are used"

function cis_test_run()
{
    cmd=$(grep "^MACs" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"MACs"* ]]; then
        return 0
    fi
    return 1
}

