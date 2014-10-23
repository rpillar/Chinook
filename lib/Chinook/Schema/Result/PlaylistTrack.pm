use utf8;
package Chinook::Schema::Result::PlaylistTrack;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::PlaylistTrack

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<PlaylistTrack>

=cut

__PACKAGE__->table("PlaylistTrack");

=head1 ACCESSORS

=head2 playlistid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 trackid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "playlistid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "trackid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</playlistid>

=item * L</trackid>

=back

=cut

__PACKAGE__->set_primary_key("playlistid", "trackid");

=head1 RELATIONS

=head2 playlistid

Type: belongs_to

Related object: L<Chinook::Schema::Result::Playlist>

=cut

__PACKAGE__->belongs_to(
  "playlistid",
  "Chinook::Schema::Result::Playlist",
  { playlistid => "playlistid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 trackid

Type: belongs_to

Related object: L<Chinook::Schema::Result::Track>

=cut

__PACKAGE__->belongs_to(
  "trackid",
  "Chinook::Schema::Result::Track",
  { trackid => "trackid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eWWOtLfOZLJ2HBzOiqtSYQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
