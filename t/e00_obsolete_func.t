
use Test::More;
use strict;
BEGIN { plan tests => 2 };
BEGIN { $ENV{PERL_JSON_BACKEND} = 0; }
use JSON::PP;
#########################

my $json = JSON::PP->new;

my $js = 'abc';

# these are obsolete in JSON::PP. JSON still provides the interface
eval 'to_json($js)';
ok($@ && $@ =~ /renamed/);
eval 'from_json($js)';
ok($@ && $@ =~ /renamed/);


