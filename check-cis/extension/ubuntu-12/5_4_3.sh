cis_test_name="Ensure default group for the root account is GID 0"

function cis_test_run()
{
    cmd=$(grep "^root:" /etc/passwd | cut -f4 -d:)
    if [[ "$cmd" == *"0"* ]]; then
        return 0
    fi
    return 1
}

