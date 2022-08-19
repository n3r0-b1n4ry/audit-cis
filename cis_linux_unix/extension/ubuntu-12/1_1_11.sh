partition="/var/log"
cis_test_name="Ensure separate partition exists for ${partition} (Scored)"

function cis_test_run()
{
	cmd=$(mount | grep -E "\s${partition}\s")
	[ -z "$cmd" ] && return 1
	return 0
}

