use utf8;
package Chinook::Schema::Result::Album;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::Album

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Album>

=cut

__PACKAGE__->table("Album");

=head1 ACCESSORS

=head2 albumid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'nvarchar'
  is_nullable: 0
  size: 160

=head2 artistid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "albumid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "nvarchar", is_nullable => 0, size => 160 },
  "artistid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</albumid>

=back

=cut

__PACKAGE__->set_primary_key("albumid");

=head1 RELATIONS

=head2 artistid

Type: belongs_to

Related object: L<Chinook::Schema::Result::Artist>

=cut

__PACKAGE__->belongs_to(
  "artistid",
  "Chinook::Schema::Result::Artist",
  { artistid => "artistid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 tracks

Type: has_many

Related object: L<Chinook::Schema::Result::Track>

=cut

__PACKAGE__->has_many(
  "tracks",
  "Chinook::Schema::Result::Track",
  { "foreign.albumid" => "self.albumid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZvA6CEqWauczxdr5rBvPng


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
