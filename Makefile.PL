use strict;
use warnings;

BEGIN {
    my @devmods = qw(
        Module::Install::Repository
    );
    my @not_available;

    eval qq{use inc::Module::Install; 1;} or push @not_available, 'inc::Module::Install';
    for my $mod (@devmods) {
        eval qq{require $mod} or push @not_available, $mod;
    }
    if (@not_available) {
        print qq{# The following modules are not available.\n};
        print qq{# `$^X $0 | cpanm` will install them:\n};
        print $_, "\n" for @not_available;
        print "\n";
        exit -1;
    }
}

use inc::Module::Install;

name            ('Date-Holidays-ES');
abstract        ('Spanish holidays for Date::Holidays');
author          ('Florian Merges <fmerges@cpan.org>');
version_from    ('lib/Date/Holidays/ES.pm');
requires        ('Date::Holidays::Super');
requires        ('Date::Easter');
requires        ('Time::JulianDay');
requires        ('DateTime');
build_requires  ('Test::More');

auto_set_repository;

WriteAll;
