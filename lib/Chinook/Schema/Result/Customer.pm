use utf8;
package Chinook::Schema::Result::Customer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::Customer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Customer>

=cut

__PACKAGE__->table("Customer");

=head1 ACCESSORS

=head2 customerid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 firstname

  data_type: 'nvarchar'
  is_nullable: 0
  size: 40

=head2 lastname

  data_type: 'nvarchar'
  is_nullable: 0
  size: 20

=head2 company

  data_type: 'nvarchar'
  is_nullable: 1
  size: 80

=head2 address

  data_type: 'nvarchar'
  is_nullable: 1
  size: 70

=head2 city

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 state

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 country

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 postalcode

  data_type: 'nvarchar'
  is_nullable: 1
  size: 10

=head2 phone

  data_type: 'nvarchar'
  is_nullable: 1
  size: 24

=head2 fax

  data_type: 'nvarchar'
  is_nullable: 1
  size: 24

=head2 email

  data_type: 'nvarchar'
  is_nullable: 0
  size: 60

=head2 supportrepid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "customerid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "firstname",
  { data_type => "nvarchar", is_nullable => 0, size => 40 },
  "lastname",
  { data_type => "nvarchar", is_nullable => 0, size => 20 },
  "company",
  { data_type => "nvarchar", is_nullable => 1, size => 80 },
  "address",
  { data_type => "nvarchar", is_nullable => 1, size => 70 },
  "city",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "state",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "country",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "postalcode",
  { data_type => "nvarchar", is_nullable => 1, size => 10 },
  "phone",
  { data_type => "nvarchar", is_nullable => 1, size => 24 },
  "fax",
  { data_type => "nvarchar", is_nullable => 1, size => 24 },
  "email",
  { data_type => "nvarchar", is_nullable => 0, size => 60 },
  "supportrepid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</customerid>

=back

=cut

__PACKAGE__->set_primary_key("customerid");

=head1 RELATIONS

=head2 invoices

Type: has_many

Related object: L<Chinook::Schema::Result::Invoice>

=cut

__PACKAGE__->has_many(
  "invoices",
  "Chinook::Schema::Result::Invoice",
  { "foreign.customerid" => "self.customerid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 supportrepid

Type: belongs_to

Related object: L<Chinook::Schema::Result::Employee>

=cut

__PACKAGE__->belongs_to(
  "supportrepid",
  "Chinook::Schema::Result::Employee",
  { employeeid => "supportrepid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+QUA8FnWNG+bn1+F4W38dw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
