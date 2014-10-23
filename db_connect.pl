#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use DateTime;
use DBI;

use lib './lib';
use Chinook::Schema;
use Chinook::Schema::Result::Album;
use Chinook::Schema::Result::Track;
use Chinook::Schema::Result::Invoice;
use Chinook::Schema::Result::InvoiceLine;

#my $dbh = DBI->connect('dbi:SQLite:dbname=chinook.sqlite',"","") or die $DBI::errstr;
my $schema = Chinook::Schema->connect('dbi:SQLite:dbname=chinook.sqlite', '', '') or die $DBI::errstr;

# set debug on ...
$schema->storage->debug(1);

# get album details ...
my $album = $schema->resultset('Album')->find({ albumid => 1 });

# this works ...
my $title = $album->title;

# this works - but not if I put the 'row result' within the quotes !!!
print "the title is : " . $album->title . "\n";

# get the tracks on this album ..
my @tracks = $schema->resultset('Album')->find({ albumid => 1 })->tracks;
foreach my $track ( @tracks ) {
	print " : " . $track->name . "\n";
}

# get album name - from a track .....
$title = $schema->resultset('Track')->find({ trackid => 1 })->albumid->title;
print "title is $title ...\n";

# insert a new album
#my $new_album = $schema->resultset('Album')->create(
 # {
 #    albumid  => 348,
 #    title    => 'this is my title ...',
 #    artistid => 3,
 # });

# get 'new' albums artists name ...
my $artist = $schema->resultset('Album')->find({ albumid => 348 })->artistid->name;
print "artists name is $artist ...\n";

my $invoice = $schema->resultset('Invoice')->find({ invoiceid => 1 });
my @invoicelines = $invoice->invoice_lines;
foreach my $line (@invoicelines) {
	print "Invoice Line : " . $line->invoicelineid . "\n";
	print "Track Id     : " . $line->trackid->name . "\n";
	print "Price        : " . $line->unitprice . "\n";
	print "Quantity     : " . $line->quantity . "\n";
}
#$dbh->disconnect();
