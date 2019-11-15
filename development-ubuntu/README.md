# Development Ubuntu Machine

This virtual machine provides a generic Ubuntu 18.04 machine, that I can use for my common
development setup.

## Software Packages

- Desktop Environment: XFCE4
- Browsers
    - Firefox
    - Chromium
- IDEs
    - Visual Studio Code
    - Pycharm (Community Edition)
- Collaboration
    - Slack
    - Skype
- Utilities
    - Postman
- Other
    - git
    - curl

## How to run

1. Copy `scripts/02_clone_git_repos.template.sh` to `scripts/02_clone_git_repos`
2. Enter the actual repositories that you want to clone
3. Run `vagrant up`

This will then take about 15 minutes to install everything, so go grab some coffee.