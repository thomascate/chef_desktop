# Chef Desktop

Chef Desktop is a batteries included way of managing your Windows or Mac desktop with Chef. It provides sane, secure defaults, and makes configuring your desktop a breeze.

Right now, this is the design doc - ala README driven development.

__NOTE__: This works with an experimental fork of chef-dk

```
git clone https://github.com/talaris/chef-dk ../chef-dk
cd ../chef-dk
bundle install
bundle exec chef desktop --cookbooks-path ../chef_desktop/cookbooks
```

## Philosophy

What it is:
- Use cases centered around single developer and small to medium sized organizations.
- Batteries included. Custom resources that need to be created for installing and managing popular packages are included by default and maintained by the community.
- Inheritance structure: You can specify a organization.rb with shared settings for your entire org (like which printers to install for example), then specify a department.rb with shared settings for your department, then specify a person.rb with your personal settings.
- Limited platform support: Supported on only the latest release of Mac and Windows. Previous versions of Mac and Windows may work, but safety is not guaranteed.
- Resource driven. Attributes will not be used.
- Will use policyfiles and chef 12.5 resource model.
- Will be local (chef-client -z)


What it is not:
- Supported on exotic platforms. If you're using Gentoo or RHEL for your **desktop**, you should know what you're doing on your own.
- Command & Control. Chef Desktop is not an enforcement mechanism for ensuring desktops in your enterprise are managed and dictatorially determining which apps your employees can install.
- Auditing desktops
- For large organizations.
- Attribute driven. Attributes are NOT flexible enough, have global state, have 14 different precedence levels, and are confusing in general.

## MVP

Mac
- Bootstrap
- Update system settings
- Install Homebrew
- Install Atom from Homebrew
- Install Atom plugins
- Make it sexy

## Why other solutions have failed so far

- They aren't simple enough to use -- too many levels of abstraction
- Abstractions are leaky -- require understanding the whole thing to make simple updates
- They don't work on Windows
- They support exotic desktop platforms and make compromises because of it
- They aren't batteries included and require too much work to get started.
- They use attribute or list driven customization and aren't flexible enough when needed
- They don't allow you to specify multiple sources for where packages come from
- They don't have a critical mass of support for popular installations
- The have confusing or un-googable names
- Not a frictionless experience

## List of tools for reference:

* Boxen - https://github.com/boxen
* Chef Pantry - https://github.com/chef-cookbooks/pantry
* ChefDK_Bootstrap Cookbook - nordstrom (installs atom, vagrant, and virtualbox): https://supermarket.chef.io/cookbooks/chefdk_bootstrap
* Winbox (Chef Windows Dev Workstation setup)
* BoxStarter http://boxstarter.org
* A Mac OS X Chef bootstrap (https://gist.github.com/fnichol/1100372) & workstation cookbook (https://github.com/ut-cookbooks/ut_base & https://github.com/ut-cookbooks/ut_workstation) - fnichol
* Battleschool https://github.com/spencergibb/battleschool
* Kitchenplan https://github.com/kitchenplan/kitchenplan

https://github.com/echohack/kitchenplan-config-1
https://github.com/echohack/my_battleschool
https://github.com/echohack/ansible-osx

Example that bootstraps the software listed at https://gist.github.com/mwrock/8278331

http://boxstarter.org/package/url?https://gist.githubusercontent.com/mwrock/8278331/raw/e491685abaeb3f7326af5306fd2f07da1bcd7c51/Boxstarter

-- Solving bootstrap problem resources:

https://raw.githubusercontent.com/Nordstrom/chefdk_bootstrap/master/bootstrap
https://raw.githubusercontent.com/Nordstrom/chefdk_bootstrap/master/bootstrap.ps1

https://github.com/chef/pantry-chef-repo

## TO DO

* Support for Windows (win_default, etc.)
* Support for running multiple cookbooks
* Bootstrap git
* Convert over existing cookbooks to new model
