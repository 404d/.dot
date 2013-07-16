#!/bin/sh
if [[ `uname` == "Darwin" ]];  then
    export MCPATH="$HOME/Library/Application Support/minecraft"
else
    export MCPATH="$HOME/.minecraft"
fi
function log {
    if [[ ! $VERBOSE == "" ]]; then
        echo $1
    fi
}

function minecraft {
    # Default to launcher with install if not present.
    if [[ "$1" == "" ]]; then
        # Check if the launcher is installed.
        if [ ! -e "$MCPATH/bin/MinecraftLauncher.v2.jar" ]; then
            # Force verbose as we're installing without the user's knowlegde.
            VERBOSE=1 minecraft install
        fi
        # Run the Launcher.
        java -Xmx1024M -Xms512M -jar "$MCPATH/bin/MinecraftLauncher.v2.jar"


    elif [[ "$1" == "install" ]]; then
        # Create Minecraft/bin if not present
        if [ ! -e "$MCPATH/bin" ]; then
            mkdir -p "$MCPATH/bin";
            log "Created path $MCPATH/bin"
        fi
        
        TargetPath="$MCPATH/bin/MinecraftLauncher.v2.jar"
        BinaryURL="https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar"

        log "Downloading MinecraftLauncher.v2.jar to $MCPATH/bin..."
        # Download using wget if present.
        command -v wget &>/dev/null >&2
        if [[ $? == "0" ]]; then
            wget -O $TargetPath $BinaryURL &>/dev/null

        else
            # Fallback to using cURL.
            command -v curl &>/dev/null >&2
            if [[ $? == "0" ]]; then
                curl -o $TargetPath $BinaryURL &>/dev/null

            # No downloader found, complain.
            else
                echo "Neither cURL nor wget was found on your system.\n\nPlease download the Minecraft Launcher from\n\thttp://minecraft.net\nand save it as MinecraftLauncher.v2.jar at\n\t$MCPATH/bin\n"
            fi
        fi
        log "Minecraft Launcher installed. Have a nice day!"

    # Extract the contents of Minecraft.jar to the provided directory.
    elif [[ "$1" == "extract" ]]; then
        if [[ "$2" == "" ]]; then
            echo "Error: No target path specified."
            exit
        fi
        # Create the directory if it doesn't exist.
        if [ ! -e "$2" ]; then
            log "Creating directory $2"
            mkdir -p $2
        fi
        # CD into the target directory.
        prevPWD=`pwd`
        cd $2
        log "Extracting into $2"
        # DO IT.
        jar xf "$MCPATH/bin/minecraft.jar" || echo "Failed extracting."
        # CD back to the original directory in case
        # the user wants to do more stuff there.
        cd $prevPWD


    elif [[ "$1" == "package" ]]; then
        source="."
        if [[ "$2" != "" ]]; then
            source="$2"
        fi
        log "Removing Meta-inf files."
        rm $source/META-INF/MOJANG_C.*
        if [[ $? -gt 0 ]]; then
            log "Meta-inf files doesn't seem to exist."
        fi
        log "Packaging new and changed files into Minecraft.jar"
        jar uf "$MCPATH/bin/minecraft.jar" "$source/" || echo "Failed packaging."
    fi
}
