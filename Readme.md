Overview
===========

This is a Tcl language binding (glue code) for using [Pashua](http://www.bluem.net/jump/pashua) from Tcl. Pashua is a Mac OS X application for using native GUI dialog windows in various programming languages.

The repository contains two files: `pashua_run.tcl`, which contains generic code which handles the communication with Pashua, and `example.tcl`, a simple script wich utilizes `pashua_run.tcl` to display a dialog.


Requirements
=============
This code requires Tcl 8 and Pashua. The Tcl executables shipped by Apple since Mac OS X 10.6 can be used to run the code.

It is compatible with Pashua 0.10. It will work with earlier versions of Pashua, but non-ASCII characters will not be displayed correctly, as any versions before 0.10 required an argument for marking input as UTF-8.
