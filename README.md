CodeKit2-deploy
===============

Simple Shell script for use with CodeKits2's hooks to deploy to a remote or local server with rsync

NOTES
-----

It pretty rough, but useful none the less, I have it installed in /usr/local/bin, where you will need to give it execute permissions

`
chmod +x /usr/local/bin/codekit-deploy.sh
`

its expects one arg which is the remote (in rsync ssh form) for target directory,
it uses CodeKits CWD/Project Directory as the local target

The script also adds / to insure rsync works on the files in local and target

The script also creates a .backup directory which will backup incremental changes

contact me if you need help

Carl Bowden
carl@16hands.co.nz


