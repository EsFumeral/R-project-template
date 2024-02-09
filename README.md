# R-project-template

Env settings and command line tools for R development. Rscript, Openjdk &amp; maven.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.


### Prerequisites

* Ubuntu, Debian or CentOS operating system
* A user account with sudo privileges
* Command-line/terminal (CTRL-ALT-T or Applications menu > Accessories > Terminal)

### Installing
---

Clone this repository on your local machine.

```bash
git clone https://github.com/EsFumeral/R-project-template.git

Forking this repository for specific purpose app is recommended
```

## Setting environment values
---

Environment values are preconfigured. See ./settings.template.d folder.


### Generate local settings values from template
---

1. Execute [bin/app_settings.sh](./bin/app_settings.sh) script to create settings folder and .template files will be copied into. If a previous version exists will be backed up.

    ```bash
    bin/app_settings.sh
    ```

2. Optionally execute [bin/app_clearenvbackup.sh](./bin/app_clearenvbackup.sh) to clean previous .backup files in settings folder.

     ```bash
    bin/app_clearenvbackup.sh
    ```

3. Set app name by executing [bin/app_setappname.sh] (bin/app_setappname.sh). Set parameters codapp and app to long application name and short application name respectively.

    ```bash
    bin/app_setappname.sh --codapp=long-application-name --app=shortapplicationname
    ```
    Repeat this step every time app_settings have been executed. Otherwise app name will take default values.

### Update .env settings values
---

Once you have updated local files

1. Execute [bin/app_setenv.sh](./bin/app_setenv.sh) to create an .env file and values configured in settings folder will take effect.
    
    ```bash
    bin/app_setenv.sh
    ```


2. You don't need to execute bin/lib_xxx_utils.sh by yourself. These scripts are sourced from others for read and export values from .env file, and should be updated with care. Sourced scripts are
    * [bin/lib_env_utils.sh](bin/lib_env_utils.sh)
    * [bin/lib_string_utils.sh](bin/lib_string_utils.sh)


### Settings files contents in detail
---

* Values in ${some_value} format are previously configured.
* All vars in a file have a distinctive prefix except 200_jdk, 300_mvn, 400_jboss files.

1. Edit [./settings/100_app](./settings.template.d/100_app.template) file and check variable values as shown

    ```bash
    LONG_APP_NAME=long-app-name
    SHORT_APP_NAME=short-app-name
    ```


2. Edit [./settings/200_jdk](./settings.template.d/200_jdk.template) file. These values set default Java Home and installation target. **The environment scope is local to your script**

    By default, JDK version is 11. See [./settings.template.d/200_jdk.template](./settings.template.d/200_jdk.template) to find some examples of other versions downloading. Also, default target is located at HOME dir.

    ```bash
    JDK11_TARGET=$HOME/java/${LONG_APP_NAME_LOWER}
    ```
    See [bin/jdk_jdkinstall.sh](bin/jdk_jdkinstall.sh) for jdk installation.
    Shortcut to [Installing Java Tools](#installing-java-tools) if more detail is needed.


3. Edit [./settings/900_custom](./settings.template.d/900_custom.template) file.

    These values set any custom value not previously included in other files, like PATH **The environment scope is local to your script**

    ```bash
    # Custom section
    # Use this file for custom app settings

    # End custom section

    # path update section
    PATH=$JBOSS_HOME/bin:$JAVA_HOME/bin:$M2_HOME/bin:$PATH
    # end path update section
    ```

    **Actual values could be different than above once files in setting folder had been edited. Take these only as an example.**

4. Preconfigured values are stored in settings folder and can be used *as is* or locally modified at your discretion
Although is possible to config any type of parameter, passwords should never be set at settings.template.d folder. *All changes will be committed against repo*. Always set critical data at settings local folder and set permission if needed.




## Run

---

1. Clone this repository on your local machine if you didn't yet. 

    ```bash
    git clone https://github.com/EsFumeral/R-project-template.git
    ```

2. Run [docker_install](./bin/docker_install.sh) script to update and install docker.

    ```bash
    ./bin/docker_install.sh
    ```
    Note that we add a new user which default password is "docker" and would better update it, even in preproduction stage.

    ```bash
    sudo useradd -p $(openssl passwd -1 docker) docker -g docker
    ```

    ```
    -p, --password PASSWORD
        The encrypted password, as returned by crypt(3). The default is to disable the password.
        Note: This option is not recommended because the password (or encrypted password) will be visible by users listing the processes.
        You should make sure the password respects the system's password policy. 
    ```

    See [docker_install](./bin/docker_install.sh)

3. Check preconfigured values and change them as explained above if needed.


4. Run [app_setenv](./bin/app_setenv.sh) script. It generates an .env file from settings folder content to be allocated in main folder. When loading env variables, this file will be used as input. Repeat steps 2 and 3 as times as you need.

    ```bash
    ./bin/app.setenv.sh
    ```
    **Please remember run after edit settings. Otherwise, .env will remain unmodified.**

### Installing java tools

---

1. Optionally, run [jdkinstall](./bin/jdk_jdkinstall.sh) script. It downloads a tar.gz file and inflates into preconfigured target. See ./settings/200_jdk file. If jdk version is lower than 9, jdk platform must be manually installed.

    ```bash
    ./bin/jdk_jdkinstall.sh
    ```






---
## Authors

* **gdeignacio**  - [gdeignacio-esliceu](https://github.com/gdeignacio-esliceu)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments


