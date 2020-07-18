#!/usr/bin/python3
import sys
import subprocess
import os

# Target path sent through stdin
Target_Path_Input = sys.argv[1]

# Grabbing the current directory
Directory_Path = os.path.dirname(os.path.realpath(__file__))
Directory_Path = Directory_Path+"/Adjusted_Folder_Image.png"

# Pushing processed icon using the bash function
subprocess.Popen(["/bin/bash", "Change_Icon.bash", Target_Path_Input, Directory_Path])
sys.stdout.flush()
