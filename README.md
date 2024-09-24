# My dotfiles

This directory contains the dotfiles for my system.
These are not all my own (by far). I will credit all the original authors.

## Requirements

Ensure you have the following installed on your system

I am on MacOS and I am not using homebrew but pkgsrc.

Why pkgsrc ?
(quoting https://github.com/cmacrae/savemacos)

- Precompiled packages from a trusted source
- Signed packages with GPG
- Dead simple makefiles
- A robust multi platform framework
- Can be bootstrapped without any external dependencies other than a C compiler & a shell
- Tried and true, with a huge community of BSD developers behind it (and many devs from other communities)
- A very large collection of packages (up to 15,000)
- Ultra portable framework for use on many other OS's results in high quality ports
- Easy creation of new ports/packages
- Source code & package management are kept separated

Get rid of the whole thing ?

As easy as `sudo rm -r /opt/pkg /var/db/pkgin /etc/{man,}paths.d/pkgsrc`

### Git

```
sudo pkgin install git
```

### Stow

```
sudo pkgin install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/xmailla/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow --dotfiles .
```
