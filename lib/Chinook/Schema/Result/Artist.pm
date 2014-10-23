use utf8;
package Chinook::Schema::Result::Artist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::Artist

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Artist>

=cut

__PACKAGE__->table("Artist");

=head1 ACCESSORS

=head2 artistid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 1
  size: 120

=cut

__PACKAGE__->add_columns(
  "artistid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 1, size => 120 },
);

=head1 PRIMARY KEY

=over 4

=item * L</artistid>

=back

=cut

__PACKAGE__->set_primary_key("artistid");

=head1 RELATIONS

=head2 albums

Type: has_many

Related object: L<Chinook::Schema::Result::Album>

=cut

__PACKAGE__->has_many(
  "albums",
  "Chinook::Schema::Result::Album",
  { "foreign.artistid" => "self.artistid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mobywNsY1shfw4XkmiuHFw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
