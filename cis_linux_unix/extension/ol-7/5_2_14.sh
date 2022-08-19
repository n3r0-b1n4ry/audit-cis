cis_test_name="Ensure SSH access is limited"

function cis_test_run()
{
    grep -qE "^AllowUsers|^AllowGroups|^DenyUsers|^DenyGroups" /etc/ssh/sshd_config || return $?
}
