use utf8;
package Chinook::Schema::Result::Playlist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::Playlist

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Playlist>

=cut

__PACKAGE__->table("Playlist");

=head1 ACCESSORS

=head2 playlistid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 1
  size: 120

=cut

__PACKAGE__->add_columns(
  "playlistid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 1, size => 120 },
);

=head1 PRIMARY KEY

=over 4

=item * L</playlistid>

=back

=cut

__PACKAGE__->set_primary_key("playlistid");

=head1 RELATIONS

=head2 playlist_tracks

Type: has_many

Related object: L<Chinook::Schema::Result::PlaylistTrack>

=cut

__PACKAGE__->has_many(
  "playlist_tracks",
  "Chinook::Schema::Result::PlaylistTrack",
  { "foreign.playlistid" => "self.playlistid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 trackids

Type: many_to_many

Composing rels: L</playlist_tracks> -> trackid

=cut

__PACKAGE__->many_to_many("trackids", "playlist_tracks", "trackid");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w3MBsDDVYk4o8I0vPWlgcw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
