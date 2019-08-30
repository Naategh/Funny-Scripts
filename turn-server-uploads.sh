#!/bin/bash
# A simple shell script to turn on or off Apache / Nginx / Lighttpd web server upload 
# by editing php.ini or custom.ini file
# Tested on : Debian 8 and Ubuntu LTS server but should work with any Linux and Unix-like system
# ----------------------------------------------------------------------------
# Original Author: nixCraft 

# Path to ini file
cust="/etc/php5/mods-available/custom.ini"

# Ubuntu command to reload php5-fpm
# Update this as per your need. For e.g. Debian 7.x or older use  /sbin/service apache2 restart
# For RHEL/CentOS7 use /sbin/systemctl reload httpd.service 
_reload="/sbin/restart php5-fpm"

# Where is sed located?
_sed="/bin/sed"

# Reload function
_reload(){
        echo "Reloading php5-fpm..."
        $_reload
}

# Turn on uploading
_on(){
        echo "Allowing uploads..."
        $_sed -ie 's/file_uploads=Off/file_uploads=On/' $cust \
        && _reload 
}

# Turn off uploading
_off(){
        echo "Disabling uploads..."
        $_sed -ie 's/file_uploads=On/file_uploads=Off/' $cust \
        && _reload 
}

# Get current status of uploading
_status(){
        echo "Current file upload status in ${cust}..."
        grep -e --color '^file_upload' $cust
}

# Main logic #
arg=$1
case $arg in
        [oO][nN]) _on;;
        [oO][fF][fF]) _off;;
        [sS][tT][aA][tT][uU][sS]) _status;;
        *) echo "Usage: $0 [on|off|status]";;
esac