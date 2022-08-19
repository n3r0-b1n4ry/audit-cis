cis_test_name=" Ensure default group for the root account is GID 0"

function cis_test_run()
{
    grep "^root:" /etc/passwd | cut -f4 -d: | grep -qE "^0$" || return $?
}
