# Copyright (C) 2017 SUSE LLC
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <http://www.gnu.org/licenses/>.

package OpenQA::Parser::Result::LTP::Test;
use Mojo::Base 'OpenQA::Parser::Result';

has environment => sub { OpenQA::Parser::Result::LTP::Environment->new() };
has test        => sub { OpenQA::Parser::Result::LTP::SubTest->new() };
has [qw(status test_fqn)];

sub to_hash {
    {
        test_fqn => $_[0]->test_fqn(),
        status   => $_[0]->status(),
        (test        => $_[0]->test->to_hash) x !!($_[0]->test),
        (environment => $_[0]->environment->to_hash) x !!($_[0]->environment),
    };
}

1;
