cis_test_name="Ensure SSH LogLevel is set to INFO"

function cis_test_run()
{
    cmd=$(grep "^LogLevel" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"LogLevel INFO"* ]]; then
        return 0
    fi
    return 1
}

