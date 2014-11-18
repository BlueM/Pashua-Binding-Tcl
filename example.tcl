#!/usr/bin/tclsh

#
# USAGE INFORMATION:
# As you can see this text, you obviously have opened the file in a text editor.
# 
# If you would like to *run* this example rather than *read* it, you
# should open Terminal.app, drag this document's icon onto the terminal
# window, bring Terminal.app to the foreground (if necessary) and hit return.
# 
if {[file exists "[file dirname [info script]]/pashua_run.tcl"]} {
	source "[file dirname [info script]]/pashua_run.tcl"
} else {
	source pashua_run.tcl
}

set config "# Set transparency: 0 is transparent, 1 is opaque
*.transparency=0.95

# Set window title
*.title = Introducing Pashua

# Introductory text
tb.type = text
tb.default = Pashua is an application for generating dialog windows from programming languages which lack support for creating native GUIs on Mac OS X. Any information you enter in this example window will be returned to the calling script when you hit \"OK\"; if you decide to click \"Cancel\" or press \"Esc\" instead, no values will be returned. This window demonstrates nine of the GUI widgets that are currently available. You can find a full list of all GUI elements and their corresponding attributes in the documentation that is included with Pashua.
tb.height = 276
tb.width = 310
tb.x = 340
tb.y = 44


# Add a text field
tx.type = textfield
tx.label = Example textfield
tx.default = Textfield content
tx.width = 310

# Add a filesystem browser
ob.type = openbrowser
ob.label = Example filesystem browser (textfield + open panel)
ob.width=310
ob.tooltip = Blabla filesystem browser

# Define radiobuttons
rb.type = radiobutton
rb.label = Example radiobuttons
rb.option = Radiobutton item #1
rb.option = Radiobutton item #2
rb.option = Radiobutton item #3
rb.option = Radiobutton item #4
rb.default = Radiobutton item #2

# Add a popup menu
pop.type = popup
pop.label = Example popup menu
pop.width = 310
pop.option = Popup menu item #1
pop.option = Popup menu item #2
pop.default = Popup menu item #2

# Add a checkbox
chk1.type = checkbox
chk1.label = Pashua offers checkboxes, too
chk1.rely = -18
chk1.default = 1

# Add another one
chk2.type = checkbox
chk2.label = But this one is disabled
chk2.disabled = 1

# Add a cancel button with default label
cb.type=cancelbutton

"

# Set the images' paths relative to this file's path / 
# skip images if they can not be found in this file's path
set icon "[file dirname [info script]]/.icon.png"
set bgimg "[file dirname [info script]]/.demo.png"

if {[file exists $icon]} then {
	# Display Pashua's icon
	append config "img.type = image\nimg.x = 530\nimg.y = 255\nimg.path = $icon\n";
}

if {[file exists $bgimg]} then {
	# Display background image
	append config "bg.type = image\nbg.x = 30\nbg.y = 2\nbg.path = $bgimg\n";
}

set res [pashua_run $config]

array set x $res
if {$x(cb)==1} then {
	puts "Looks like the dialog was cancelled"
} else {
	puts "Pashua returned the following values:"
	puts " cb   = $x(cb)"
	puts " chk1 = $x(chk1)"
	puts " chk2 = $x(chk2)"
	puts " ob   = $x(ob)"
	puts " pop  = $x(pop)"
	puts " rb   = $x(rb)"
	puts " tx   = $x(tx)"
}
