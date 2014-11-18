# Tries to find the filesystem path to the executable
# in the Pashua.app application bundle
proc find_pashua {{path ""}} {

	upvar #0 argv0 appName
	upvar #0 env   envir

	set bundlePath "Pashua.app/Contents/MacOS/Pashua"
	set homeDir $envir(HOME)
	set theList [list "$appName/Pashua" \
		"$appName/$bundlePath" \
		"/$bundlePath" \
		"[file dirname [info script]]/Pashua" \
		"[file dirname [info script]]/$bundlePath" \
		"./$bundlePath" \
		"/Applications/$bundlePath" \
		"$homeDir/Applications/$bundlePath" ]

	if {$path != ""} {
		# Prepend $path to the list of search paths
		set theList [linsert $theList 0 "$path/$bundlePath"]
	}

	set theBinary ""
	foreach possib $theList {
		if {[file exists $possib]} then {
			if {[file executable $possib]} then {
				return $possib
			}
		}
	}

	return ""
}

# Displays a Pashua dialog with the given configuration
proc pashua_run {script {path ""}} {

	set tempFile [exec /usr/bin/mktemp /tmp/Pashua_XXXXXXXX]
	set handle [open $tempFile w]
	puts $handle $script
	close $handle

	set theBinary [find_pashua $path]

	if {$theBinary != ""} {
		set handle [open "|\"$theBinary\" $tempFile" r]
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
	}

	return ""
}
