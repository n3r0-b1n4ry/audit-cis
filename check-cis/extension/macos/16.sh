cis_test_name="Set AppStore update check to every one day"

function cis_test_run() {
    st="$(defaults read com.apple.SoftwareUpdate ScheduleFrequency)"
    if [[ $st == *"1"* ]]; then
        return 0
    fi
    return 1
}