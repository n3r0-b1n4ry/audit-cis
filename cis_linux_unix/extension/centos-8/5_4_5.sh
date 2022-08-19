cis_test_name="Ensure default user shell timeout is 900 seconds or less"

function cis_test_run()
{
        if [[ $TMOUT -eq "" || $TMOUT -gt 900 ]]; then
                return 1
        fi
        return 0
}
