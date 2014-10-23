use utf8;
package Chinook::Schema::Result::InvoiceLine;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Chinook::Schema::Result::InvoiceLine

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<InvoiceLine>

=cut

__PACKAGE__->table("InvoiceLine");

=head1 ACCESSORS

=head2 invoicelineid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 invoiceid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 trackid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 unitprice

  data_type: 'numeric'
  is_nullable: 0
  size: [10,2]

=head2 quantity

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "invoicelineid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "invoiceid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "trackid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "unitprice",
  { data_type => "numeric", is_nullable => 0, size => [10, 2] },
  "quantity",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</invoicelineid>

=back

=cut

__PACKAGE__->set_primary_key("invoicelineid");

=head1 RELATIONS

=head2 invoiceid

Type: belongs_to

Related object: L<Chinook::Schema::Result::Invoice>

=cut

__PACKAGE__->belongs_to(
  "invoiceid",
  "Chinook::Schema::Result::Invoice",
  { invoiceid => "invoiceid" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Pe0YRg+aDHYylPEO5xv4ZQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
