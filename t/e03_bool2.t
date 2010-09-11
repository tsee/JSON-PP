use Test::More;

BEGIN { plan tests => 26 };

BEGIN { $ENV{PERL_JSON_BACKEND} = 0; }
use JSON::PP;

is(encode_json([JSON::PP::true]),  q|[true]|);
is(encode_json([JSON::PP::false]), q|[false]|);
is(encode_json([JSON::PP::null]),  q|[null]|);

my $jsontext = q|[true,false,null]|;
my $obj      = decode_json($jsontext);

isa_ok($obj->[0], 'JSON::PP::Boolean');
isa_ok($obj->[1], 'JSON::PP::Boolean');
ok(!defined $obj->[2], 'null is undef');

ok($obj->[0] == 1);
ok($obj->[0] != 0);
ok($obj->[1] == 0);
ok($obj->[1] != 1);

ok($obj->[0] eq 'true', 'eq true');
ok($obj->[0] ne 'false', 'ne false');
ok($obj->[1] eq 'false', 'eq false');
ok($obj->[1] ne 'true', 'ne true');

ok($obj->[0] eq $obj->[0]);
ok($obj->[0] ne $obj->[1]);

ok(JSON::PP::true  eq 'true');
ok(JSON::PP::true  ne 'false');
ok(JSON::PP::true  ne 'null');
ok(JSON::PP::false eq 'false');
ok(JSON::PP::false ne 'true');
ok(JSON::PP::false ne 'null');
ok(!defined JSON::PP::null);

is(decode_json('[true]' )->[0], JSON::PP::true);
is(decode_json('[false]')->[0], JSON::PP::false);
is(decode_json('[null]' )->[0],  JSON::PP::null);

