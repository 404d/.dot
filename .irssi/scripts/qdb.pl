# QDB by ChatNode! Geezer Admin
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
    if ($text =~ m/^\!qdb$/) {
      $page = get "http://bash.org/?random1";
    } else {
      if ($text =~ m/^\!qdb (#)?[0-9]+$/) {
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
      my ($null, $code) = split(/<p class="qt">/, $page, 2);
      my ($quote, $null) = split(/<\/p>/, $code, 2);
      my (@lines) = split(/<br \/>/, $quote);
      my ($null, $temp) = split(/<p class=\"quote\"><a href="\?/, $page, 2);
      my ($id, $null) = split(/"/, $temp, 2);
      foreach(@lines) {
        $_ = "[qdb #".$id."] ".$_;
        $_ =~ s/\&lt\;/</g;
        $_ =~ s/\&gt\;/>/g;
        $_ =~ s/\&nbsp\;/ /g;
        $_ =~ s/\&amp\;/\&/g;
        $_ =~ s/\&quot\;/"/g;
        $server->command("MSG ".$channel." ".$_);
      }
  }

Irssi::signal_add("message public", "event_msg")