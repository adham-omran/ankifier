
# Table of Contents

1.  [Screenshots](#orgf83c509)
    1.  [Gif](#org77388de)
2.  [Installation](#org2380571)
    1.  [Manual](#org8ecda4d)
3.  [Usage](#orgca38220)
    1.  [Tips](#org0afdd73)
4.  [Changelog](#org2c6d495)
    1.  [1.0.0](#orgb88e1ca)
5.  [Credits](#org2227b2d)
6.  [Development](#org684303f)
7.  [License](#orga4ddd9f)

This is my package.  It is nice.  You should try it.


<a id="orgf83c509"></a>

# Screenshots

This gif shows how to use the basic ankifier.el functions.


<a id="org77388de"></a>

## TODO Gif


<a id="org2380571"></a>

# Installation


<a id="org8ecda4d"></a>

## Manual

Install these required packages:

-   `anki-editor`

Then put this file in your load-path, and put this in your init file:

    (require 'ankifier)


<a id="orgca38220"></a>

# Usage

Run one of these commands:

-   `ankifier-create-basic-from-region`: Create Basic question(s) from active region.
-   `ankifier-create-cloze-from-region`: Create Cloze question(s) from active region.


<a id="org0afdd73"></a>

## Tips

-   You can customize settings in the `ankifier` group.


<a id="org2c6d495"></a>

# Changelog


<a id="orgb88e1ca"></a>

## 1.0.0

Initial release.


<a id="org2227b2d"></a>

# Credits

This package would not have been possible without the following packages:
[anki-editor](https://github.com/louietan/anki-editor), which allows the flash cards to be sent to Anki in the first place.


<a id="org684303f"></a>

# Development

Bug reports, feature requests, suggestions are all welcome, keep in mind this is
my first Emacs package!


<a id="orga4ddd9f"></a>

# License

GPLv3

