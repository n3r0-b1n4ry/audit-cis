cis_test_name="Ensure permissions on all logfiles are configured"

function cis_test_run()
{
    [[ $(find /var/log -type f -ls | grep -v "\-r\-\-\-\-\-\-\-\-" | grep -v "\-rw\-\-\-\-\-\-\-" | grep -v "\-rw\-r\-\-\-\-\-" | wc -l) -eq 0 ]] || return 1
    return 0
}
