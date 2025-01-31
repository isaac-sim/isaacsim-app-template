# Copyright (c) 2023, NVIDIA CORPORATION. All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto. Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.
#

import os
import sys

if sys.platform == "win32":
    pass
else:
    icon_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "omni.isaac.sim.png")
    user_apps_folder = os.path.expanduser("~/.local/share/applications")
    if os.path.exists(user_apps_folder):
        with open(os.path.expanduser("~/.local/share/applications/IsaacSim.desktop"), "w") as file:
            print("Writing Isaac Sim icon file")
            file.write(
                f"""[Desktop Entry]
Version=1.0
Name=Isaac Sim
Icon={icon_path}
Terminal=false
Type=Application
StartupWMClass=IsaacSim"""
            )
