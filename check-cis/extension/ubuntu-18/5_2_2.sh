cis_test_name="Ensure SSH Protocol is set to 2"

function cis_test_run()
{
    cmd=$(grep "^Protocol" /etc/ssh/sshd_config)
    if [[ "$cmd" == *"Protocol 2"* ]]; then
        return 0
    fi
    return 1
}

