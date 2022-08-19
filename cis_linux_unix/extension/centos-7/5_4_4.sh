cis_test_name="Ensure default user umask is 027 or more restrictive"

function cis_test_run()
{
    [[ "$(umask)" =~ [0-7][2-7]7$ ]] || return;
    return 0
}
