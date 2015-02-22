# tmux-test

[![Build Status](https://travis-ci.org/tmux-plugins/tmux-test.png?branch=master)](https://travis-ci.org/tmux-plugins/tmux-test)

A small framework for isolated testing of tmux plugins. Works on
[travis](travis-ci.org) too.

Extracted from [tmux plugin manager](https://github.com/tmux-plugins/tpm) and
[tmux-copycat](https://github.com/tmux-plugins/tmux-copycat).

Dependencies: `Vagrant` (when running on travis, this is not required).

### Setup

Let's say you made tmux plugin with the following file hierarchy:

```text
/tmux-plugin
|-- plugin.tmux
|-- scripts
    `-- plugin_script.sh
```

From your project root directory (tmux-plugin/) execute the following shell
command to fetch `tmux-test` and add it as a submodule:

    $ git submodule add https://github.com/tmux-plugins/tmux-test.git lib/tmux-test

Run the `setup` script:

    $ lib/tmux-test/setup

The project directory will now look like this (additions have comments):

```text
/tmux-plugin
|-- plugin.tmux
|-- run_tests                       # symlink, gitignored
|-- .gitignore                      # 2 lines appended to gitignore
|-- .travis.yml                     # added
|-- lib/tmux-test/                  # git submodule
|-- scripts
|   `-- plugin_script.sh
|-- tests                           # dir to put the tests in
    `-- run_tests_in_isolation.sh   # symlink, gitignored
```

`tmux-test` is now set up. You are ok to commit the additions to the repo.

### Writing and running tests

A test is any executable with a name starting with `test_` in a `tests/`
directory.

Now that you installed `tmux-test` let's create an example test.

- create a `tests/test_example.sh` file with the following content:

        #/usr/bin/env bash
        echo "example!"
        exit 0

- make the test file executable with `$ chmod +x tests/test_example.sh`
- run the test by executing `./run_tests` from the project root directory
- the first invocation might take some time because Vagrant's ubuntu virtual
  machine is downloading. You should see `Success, tests pass!` message when it's
  done.

Check out more example test scripts in this project's [tests/ directory](tests/).

### Continuous integration

The setup script (`lib/tmux-test/setup`) added a `.travis.yml` file to the
project root. To setup continuous integration, just add/enable the project on
[travis](travis-ci.org).

### Notes

- The `tests/` directory for tests and `lib/tmux-test/` for cloning `tmux-test`
  into cannot be changed currently
- Don't run `tests/run_tests_in_isolation` script on your local development
  environment. That's an internal test runner meant to be executed in an
  isolated environment like `vagrant` or `travis`.<br/>
  Use `./run_tests` script.

### Other goodies

- [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) - a plugin for
  regex searches in tmux and fast match selection
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - automatic
  restoring and continuous saving of tmux env

You might want to follow [@brunosutic](https://twitter.com/brunosutic) on
twitter if you want to hear about new tmux plugins or feature updates.

### License

[MIT](LICENSE.md)
