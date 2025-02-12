# Isaac Sim App Template

<p align="center">
  <img src="readme-assets/kit_app_template_banner.png" width=100% />
</p>


## Overview

This repository provides [Isaac Sim](https://docs.isaacsim.omniverse.nvidia.com/latest/index.html) applications pre-built and ready to use. These applications mirror the .kit configs provided alongside Isaac Sim binary release packages.
- For most users its recommended to use these [prebuilt applications](#prebuilt).
- For more advanced users that want to customize their experience continue to the [Create and Configure New Application From Template](#templates) section





### <a name="prebuilt"></a> Pre Built Isaac Sim Applications


Applications that contain `base` are minimal Isaac Sim applications that do not contain all of the GUI utilities. Applications that contain `full` enable a more complete set of extensions by default.

| Kit experience app file          | Description                                                                                            |
|----------------------------------|--------------------------------------------------------------------------------------------------------|
| isaacsim.exp.base.kit            | Base .kit file contains most of the extensions and settings used by other .kit files                                                         |
| isaacsim.exp.base.xr.vr.kit      | Base + VR extensions                                                                                                                         |
| isaacsim.exp.base.zero_delay.kit | Base + settings to force zero delay between rendering and simulation at a cost of reduced performance.                                       |
| isaacsim.exp.full.kit            | Full Isaac Sim application, mirrors `isaac-sim.sh` from Isaac Sim binary installs                                                            |
| isaacsim.exp.full.fabric.kit     | Full + Fabric enabled for simulation, in certain cases this will improve performance at the cost of disabling updates from simulation to USD |
| isaacsim.exp.full.streaming.kit  | Full + Streaming enabled                                                                                                                     |

These applications should be used as a quick way for users to start using Isaac Sim, If you are interested in building your own applications continue to the next section.

## Quick Start

This section guides you through creating your first Kit SDK-based Application using the `isaacsim-app-template` repository. For a more comprehensive explanation of functionality previewed here, reference the following [Tutorial](https://docs.omniverse.nvidia.com/kit/docs/kit-app-template/latest/docs/intro.html) for an in-depth exploration.


### Prerequisites and Environment Setup
Please see [Kit App Template: Prerequisites and Environment Setup](https://github.com/NVIDIA-Omniverse/kit-app-template?tab=readme-ov-file#prerequisites-and-environment-setup)
for more information on recommended software and system specifications.


### 1. Clone the Repository

Begin by cloning the `isaacsim-app-template` to your local workspace:

#### 1a. Clone

```bash
git clone https://github.com/isaac-sim/isaacsim-app-template.git
```

#### 1b. Navigate to Cloned Directory

```bash
cd isaacsim-app-template
```



### 2. Use prebuilt IsaacSim applications

Several default IsaacSim applications are provided and can be built using the following command.

**Linux:**
```bash
./repo.sh build
```

**Windows:**
```powershell
.\repo.bat build
```

These applications can be launched by going into the build directly and running the associated .sh. For example:

**Linux:**
```bash
./_build/linux-x86_64/release/isaacsim.exp.full.kit.sh
```

**Windows:**
```powershell
.\_build\windows-x86_64\release\isaacsim.exp.full.kit.bat
```

### 3. Using Standalone Python

Standalone python scripts are also supported by default and can be executed like so

**Linux:**
```bash
./_build/linux-x86_64/release/python.sh source/standalone_examples/hello_world.py
```

**Windows:**
```powershell
.\_build\windows-x86_64\release\python.bat source\standalone_examples\hello_world.py
```

### 4. Creating Templates

Creating additional templates is not required to run the default applications. You can stop here and run IsaacSim using the generated .sh files or continue to learn how to make your own applications.

## <a name="templates"></a> Create and Configure New Application From Template

Details about the Isaac Sim templates provided and how to create, build and launch can be found here:

- **[IsaacSim](./templates/apps/isaacsim)**: App definitions for isaac sim workflows. Two templates are provided: a base/minimal template and a full template with all isaac sim extensions enabled.



For a more in depth introduction to the `kit-app-template` system please see [kit-app-template](https://github.com/NVIDIA-Omniverse/kit-app-template/blob/main/README.md) and [Kit App Template: Deeper Understanding](https://github.com/NVIDIA-Omniverse/kit-app-template?tab=readme-ov-file#a-deeper-understanding). In contrast This repository focuses on getting up and running with the isaac sim app templates and does not cover some of the finer details about the `kit-app-template` system

## Extension Templates


Enhance Omniverse capabilities with extension templates to create new extensions that can be added to your application:

- **[Basic Python](./templates/extensions/basic_python)**: The minimal definition of an Omniverse Python Extension.

- **[Basic C++](./templates/extensions/basic_cpp)**: The minimal definition of an Omniverse C++ Extension.

   **Note for Windows C++ Developers** : This template requires `"platform:windows-x86_64".enabled` and `link_host_toolchain` within the `repo.toml` file be set to `true`. For additional C++ configuration information [see here](readme-assets/additional-docs/windows_developer_configuration.md).

- **[Python UI](./templates/extensions/python_ui)**: An extension that provides an easily extendable Python-based user interface.


## Additional Resources

- [Additional Included Tools](https://github.com/NVIDIA-Omniverse/kit-app-template/blob/main/README.md#tools)

- [Kit App Template Companion Tutorial](https://docs.omniverse.nvidia.com/kit/docs/kit-app-template/latest/docs/intro.html)

- [Usage and Troubleshooting](readme-assets/additional-docs/usage_and_troubleshooting.md)

- [Developer Bundle Extensions](readme-assets/additional-docs/developer_bundle_extensions.md)

- [Omniverse Kit SDK Manual](https://docs.omniverse.nvidia.com/kit/docs/kit-manual/latest/index.html)

- [NVIDIA Isaac Sim Documentation](https://docs.isaacsim.omniverse.nvidia.com/latest/index.html)


## Troubleshooting

- If you are seeing errors when building the app template, please try cleaning the repository using ```git clean -fdx``` and building/creating a new template. Commit any work you want to preserve before doing this.
- If you are seeing errors when running either a pre-built application or a template based app, please use the `--reset-user` launch argument.

    **Linux:**
    ```bash
    ./repo.sh launch -- --reset-user
    ```
    **Windows:**
    ```powershell
    .\repo.bat launch -- --reset-user
    ```

    Or if launching an app via the .sh/.bat directly appent ```--reset-user``` directly

- Run the following if you see errors similar to : ```[Error] [omni.ui] Failed to upload UI Image```
  ```
  git lfs install
  git lfs pull
  ```
  This will ensure that all lfs content is pulled correctly

- If you see the following errors, close and open a new terminal
  ```
  [Error] [carb.livestream-rtc.plugin] Stream Server: starting the server failed, 0x800B1002
  [Error] [carb.livestream-rtc.plugin] Could not initialize streaming components
  [Error] [carb.livestream-rtc.plugin] Couldn't initialize the capture device.
  ```

## License

Development using the Omniverse Kit SDK is subject to the licensing terms detailed [here](https://docs.omniverse.nvidia.com/dev-guide/latest/common/NVIDIA_Omniverse_License_Agreement.html).

## Data Collection
The Omniverse Kit SDK collects anonymous usage data to help improve software performance and aid in diagnostic purposes. Rest assured, no personal information such as user email, name or any other field is collected.

To learn more about what data is collected, how we use it and how you can change the data collection setting [see details page](readme-assets/additional-docs/data_collection_and_use.md).

## Contributing

We provide this source code as-is and are currently not accepting outside contributions.
