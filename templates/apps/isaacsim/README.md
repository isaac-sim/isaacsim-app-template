# IsaacSim App Templates

![IsaacSim Image](../../../readme-assets/kit_base_editor.png)


## Overview

The IsaacSim App Templates provide a starting point for developers aiming to create interactive or headless applications for robotics authoring/simulation/testing or synthetic data generation workflows.

### Key Features

Minimal Template for faster startup and less resource usage. This template is better for headless applications where the UI will not be used. This is similar to the default app used when running standalone python with SimulationApp. The full template should be used for a complete experience. This is similar to the default IsaacSim experience.

| Application | Config | Description |
|---|---|---|
| isaacsim.exp.template.base isaacsim.exp.template.full | _fabric.kit | Fabric enabled for simulation. Use this for better performance with complex robots and physics heavy scenes. Enabling fabric disabled updates back to USD so some APIs to retrieve transforms may not work. This can also be used for better performance for ROS2 use cases. |
| isaacsim.exp.template.base | _replicator.kit | This application config enables all replicator extensions and is a good starting point for data generation specific workflows. |
| isaacsim.exp.template.base | _ros2.kit | This configuration enables the ROS2 bridge and is useful for ROS2 simulation workflows. |
| isaacsim.exp.template.base isaacsim.exp.template.full | _streaming.kit | This config enables streaming and applies settings needed to make streaming work, use this as a starting point for adding headless streaming to your application |
| isaacsim.exp.template.base isaacsim.exp.template.full | _zero_delay.kit | This config applies settings to force zero delay between rendering and simulation. This is a useful simulation mode for SDG, RL, ROS2 where you want to ensure there is zero frame offset between what is simulated and the transforms you are reading from simulation and what is being rendered. This simulation mode will be slower as computation between the render thread and main thread is not overlapped. |



## Usage

This section provides instructions for the setup and use of the IsaacSim Application Template.

### Getting Started

To get started with the IsaacSim template, ensure your development environment meets the prerequisites outlined in the top-level [**README**](../../../README.md#prerequisites-and-environment-setup).

> **NOTE:** Example commands should be executed in **powershell** in Windows and **terminal** in Linux.

#### Cloning the Repository

```bash
git clone https://github.com/isaac-sim/isaacsim-app-template.git
cd isaacsim-app-template
```

#### Create New Application

**Linux:**
```bash
./repo.sh template new
```

**Windows:**
```powershell
.\repo.bat template new
```

> **NOTE:** If this is your first time running the `template new` tool, you'll be prompted to accept the Omniverse Licensing Terms.

Follow the prompt instructions:
- **? Select with arrow keys what you want to create:** Application
- **? Select with arrow keys your desired template:** Minimal Sim Application or Full Sim Application
- **? Enter name of application .kit file [name-spaced, lowercase, alphanumeric]:** [set application name]
- **? Enter application_display_name:** [set application display name]
- **? Enter version:**: [set application version]

### Build and Launch

#### Build your application using the provided build scripts:
Note that the build step will build all applications contained in the `source` directory. Outside of initial experimentation, it is recommended that you build only the application you are actively developing.

**Linux:**
```bash
./repo.sh build
```
**Windows:**
```powershell
.\repo.bat build
```

 If you experience issues related to build, please see the [Usage and Troubleshooting](../../../readme-assets/additional-docs/usage_and_troubleshooting.md) section for additional information.

#### Launch your application:

**Linux:**
```bash
./repo.sh launch
```
**Windows:**
```powershell
.\repo.bat launch
```

**? Select with arrow keys which App would you like to launch:** [Select the desired editor application]

> **NOTE:** The initial startup may take a 5 to 8 minutes as shaders compile for the first time. After initial shader compilation, startup time will reduce dramatically.

![Launched IsaacSim Full](../../../readme-assets/isaacsim_full.png)

### Where to Go From Here
For more guidance on extending the IsaacSim Template, visit the [Kit App Template Companion Tutorial - Extending Editor Applications](https://docs.omniverse.nvidia.com/kit/docs/kit-app-template/latest/docs/extending_editors.html). This tutorial offers a step-by-step guide to help you understand the template's structure and customize it to suit your needs.

### Testing
Applications and their associated extensions can be tested using the `repo test` tooling provided. Each application template includes an initial test suite that can be run to verify the application's functionality.

> **NOTE:** Testing will only be run on applications and extensions within the build directory. **A successful build is required before testing.**

**Linux:**
```bash
./repo.sh test
```

**Windows:**
```powershell
.\repo.bat test
```

### Customization

#### Enable Extension
- On launch of the Application enable the developer bundle by adding the `--dev-bundle` or `-d` flag to the launch command.

    **Linux:**
    ```bash
    ./repo.sh launch --dev-bundle
    ```
    **Windows:**
    ```powershell
    .\repo.bat launch --dev-bundle
    ```
- From the running application select `Developer` > `Extensions`

- Browse and enable extensions of interest from the Extension Manager.
    - Enabling the extensions within the Extension Manager UI will allow you to try out the features of the extension in the currently running application.

    - To permanently add the extension to the application, you will need to add the extension to the `.kit` file. For example, adding the Layer View extension would require adding `omni.kit.widget.layers` to the dependencies section of the `.kit` file.

- For additional information on the Developer Bundle Extensions, refer to the [Developer Bundle Extensions](../../../readme-assets/additional-docs/developer_bundle_extensions.md) documentation.

#### Create Custom Extension

**Linux:**
```bash
./repo.sh template new
```

**Windows:**
```powershell
.\repo.bat template new
```

Follow the prompt instructions:
- **? Select with arrow keys what you want to create:** Extension
- **? Select with arrow keys your desired template:**: [choose extension template]
- **? Enter name of extension [name-spaced, lowercase, alphanumeric]:**: [set extension name]
- **? Enter extension_display_name:**: [set extension display name]
- **? Enter version:**: [set extension version]


#### Adding Extension to .kit File
**Importantly** For an extension to become a persistent part of an application, the extension will need to be added to the `.kit` file.
For example it can be added to one of the provided .kit files like `source/apps/isaacsim.exp.full.kit`, or a custom template `.kit` that you have created.

```toml
[dependencies]
"extension.name" = {}
```

#### Build with New Extensions
After a new extension has been added to the `.kit` file, the application should be rebuilt to ensure extensions are populated to the build directory.


### Packaging and Deployment

For deploying your application, create a deployable package using the `package` command:

**Linux:**
```bash
./repo.sh package
```
**Windows:**
```powershell
.\repo.bat package
```

By default, the `package` command will name the package based on the `name` value contained in the `repo.toml` file at the root of the repository. **By default, this value is set to `kit-app-template`.** Modify this value to set a persistent package name for your application.

Alternatively, you can specify a package name using the `--name` flag:

**Linux:**
```bash
./repo.sh package --name <package_name>
```
**Windows:**
```powershell
.\repo.bat package --name <package_name>
```

This will bundle your application into a distributable format, ready for deployment on compatible platforms.

:warning: **Important Note for Packaging:** Because the packaging operation will package everything within the `source/` directory the package version will need to be set independently of a given `kit` file.  **The version is set within the `tools/VERSION.md` file.**

#### Launching a Package

Applications packaged using the `package` command can be launched using the `launch` command:

**Linux:**
```bash
./repo.sh launch --package <full-path-to-package>
```
**Windows:**
```powershell
.\repo.bat launch --package <full-path-to-package>
```

> **NOTE:** This behavior is not supported when packaging with the `--thin` flag.

### Containerization (Linux Only)

Containerization is currently not fully supported for the issac sim app templates. Certain functionality or apps may not work correctly when packaging or launching. You can experiment with this feature using information provided [here](https://github.com/NVIDIA-Omniverse/kit-app-template/blob/main/readme-assets/additional-docs/kit_app_template_tooling_guide.md).

## Additional Learning

- [Kit App Template Companion Tutorial](https://docs.omniverse.nvidia.com/kit/docs/kit-app-template/latest/docs/intro.html)
