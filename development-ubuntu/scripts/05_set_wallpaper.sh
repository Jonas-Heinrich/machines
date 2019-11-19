#!/bin/bash
source "/vagrant/scripts/common.sh"

function downloadWallpaper {
    wget -O ~/wallpaper.jpg https://wallpaperaccess.com/full/25580.jpg
}

downloadWallpaper