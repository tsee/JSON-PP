#!/usr/bin/perl -w

use strict;

use Test::More;
use strict;

BEGIN { plan tests => 10 };

BEGIN { $ENV{PERL_JSON_BACKEND} = 0; }

use JSON::PP;

my $json = new JSON::PP;


is($json->encode([!1]),   '[""]');
is($json->encode([!!2]), '["1"]');

is($json->encode([ 'a' eq 'b'  ]), '[""]');
is($json->encode([ 'a' eq 'a'  ]), '["1"]');

is($json->encode([ ('a' eq 'b') + 1  ]), '[1]');
is($json->encode([ ('a' eq 'a') + 1  ]), '[2]');

ok(JSON::PP::true eq 'true');
ok(JSON::PP::true eq  '1');
ok(JSON::PP::true == 1);
#isa_ok(JSON::PP::true, JSON->backend . '::Boolean');
isa_ok(JSON::PP::true, 'JSON::PP::Boolean');



