
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Base class for a family of (Mega)Traveller character generation modules",
  "AUTHOR" => "Peter L. Berghold <cpan\@berghold.net>",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.3601",
    "RPG::Dice" => "1.1",
    "Test::More" => "0.88",
    "Test::Pod::Coverage" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "RPG-Traveller-Person",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "RPG::Traveller::Person",
  "PREREQ_PM" => {
    "Exporter" => 0,
    "Moose" => 0,
    "RPG::Dice" => 0,
    "constant" => 0,
    "strict" => 0
  },
  "VERSION" => "0.500",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



