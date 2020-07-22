# Bash script for replacing Mac folder icons

# Grabbing the folder path and local Folder_Icon.png path from stdin
    folderpath="$1"
    icon="$2"

# Recursively deleting the old icons
    rm -rf "$folderpath"$'/icon\r'

# Adding a finder/local icon to an image file and redirect to > /dev/null
    sips -i "$icon" >/dev/null

# Only read files with icns
    DeRez -only icns "$icon" > /tmp/icns.rsrc

# Appending the new icon based on the filer path from stdin
    Rez -append /tmp/icns.rsrc -o "$folderpath"$'/icon\r'

# Recursively remove custom icons
    SetFile -a C "$folderpath"

# Setting the icon image to be invisble in the finder
    SetFile -a V "$folderpath"$'/icon\r'
    SetFile -a V "$folderpath"$'/icon\r'
    SetFile -a V "$folderpath"$'/icon\r'


# # Repetition in case MacOS does not refresh the finder icons upon first iteration
#     rm -rf "$folderpath"$'/icon\r'
#     sips -i "$icon" >/dev/null
#     DeRez -only icns "$icon" > /tmp/icns.rsrc
#     Rez -append /tmp/icns.rsrc -o "$folderpath"$'/icon\r'
#     SetFile -a C "$folderpath"
#     SetFile -a V "$folderpath"$'/icon\r'
