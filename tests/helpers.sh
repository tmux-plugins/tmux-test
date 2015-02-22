# Global variable that keeps the value of test status (success/fail).
# Suggested usage is via `fail_helper` and `exit_helper` functions.
TEST_STATUS="success"

# PRIVATE FUNCTIONS

_teardown() {
	rm -f ~/.tmux.conf
	rm -rf ~/.tmux/
	tmux kill-server >/dev/null 2>&1
}

# PUBLIC HELPER FUNCTIONS

set_tmux_conf_helper() {
	> ~/.tmux.conf	# empty tmux.conf file
	while read -r line; do
		echo "$line" >> ~/.tmux.conf
	done
}

fail_helper() {
	local message="$1"
	echo "$message" >&2
	TEST_STATUS="fail"
}

exit_helper() {
	_teardown
	if [ "$TEST_STATUS" == "fail" ]; then
		echo "FAIL!"
		echo
		exit 1
	else
		echo "SUCCESS"
		echo
		exit 0
	fi
}
