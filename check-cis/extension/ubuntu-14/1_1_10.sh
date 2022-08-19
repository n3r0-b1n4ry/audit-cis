partition="/var/tmp"
mount_option="noexec"
cis_test_name="Ensure ${mount_option} option set on ${partition} partition (Scored)"

function cis_test_run()
{
	cmd=$(mount | grep -E "\s${partition}\s" | grep -v ${mount_option})
	[ -n "$cmd" ] && return 1
	return 0
}
