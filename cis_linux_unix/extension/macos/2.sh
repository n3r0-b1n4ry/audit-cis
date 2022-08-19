cis_test_name="Enable Automatic App Store Updates"

function cis_test_run() {
    if ! defaults read "/Library/Preferences/com.apple.commerce.plist" "AutoUpdate" >/dev/null 2>&1; then
        return 1
    fi
    defaults read "/Library/Preferences/com.apple.commerce.plist" "AutoUpdate" >/dev/null 2>&1 | grep -q '0';
    return 0
}