#!/usr/bin/env perl
use Text::Lorem;
use Getopt::Long;
use Clipboard;

my $nbParagraphs = 0;
my $nbWords = 0;
my $nbSentences = 0;

my $text = Text::Lorem->new();
my $output;
$result = GetOptions ("para=i" => \$nbParagraphs,
                    "words=i"   => \$nbWords,       # string
                    "sentence=i"  => \$nbSentences, # fla
                    "copy" => \$copy);  
              
if(($nbParagraphs == 0) &&($nbWords == 0)&& ($nbSentences == 0) ){
  die "Error missing argument";
}
#If multiple argument are provided we execute only one in this order:
#para>word>sentence
if($nbParagraphs != 0){
  $output = $text->paragraphs($nbParagraphs);
}elsif($nbWords != 0){
  $output = $text->words($nbWords);
}elsif($nbSentences != 0){
  $output = $text->sentences($nbSentences);
}

if($copy) {
  Clipboard->copy($output);
}

print $output