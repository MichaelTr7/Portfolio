#!/usr/bin/python3
import sys
import subprocess
import numpy as np
import math
import cv2
import os

Hue_Adjustment_Angle_Input = sys.argv[1]
Saturation_Adjustment_Angle_Input = sys.argv[2]

# Grabbing the current directory
Directory_Path = os.path.dirname(os.path.realpath(__file__))
Directory_Path = Directory_Path+"/Adjusted_Folder_Image.png"

# Array full size printout setting
np.set_printoptions(threshold=sys.maxsize)

# Using an arbitrary target path for the icon change
Target_Path = "/Users/michael/Desktop/Test Folder"
# Target_Path = Target_Path_Input
# Icon_Image_Path = "/Users/michael/Desktop/Icon.png"
Icon_Image_Path = Directory_Path

File_Name = 'Folder_Icon.png'
Folder_Icon = cv2.imread(File_Name, cv2.IMREAD_COLOR)

# Converting image into hue, saturation, value and alpha channels
*_, alpha = cv2.split(Folder_Icon)
HSV_Folder_Icon = cv2.cvtColor(Folder_Icon, cv2.COLOR_BGR2HSV)

# Splitting the HSV image into components
*_, Alpha_Channel = cv2.split(HSV_Folder_Icon)
Hue_Channel, Saturation_Channel, Value_Channel, = cv2.split(HSV_Folder_Icon)

#Applying hue adjustment
Hue_Adjustment_Angle = 95 #Range -> 0 to 360 (default: 0)
Hue_Adjustment_Angle = int(Hue_Adjustment_Angle_Input)
Normalized_Hue_Adjustment_Angle: float = 255*(Hue_Adjustment_Angle/360)
Hue_Channel = Hue_Channel + round(Normalized_Hue_Adjustment_Angle)

# Applying saturation adjustment
Saturation_Adjustment_Angle = 100 #Range -> 0 to 200 (default: 100)
Saturation_Adjustment_Angle = int(Saturation_Adjustment_Angle_Input)
Saturation_Channel = Saturation_Channel - 100 + Saturation_Adjustment_Angle

# Merging the components
HSV_Modified_Folder_Icon = cv2.merge((Hue_Channel, Saturation_Channel, Value_Channel))
BGR_Modified_Folder_Icon = cv2.cvtColor(HSV_Modified_Folder_Icon, cv2.COLOR_HSV2BGR)
result = np.dstack([BGR_Modified_Folder_Icon, Alpha_Channel]) # Add the alpha channel

# Converting back to BGR colour space
cv2.imwrite("Adjusted_Folder_Image.png", result)

print(Hue_Adjustment_Angle_Input)
print(Saturation_Adjustment_Angle_Input)
sys.stdout.flush()
