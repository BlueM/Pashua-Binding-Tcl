Overview
===========

This is a Tcl language binding (glue code) for using [Pashua](https://www.bluem.net/jump/pashua) from Tcl. Pashua is a Mac OS X application for using native GUI dialog windows in various programming languages.

This code can be found in a GitHub repository at https://github.com/BlueM/Pashua-Binding-Tcl. For examples in other programming languages, see https://github.com/BlueM/Pashua-Bindings.

Other related links:
* [Pashua homepage](https://www.bluem.net/jump/pashua)
* [Pashua repository on GitHub](https://github.com/BlueM/Pashua)


Usage
======
This repository contains two source code files:

* “example.tcl” is an example, which does not do much more than define how the dialog window should look like and use the functions in the second file.
* “pashua.tcl” contains two generic functions, one of which can be used to find the Pashua executable, while the other one displays the dialog and parses/returns the values entered into the dialog window.

Per default, “example.tcl” tries to load “pashua.tcl” from the same folder it is in.

Of course, you will need Pashua on your Mac to run the example. The code expects Pashua.app in one of the “typical” locations, such as the global or the user’s “Applications” folder, or in the folder which contains “example.php”, but will prefer a Pashua version in `/Volumes/Pashua` (which is the mounted path of the Pashua distribution disk image).


Compatibility
=============
This code requires Tcl 8 and Pashua and should run with Tcl executables shipped by Apple since Mac OS X 10.6.

It is compatible with Pashua 0.10. It will work with earlier versions of Pashua, but non-ASCII characters will not be displayed correctly, as any versions before 0.10 required an argument for marking input as UTF-8.


Author
=========
This code was mainly written by Bruce M. Axtens, with some additions and changes by Carsten Blüm.


License
=========
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
