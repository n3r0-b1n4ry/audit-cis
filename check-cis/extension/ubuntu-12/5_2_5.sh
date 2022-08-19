cis_test_name="Ensure SSH MaxAuthTries is set to 4 or less"

function cis_test_run()
{
    cmd=$(grep "^MaxAuthTries" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"MaxAuthTries 4"* ]]; then
        return 0
    fi
    return 1
}

