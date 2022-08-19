cis_test_name="Enable Automatic System Updates"

function cis_test_run()
{
    st="$(defaults read "/Library/Preferences/com.apple.SoftwareUpdate.plist" "AutomaticallyInstallMacOSUpdates")"
    if [[ $st == "0" ]]; then
        return 1
    fi
    return 0
}