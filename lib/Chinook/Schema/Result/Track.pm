use utf8;
package Chinook::Schema::Result::Track;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::Track

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Track>

=cut

__PACKAGE__->table("Track");

=head1 ACCESSORS

=head2 trackid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 0
  size: 200

=head2 albumid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 mediatypeid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 genreid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 composer

  data_type: 'nvarchar'
  is_nullable: 1
  size: 220

=head2 milliseconds

  data_type: 'integer'
  is_nullable: 0

=head2 bytes

  data_type: 'integer'
  is_nullable: 1

=head2 unitprice

  data_type: 'numeric'
  is_nullable: 0
  size: [10,2]

=cut

__PACKAGE__->add_columns(
  "trackid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 0, size => 200 },
  "albumid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "mediatypeid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "genreid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "composer",
  { data_type => "nvarchar", is_nullable => 1, size => 220 },
  "milliseconds",
  { data_type => "integer", is_nullable => 0 },
  "bytes",
  { data_type => "integer", is_nullable => 1 },
  "unitprice",
  { data_type => "numeric", is_nullable => 0, size => [10, 2] },
);

=head1 PRIMARY KEY

=over 4

=item * L</trackid>

=back

=cut

__PACKAGE__->set_primary_key("trackid");

=head1 RELATIONS

=head2 albumid

Type: belongs_to

Related object: L<Chinook::Schema::Result::Album>

=cut

__PACKAGE__->belongs_to(
  "albumid",
  "Chinook::Schema::Result::Album",
  { albumid => "albumid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 genreid

Type: belongs_to

Related object: L<Chinook::Schema::Result::Genre>

=cut

__PACKAGE__->belongs_to(
  "genreid",
  "Chinook::Schema::Result::Genre",
  { genreid => "genreid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 invoice_lines

Type: has_many

Related object: L<Chinook::Schema::Result::InvoiceLine>

=cut

__PACKAGE__->has_many(
  "invoice_lines",
  "Chinook::Schema::Result::InvoiceLine",
  { "foreign.trackid" => "self.trackid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 mediatypeid

Type: belongs_to

Related object: L<Chinook::Schema::Result::MediaType>

=cut

__PACKAGE__->belongs_to(
  "mediatypeid",
  "Chinook::Schema::Result::MediaType",
  { mediatypeid => "mediatypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 playlist_tracks

Type: has_many

Related object: L<Chinook::Schema::Result::PlaylistTrack>

=cut

__PACKAGE__->has_many(
  "playlist_tracks",
  "Chinook::Schema::Result::PlaylistTrack",
  { "foreign.trackid" => "self.trackid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 playlistids

Type: many_to_many

Composing rels: L</playlist_tracks> -> playlistid

=cut

__PACKAGE__->many_to_many("playlistids", "playlist_tracks", "playlistid");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5idCHnNE7kHvEvnHaG2r5g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
