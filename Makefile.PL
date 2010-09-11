require 5.00503;
use strict;
use ExtUtils::MakeMaker;

print <<EOF;
Welcome to JSON::PP
===================

 ************************** CAUTION **************************
 * This is 'JSON version 2' or higher and there are many     *
 * differences to version 1.xx                               *
 * Please check applications that were using the old version *
 * for compatibility.                                        *
 *   See to 'INCOMPATIBLE CHANGES TO OLD VERSION' and 'TIPS' *
 *************************************************************

EOF

WriteMakefile(
    'NAME'          => 'JSON::PP',
    'VERSION_FROM'  => 'lib/JSON/PP.pm', # finds $VERSION
    'PREREQ_PM'     => {
              'Test::More'  => 0,
              'JSON::PP5005' => '2.00',
    },
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/JSON/PP.pm', # retrieve abstract from module
       AUTHOR     => 'Makamaka Hannyaharamitu, E<lt>makamaka[at]cpan.orgE<gt>') : ()),
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002 ? ('LICENSE' => 'perl', ) : () ),

    ( $ExtUtils::MakeMaker::VERSION >= 6.46 ? (
        'META_MERGE' => {
            resources => {
                repository  =>      'http://github.com/makamaka/JSON',
            },
        } ) : ()
    ),
);

