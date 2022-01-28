
# Table of Contents

1.  [Screencast](#orgd04471a)
2.  [Installation](#orgd0c9e9a)
    1.  [Manual](#org3fa5d99)
3.  [Usage](#orgb4a4d0b)
    1.  [Examples](#orgc7aba0d)
    2.  [Tips](#orgfd17259)
4.  [Changelog](#org727de58)
    1.  [1.0.0](#orgeb96103)
5.  [Credits](#orgf7a5699)
6.  [Development](#orgfec962a)
7.  [License](#orgebc594f)

Efficiently create Anki flashcards from your notes.

I created this package to facilitate faster creation of Anki cards while I study
utilizing the fantastic text editing of Emacs.

I mostly use it inside [org-noter](https://github.com/weirdNox/org-noter).


<a id="orgd04471a"></a>

# Screencast

[Basic flashcard](screencasts/ankifier-basic.mp4)


<a id="orgd0c9e9a"></a>

# Installation


<a id="org3fa5d99"></a>

## Manual

Install these packages:

-   `anki-editor`
    While not *required*, this is the package that allows the output of my package
    to be sent to Anki (utilizing the [AnkiConnect](https://ankiweb.net/shared/info/2055492159) addon.)

Then put this file in your load-path, and put this in your init file:

    (require 'ankifier)


<a id="orgb4a4d0b"></a>

# Usage

Run one of these commands on an active region:

-   `ankifier-create-basic-from-region`: Create Basic question(s) from active
    region.
-   `ankifier-create-cloze-from-region`: Create Cloze question(s) from active
    region.
-   Set `ankifier-insert-elsewhere` to `t` if you want the questions to be created
    under a `* Cards` org heading (This is what I mostly do).
    
    The name of the heading can be edited using `ankifier-cards-heading`.

Note that for a **basic** question, the questions must be separated by two newlines
and have a single question mark to indicate the *Question* part and the *Answer*
part.


<a id="orgc7aba0d"></a>

## Examples

What is Emacs?

An extensible, customizable, free/libre text editor — and more.

When was Emacs 27.2 released?

Mar 25, 2021


<a id="orgfd17259"></a>

## Tips

-   You can customize settings in the `ankifier` group.
-   Check out [Power up Anki with Emacs, Org mode, anki-editor and more](https://yiufung.net/post/anki-org/) for ideas
    about general anki-editor use and how to get code highlighting working
    properly.


<a id="org727de58"></a>

# Changelog


<a id="orgeb96103"></a>

## 1.0.0

Initial release.


<a id="orgf7a5699"></a>

# Credits

-   This package would not have been possible without the following packages:
    [anki-editor](https://github.com/louietan/anki-editor), which allows the flash cards to be sent to Anki in the first place.


<a id="orgfec962a"></a>

# Development

Bug reports, feature requests, suggestions are all welcome, keep in mind this is
my first Emacs package!


<a id="orgebc594f"></a>

# License

Check [LICENSE](LICENSE)

