cis_test_name="Ensure SSH PermitUserEnvironment is disabled"

function cis_test_run()
{
    cmd=$(grep "^PermitUserEnvironment" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"PermitUserEnvironment no"* ]]; then
        return 0
    fi
    return 1
}

