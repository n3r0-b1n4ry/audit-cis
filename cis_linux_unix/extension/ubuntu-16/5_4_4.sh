cis_test_name="Ensure default user umask is 027 or more restrictive"

function cis_test_run()
{
    cmd=$(grep "umask" /etc/bash.bashrc)
    if [[ "$cmd" == *"umask 027"* ]]; then
        cmd=$(grep "umask" /etc/profile /etc/profile.d/*.sh)
        if [[ "$cmd" == *"umask 027"* ]]; then
            return 0
        fi
    fi
    return 1
}

