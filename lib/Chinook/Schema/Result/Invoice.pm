use utf8;
package Chinook::Schema::Result::Invoice;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::Invoice

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Invoice>

=cut

__PACKAGE__->table("Invoice");

=head1 ACCESSORS

=head2 invoiceid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 customerid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 invoicedate

  data_type: 'datetime'
  is_nullable: 0

=head2 billingaddress

  data_type: 'nvarchar'
  is_nullable: 1
  size: 70

=head2 billingcity

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 billingstate

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 billingcountry

  data_type: 'nvarchar'
  is_nullable: 1
  size: 40

=head2 billingpostalcode

  data_type: 'nvarchar'
  is_nullable: 1
  size: 10

=head2 total

  data_type: 'numeric'
  is_nullable: 0
  size: [10,2]

=cut

__PACKAGE__->add_columns(
  "invoiceid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "customerid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "invoicedate",
  { data_type => "datetime", is_nullable => 0 },
  "billingaddress",
  { data_type => "nvarchar", is_nullable => 1, size => 70 },
  "billingcity",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "billingstate",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "billingcountry",
  { data_type => "nvarchar", is_nullable => 1, size => 40 },
  "billingpostalcode",
  { data_type => "nvarchar", is_nullable => 1, size => 10 },
  "total",
  { data_type => "numeric", is_nullable => 0, size => [10, 2] },
);

=head1 PRIMARY KEY

=over 4

=item * L</invoiceid>

=back

=cut

__PACKAGE__->set_primary_key("invoiceid");

=head1 RELATIONS

=head2 customerid

Type: belongs_to

Related object: L<Chinook::Schema::Result::Customer>

=cut

__PACKAGE__->belongs_to(
  "customerid",
  "Chinook::Schema::Result::Customer",
  { customerid => "customerid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 invoice_lines

Type: has_many

Related object: L<Chinook::Schema::Result::InvoiceLine>

=cut

__PACKAGE__->has_many(
  "invoice_lines",
  "Chinook::Schema::Result::InvoiceLine",
  { "foreign.invoiceid" => "self.invoiceid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-19 13:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DwwIWfmBg4tu8vS5cMFEeQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
