#!/bin/bash
#
# The Chinook database: https://chinookdatabase.codeplex.com/.
#
# This code assumes you're using GraphViz2 V 2.07.

#rm chinook.sqlite

sqlite3 -init chinook.sqlite.sql chinook.sqlite

DBI_DSN=dbi:SQLite:dbname=chinook.sqlite; export DBI_DSN
DBI_USER=; export DBI_USER
DBI_PASS=; export DBI_PASS

rm chinook.sqlite.schema.svg

perl ~/perl.modules/GraphViz2/scripts/dbi.schema.pl svg chinook.sqlite.schema.svg

echo Expected size of chinook.sqlite.schema.svg is 15,229 bytes

ls -aFl chinook.sqlite.schema.svg
