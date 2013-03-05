#!/bin/sh
if [[ `uname` == "Darwin" ]];  then
    export MCPATH="$HOME/Library/Application Support/minecraft"
else
    export MCPATH="$HOME/.minecraft"
fi
function minecraft {
    if [[ "$1" == "install" ]]; then
        if [ ! -e "$MCPATH/bin" ]; then
            mkdir -p "$MCPATH/bin"
            echo "Created path $MCPATH/bin"
        fi
        echo "Downloading MinecraftLauncher.jar to $MCPATH/bin..."
        wget -O "$MCPATH/bin/MinecraftLauncher.jar" "https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft.jar"
        echo "Minecraft Launcher installed. Have a nice day!"
    elif [[ "$1" == "" ]]; then
        if [ ! -e "$MCPATH/bin/MinecraftLauncher.jar" ]; then
            minecraft install
        fi
        java -Xmx1024M -Xms512M -cp "$MCPATH/bin/MinecraftLauncher.jar" net.minecraft.LauncherFrame
    elif [[ "$1" == "extract" ]]; then
        if [[ "$2" == "" ]]; then
            echo "No target path specified."
            exit
        fi
        if [ ! -e "$2" ]; then
            echo "Creating directory $2"
            mkdir -p $2
        fi
        prevPWD=`pwd`
        cd $2
        echo "Extracting into $2"
        jar xf "$MCPATH/bin/minecraft.jar"
        cd $prevPWD
    elif [[ "$1" == "package" ]]; then
        source="."
        if [[ "$2" != "" ]]; then
            source="$2"
        fi
        rm "$source/META-INF/MOJANG_C.*"
        jar uf "$MCPATH/bin/minecraft.jar" "$source"
    fi
}
