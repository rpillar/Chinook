use utf8;
package Chinook::Schema::Result::Employee;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::Employee

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Employee>

=cut

__PACKAGE__->table("Employee");

=head1 ACCESSORS

=head2 employeeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 lastname

  data_type: 'nvarchar'
  is_nullable: 0
  size: 20

=head2 firstname

  data_type: 'nvarchar'
  is_nullable: 0
  size: 20

=head2 title

  data_type: 'nvarchar'
  is_nullable: 1
  size: 30

=head2 reportsto

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 birthdate

  data_type: 'datetime'
  is_nullable: 1

=head2 hiredate

  data_type: 'datetime'
  is_nullable: 1

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
  is_nullable: 1
  size: 60

=cut

__PACKAGE__->add_columns(
  "employeeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "lastname",
  { data_type => "nvarchar", is_nullable => 0, size => 20 },
  "firstname",
  { data_type => "nvarchar", is_nullable => 0, size => 20 },
  "title",
  { data_type => "nvarchar", is_nullable => 1, size => 30 },
  "reportsto",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "birthdate",
  { data_type => "datetime", is_nullable => 1 },
  "hiredate",
  { data_type => "datetime", is_nullable => 1 },
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
  { data_type => "nvarchar", is_nullable => 1, size => 60 },
);

=head1 PRIMARY KEY

=over 4

=item * L</employeeid>

=back

=cut

__PACKAGE__->set_primary_key("employeeid");

=head1 RELATIONS

=head2 customers

Type: has_many

Related object: L<Chinook::Schema::Result::Customer>

=cut

__PACKAGE__->has_many(
  "customers",
  "Chinook::Schema::Result::Customer",
  { "foreign.supportrepid" => "self.employeeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 employees

Type: has_many

Related object: L<Chinook::Schema::Result::Employee>

=cut

__PACKAGE__->has_many(
  "employees",
  "Chinook::Schema::Result::Employee",
  { "foreign.reportsto" => "self.employeeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 reportsto

Type: belongs_to

Related object: L<Chinook::Schema::Result::Employee>

=cut

__PACKAGE__->belongs_to(
  "reportsto",
  "Chinook::Schema::Result::Employee",
  { employeeid => "reportsto" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0yI+EFM/4/YrBCXV1lHTiw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
