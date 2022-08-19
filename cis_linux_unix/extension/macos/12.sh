cis_test_name="Disable Remote Apple Events"

function cis_test_run() {
    st="$(sudo systemsetup -getremoteappleevents)"
    if [[ $st == *"Remote Apple Events: Off"* ]]; then
        return 0
    fi
    return 1
}