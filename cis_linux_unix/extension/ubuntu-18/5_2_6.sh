cis_test_name="Ensure SSH IgnoreRhosts is enabled"

function cis_test_run()
{
    cmd=$(grep "^IgnoreRhosts" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"IgnoreRhosts yes"* ]]; then
        return 0
    fi
    return 1
}

