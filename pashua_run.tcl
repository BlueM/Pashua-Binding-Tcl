# Glue code to use Pashua from Tcl
proc pashua_run {script {encoding ""} {path ""}} {

	upvar #0 argv0 appName
	upvar #0 env   envir

	set tempFile [exec /usr/bin/mktemp /tmp/Pashua_XXXXXXXX]
	set handle [open $tempFile w]
	puts $handle $script
	close $handle
	
	# Search for Pashua binary
	set bundlePath "Pashua.app/Contents/MacOS/Pashua"
	set theHome $envir(HOME)
	set theList [list "$appName/Pashua" \
		"$appName/$bundlePath" \
		"/$bundlePath" \
		"[file dirname [info script]]/Pashua" \
		"[file dirname [info script]]/$bundlePath" \
		"./$bundlePath" \
		"/Applications/$bundlePath" \
		"$theHome/Applications/$bundlePath" ]

	if {$path != ""} {
		# Prepend $path to the list of search paths
		set theList [linsert $theList 0 "$path/$bundlePath"]
	}

	if {$encoding != ""} {
		# Set encoding argument
		set encoding "-e $encoding"
	}

	set theBinary ""
	foreach possib $theList {
		if {[file exists $possib]} then {
			if {[file executable $possib]} then {
				set theBinary $possib
				break
			}
		}
	}

	if {$theBinary != ""} {
		set handle [open "|\"$theBinary\" $encoding $tempFile" r]
		while {[eof $handle]==0} {
			gets $handle theLine
			set equals [string first {=} $theLine]
			if {$equals > -1} {
				array set results \
				[list [string range $theLine 0 [expr $equals - 1]] \
				[string range $theLine [expr $equals + 1] end]]
			}
		}
		return [array get results]
		
	} else {
		return ""
	}

}
