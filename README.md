<h1 align="center">
  evolve
</h1>
<h4 align="center">A simple wrapper for <a href=https://github.com/Jguer/yay/>Yay</a>, <a href=https://wiki.archlinux.org/index.php/pacman/>Pacman</a>, <a href=https://paludis.exherbo.org/>Paludis</a>, <a href=https://wiki.gentoo.org/wiki/Portage>Portage</a> & <a href=https://wiki.gentoo.org/wiki/Layman>Layman</a>.</h4>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/github/license/Uniminin/evolve?style=for-the-badge">
  <img src="https://img.shields.io/github/issues/Uniminin/evolve?color=violet&style=for-the-badge">
  <img src="https://img.shields.io/github/stars/Uniminin/evolve?style=for-the-badge">
  <img src="https://img.shields.io/github/forks/Uniminin/evolve?color=teal&style=for-the-badge">
  <img src="https://github.com/Uniminin/evolve/blob/master/miscellaneous/evolve-logo.png" width="800" height="550"/>
</p>

## Requirements
* Nim and any Unix OS with Any of:
* Yay
* Pacman
* Paludis
* Portage & Layman

## Installation Instruction
```
$ git clone https://github.com/Uniminin/evolve
$ cd evolve
$ make update (*optional. skip if you've just cloned this repository.)
$ make
$ make install (needs superuser acess, i.e 'sudo/doas make install')
$ make uninstall (needs superuser acess, i.e 'sudo/doas make uninstall')
$ make clean (*optional. To clean compiled binary.)
```

## License :scroll:
This project is licenced under the GNU Affero General Public License V3. For more information, see the `LICENSE` file or visit https://www.gnu.org/licenses/agpl-3.0.
