use utf8;
package Chinook::Schema::Result::MediaType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::MediaType

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<MediaType>

=cut

__PACKAGE__->table("MediaType");

=head1 ACCESSORS

=head2 mediatypeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'nvarchar'
  is_nullable: 1
  size: 120

=cut

__PACKAGE__->add_columns(
  "mediatypeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "nvarchar", is_nullable => 1, size => 120 },
);

=head1 PRIMARY KEY

=over 4

=item * L</mediatypeid>

=back

=cut

__PACKAGE__->set_primary_key("mediatypeid");

=head1 RELATIONS

=head2 tracks

Type: has_many

Related object: L<Chinook::Schema::Result::Track>

=cut

__PACKAGE__->has_many(
  "tracks",
  "Chinook::Schema::Result::Track",
  { "foreign.mediatypeid" => "self.mediatypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zk80gN45TnQ5MQQeVhGkhg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
