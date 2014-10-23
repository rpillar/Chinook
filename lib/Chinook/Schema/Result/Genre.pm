use utf8;
package Chinook::Schema::Result::Genre;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::Genre

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Genre>

=cut

__PACKAGE__->table("Genre");

=head1 ACCESSORS

=head2 genreid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 1
  size: 120

=cut

__PACKAGE__->add_columns(
  "genreid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 1, size => 120 },
);

=head1 PRIMARY KEY

=over 4

=item * L</genreid>

=back

=cut

__PACKAGE__->set_primary_key("genreid");

=head1 RELATIONS

=head2 tracks

Type: has_many

Related object: L<Chinook::Schema::Result::Track>

=cut

__PACKAGE__->has_many(
  "tracks",
  "Chinook::Schema::Result::Track",
  { "foreign.genreid" => "self.genreid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hvtfTzu3T+4gyr0E1337wg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
