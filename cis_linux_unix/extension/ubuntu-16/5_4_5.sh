cis_test_name="Ensure default user shell timeout is 900 seconds or less"

function cis_test_run()
{
    cmd=$(grep "^TMOUT" /etc/bash.bashrc)
    if [[ "$cmd" == *"TMOUT 600"* ]]; then
        cmd=$(grep "^TMOUT" /etc/profile /etc/profile.d/*.sh)
        if [[ "$cmd" == *"TMOUT 600"* ]]; then
            return 0
        fi
    fi
    return 1
}

