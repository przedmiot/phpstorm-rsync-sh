# phpstorm-rsync-sh
How to deploy files using rsync instead of ftp in Intellij IDEs?

1. Windows
    1. Clone this repository to a chosen local location.
       For a purpose of this manual we assume that it is C:\repos\phpstorm-rsync-sh.
    1. Install Cygwin with Rsync
       Download Cygwin from https://cygwin.com/install.html. During selecting of packages make sure that cygwin and openssh are chosen and pending to install.
    1. Make Phpstorm (or other JetBrain's IDE) external tool
       * Push CTRL + ALT +S or simply click File -> Settings.
       * Type "external tools" in a search field to narrow options.
       * Chose "External Tools" tab and click a plus sign on the right part of a displayed window. A new external tool dialog should appear. 
       * Name your external too as you want (e.g. "Deploy by Rsync")
       * "Program" field - input a path to bash.exe binary from a Cygwin (e.g. "C:\Cygwin\bin\bash.exe") 
       * "Argument" field - input `--login [local path to rsync.sh from this repo] [your login@deployment server url] [path to your local ssh key] $ProjectFileDir$ $ProjectName$`, Example: `--login C:\repos\phpstorm-rsync-sh\rsync.sh "user@your.deployment.server.com" "/home/user/.ssh/rsa-no-pass" $ProjectFileDir$ $ProjectName$`
       * Set Cygwin binaries dir as a working dir
       * Optional: check "Open console for tool output" and its both children-values if you want to see what is happening during rsyncing.   
         
         ![screenshot](https://github.com/przedmiot/phpstorm-rsync-sh/screenshots/main/new_external_tool.png?raw=true)
       
    1. Add a keybord shortcut
    
1. Linux
