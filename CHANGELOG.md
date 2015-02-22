# Changelog

### master

### v0.1.0, 2015-02-22
- changes so that 'tmux-test' can be included with tmux plugins
- do not gitignore submodules directory
- add installation and usage instructions
- copy `.travis.yml` to the project root when running `setup` script
- add a brief mention of travis CI to the readme
- add test helpers
- `setup` script symlinks helpers file to `tests/` directory
- `setup` script can undo most of its actions
- add a tmux scripting test
- `tmux-test` uses `tmux-test` to test itself
- update `tmux-test` submodule
- a different `travis.yml` for `tmux-test` and for plugins

### v0.0.1, 2015-02-21
- git init
- add vagrant provisioning scripts for ubuntu and debian
- add a ".travis.yml" file
- generic "run_tests" script
- "run_tests_in_isolation" script
- add "Vagrantfile"
- enable passing VM names as arguments to "run_tests" script
