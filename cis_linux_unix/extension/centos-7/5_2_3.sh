cis_test_name="Ensure SSH LogLevel is set to INFO"

function cis_test_run()
{
    grep "^\s*LogLevel" /etc/ssh/sshd_config | grep -q "LogLevel\s*INFO" || return $?
}
