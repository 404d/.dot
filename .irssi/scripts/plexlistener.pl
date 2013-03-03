use vars qw($VERSION %IRSSI);

use LWP::Simple qw(get);
use POSIX;
use Irssi qw(timeout_add servers channels command_bind signal_add);
use IO::File;

$VERSION = '0.20';
%IRSSI = (
	authors		=> '_404`d',
	contact		=> 'simen4000@gmail.com',
	name		=> 'Plex Client Listener',
	description	=> 'Posts the currently playing item in Plex to your current channels.',
	license		=> 'CC 3.0 BY-NC-ND',
);

our $timer;
our $interval = 1;
our $prevPlayData = "";
our $forced = 0;
our ($msgTarget,$msgServer);

sub timersub {
    my $page = get "http://127.0.0.1:3000/xbmcCmds/xbmcHttp?command=GetCurrentlyPlaying";
    if ($page) {
        if ($page =~ m/\<li\>PlayStatus:Playing/) { #
            my ($announce, $currPlayData);
            if ( $page =~ m/\<li\>Season:/) {
                $page =~ m/\<li\>Title:(.*?)\n/;
                my $episodetitle = "\x0313" . $1 . " \x0315]";
                
                $page =~ m/\<li\>Show Title:(.*?)\n/;
                my $episodeinfo = "[ \x0311" . $1;
                my $title = $1;
                
                $page =~ m/\<li\>Season:([0-9]*?)\n/;
                $episodeinfo = $episodeinfo . " \x0310S\x0311" . $1;
                
                $page =~ m/\<li\>Episode:([0-9]*?)\n/;
                $episodeinfo = $episodeinfo . " \x0310E\x0311" . $1;
                
                my ( $time, $duration, $percent );
                $page =~ m/\<li\>Percentage:([0-9]*?)\n/;
                $percent = $1;
                $page =~ m/\<li\>Time:(.*?)\n/;
                $time = $1;
                $page =~ m/\<li\>Duration:(.*?)\n/;
                $duration = $1;
                my $parts = floor($percent / 5);
                my $progress = "\x0311,11";
                my $rest = 20;
                for($i = 0; $i < $parts; $i++) {
                    $progress = $progress . "-";
                    $rest--;
                }
                $progress = $progress . "\x0310,10";
                for($i = $rest; $i != 0; $i--) {
                    $progress = $progress . "-";
                    $rest--;
                }
                $progress = $progress . "\x03";
                
                $currPlayData = "\x0315" . $episodeinfo . "\x0315 | ". $episodetitle;
                if ( $title ne "" && ( $time ne "00:00" && $time ne "00:00:00" ) ) {
                    $announce = "\x0315" . $episodeinfo . "\x0315 | ". $episodetitle . " \x0315« " . $progress . " \x0311" . $percent . "% - ".$time." / ".$duration." \x0315» Plex Media Center";
                }            
            } elsif ( $page =~ m/\<li\>Type:Video/ ) {
                $page =~ m/\<li\>Title:(.*?)\n/;
                my $title = "[ \x0311" . $1 . " \x0315]";
                
                my ( $time, $duration, $percent );
                $page =~ m/\<li\>Percentage:([0-9]*?)\n/;
                $percent = $1;
                $page =~ m/\<li\>Time:(.*?)\n/;
                $time = $1;
                $page =~ m/\<li\>Duration:(.*?)\n/;
                $duration = $1;
                
                my $parts = floor($percent / 5);
                my $progress = "\x0311,11";
                my $rest = 20;
                for($i = 0; $i < $parts; $i++) {
                    $progress = $progress . "-";
                    $rest--;
                }
                $progress = $progress . "\x0310,10";
                for($i = $rest; $i != 0; $i--) {
                    $progress = $progress . "-";
                    $rest--;
                }
                $progress = $progress . "\x03";
                
                $currPlayData = "\x0315" . $title;
                
                if ( $title ne "" && ( $time ne "00:00" && $time ne "00:00:00" ) ) {
                    $announce = "\x0315" . $title . " \x0315« " . $progress . "\x0315 \x0311" . $percent . "% - ".$time." / ".$duration." \x0315» Plex Media Center";
                }
            } elsif ( $page =~ m/\<li\>Type:Audio/ ) {
                $page =~ m/\<li\>Title:(.*?)\n/;
                my $title = "[ \x0311" . $1 . " \x0310";
                
                $page =~ m/\<li\>Artist:(.*?)\n/;
                $title = $title . $1 . " \x0315| \x0313";
                
                $page =~ m/\<li\>Album:(.*?)\n/;
                $title = $title . $1 . " \x0306Track ";

                $page =~ m/\<li\>Track:([0-9]*)\n/;
                $title = $title . $1 . " \x0315]";
                
                my ( $time, $duration, $percent );
                $page =~ m/\<li\>Percentage:([0-9]*?)\n/;
                $percent = $1;
                $page =~ m/\<li\>Time:(.*?)\n/;
                $time = $1;
                $page =~ m/\<li\>Duration:(.*?)\n/;
                $duration = $1;
                
                my $parts = floor($percent / 5);
                my $progress = "\x0311,11";
                my $rest = 20;
                for($i = 0; $i < $parts; $i++) {
                    $progress = $progress . "-";
                    $rest--;
                }
                $progress = $progress . "\x0310,10";
                for($i = $rest; $i != 0; $i--) {
                    $progress = $progress . "-";
                    $rest--;
                }
                $progress = $progress . "\x03";
                
                $currPlayData = "\x0315" . $title;
                if ( $duration ne "" && ( $time ne "00:00" && $time ne "00:00:00" ) ) {
                    $announce = "\x0315" . $title . " \x0315« " . $progress . " \x0311" . $percent . "% - ".$time." / ".$duration." \x0315» Plex Media Center";
                }
            } else {
                $announce = 0;
            }
# Debug            
#    print "Prev: " . $prevPlayData;
#    print " Now: " . $currPlayData;
#    print "Frcd: ".$forced == 1;
#    print $prevPlayData ne $currPlayData;
            
            # Announce
            if ( $announce && $announce ne 0 && $prevPlayData ne $currPlayData  ) {
                $prevPlayData = $currPlayData;
                if ( $msgServer && $msgTarget ) {
                    $msgServer->command('action '.$target." " . $announce);
                } else {
                foreach (servers()) {
                    my $server = $_;
                        foreach (channels()) {
 	                        $server->command('action '.$_->{name}." " . $announce);
                        }
                    }
                }
            } elsif ( $announce && $forced ) {
                $prevPlayData = $currPlayData;
                $forced = 0;
                if ( $msgServer && $msgTarget ) {
                    $msgServer->command('action '.$msgTarget." " . $announce);
                } else {
                foreach (servers()) {
                    my $server = $_;
                        foreach (channels()) {
 	                        $server->command('action '.$_->{name}." " . $announce);
                        }
                    }
                }
            }
            
            $msgServer = 0;
            $msgTarget = 0;
        } else {
            $prevPlayData = "";
        }
    }
}

sub localChat {
	my ($server, $msg, $target) = @_;
	if ($msg =~ m/^\.plex/ || $msg =~ m/\<(.*?)\> \.plex/) {
	$forced = 1;
	$msgTarget = $target;
	$msgServer = $server;
	timersub();
	}
}

sub incoming {
	my ($server, $msg, $nick, $address, $target) = @_;
	if ($msg =~ m/^\.plex/ || $msg =~ m/\<(.*?)\> \.plex/) {
	$forced = 1;
	$msgTarget = $target;
	$msgServer = $server;
	timersub();
	}
}

signal_add("message public", "incoming");
signal_add("message own_public", "localChat");

command_bind 'plex' => sub {
    $forced = 1;
    timersub();
};

timeout_add( $interval * 1000, \&timersub, "PlexTimer" );
timersub();
