# FML by ChatNode! Geezer Admin
use Irssi;
use strict;
use vars qw($VERSION %IRSSI $SCRIPT_NAME);

use LWP::Simple qw(get);

sub event_msg {
    # $data = "nick/#channel :text"
    my ($server, $data, $nick, $address) = @_;
    my ($target, $text) = split(/ :/, $data, 2);
    my ($channel) = @_[4];
    my ($text) = @_[1];
    my ($page) = 0;
    if ($text =~ m/^\!fml$/) {
      $page = get "http://www.fmylife.com/random";
    } else {
      if (0 and $text =~ m/^\!qdb (#)?[0-9]+$/) {
        $text =~ m/[0-9]+$/;
        $page = get "http://bash.org/?" . $&;
      } else {
        return 1;
      }
    }
      if (!$page and $&) {
        $server->command("MSG ".$channel." [qdb] Invalid ID ".$&);
        return 1;
      }
      if (!$page) {
        $server->command("MSG ".$channel." [qdb] Couldn't reach QDB");
        return 1;
      }
      my ($null, $code) = split(/<div class="post article" id="[0-9]*"><p>/, $page, 2);
      my ($quote, $null) = split(/FML<\/a>/, $code, 2);
      $quote =~ s/<a href="\/[a-z]*\// /g;
      $quote =~ s/<\/a>/ /g;
      my (@lines) = split(/[0-9]*" class="fmllink">/, $quote);
      my ($id) = 1;
      my ($line) = "";
      foreach(@lines) {
        if ( !( $_ =~ m/^ *$/ ) ) {
          $line = $line . $_;
        }
      }
      $line = "[fml #".$id."] ".$line . "FML";
      $line =~ s/\&lt\;/</g;
      $line =~ s/\&gt\;/>/g;
      $line =~ s/\&nbsp\;/ /g;
      $line =~ s/\&amp\;/\&/g;
      $line =~ s/\&quot\;/"/g;
      $line =~ s/  */ /g;
      $server->command("MSG ".$channel." ".$line);
  }

Irssi::signal_add("message public", "event_msg")