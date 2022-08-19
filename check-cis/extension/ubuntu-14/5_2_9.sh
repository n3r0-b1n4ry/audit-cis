cis_test_name="Ensure SSH PermitEmptyPasswords is disabled"

function cis_test_run()
{
    cmd=$(grep "^PermitEmptyPasswords" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"PermitEmptyPasswords no"* ]]; then
        return 0
    fi
    return 1
}

