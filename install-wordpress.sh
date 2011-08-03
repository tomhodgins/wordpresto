#! /bin/bash

######
##  This script will download, configure, and help you install Wordpress
##
##  To install this script as a program simply execute this as root:
##  $ cp install-wordpress.sh /usr/bin/install-wordpress
##  Now you can run the script by typing 'install-wordpress' in any folder
##
##  File originally created by tomhodgins@gmail.com
##  Further edits contributed by:
##  
######

echo "Welcome to the Wonderful Wordpress Installer!"

# Download the latest Wordpress package
echo "Fetching Wordpress"
curl -O http://wordpress.org/latest.zip

# Quietly unzip Wordpress and move all files into current directory
echo "Extracting Wordpress"
unzip -q latest.zip
rm latest.zip
mv wordpress/* .
rmdir wordpress
echo "Wordpress extracted"

# Fetch salt data and insert into the config file
curl -o salt.txt https://api.wordpress.org/secret-key/1.1/salt/
sed '45,52d'  wp-config-sample.php > wp-config-stripped.php
sed '44 r salt.txt' wp-config-stripped.php > wp-config.php
rm salt.txt
rm wp-config-sample.php
rm wp-config-stripped.php
echo "Sample config file setup"

# Remove the Dolly plugin from Wordpress
rm -rf wp-content/plugins/hello.php

#Get the Database Name
echo "What is the database name?"
read DBNAME
echo "%s/database_name_here/$DBNAME/g
w
q
" | ex wp-config.php

#Get the Database Username
echo "What is the database username?"
read DBUSER
echo "%s/username_here/$DBUSER/g
w
q
" | ex wp-config.php


#Get the Database Password
echo "What is the database password?"
read DBPASS
echo "%s/password_here/$DBPASS/g
w
q
" | ex wp-config.php

#Get the Database Location
echo "Where is the database located? (for default, type localhost)"
read LOCATION
echo "%s/localhost/$LOCATION/g
w
q
" | ex wp-config.php

# All done
echo "Wordpress installed: please visit the site in browser to finish setup"