cis_test_name="Ensure authentication required for single user mode"

function cis_test_run()
{
    cmd=$(grep ^root:[*\!]: /etc/shadow)
    if [[ "$cmd" == "" ]]; then
        return 0
    fi
    return 1
}

