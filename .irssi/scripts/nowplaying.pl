use vars qw($VERSION %IRSSI);

use POSIX;
use Irssi qw(timeout_add servers channels command_bind signal_add);
use JSON qw(decode_json);

$VERSION = '0.1';
%IRSSI = (
    authors     => '_404`d',
    contact     => 'simen4000@gmail.com',
    name        => 'Now Playing',
    description => 'Integrates the nowplaying shell command into IRSSI.',
    license     => 'CC 3.0 BY-NC-SA',
);

$interval = 60;

$format_base = "%(meta) \x0314{\x0315%(playtime) %(status) %(duration)\x0314 | \x0314%(progress)%\x0314}";
$format_tvshow = "\x0314{\x0315%(showtitle) \x0314S\x0315%(season) \x0314E\x0315%(episode)\x0314} {\x0315%(episodetitle)\x0314}";
$format_audio = "\x0311%(title) \x0310%(artist) \x0315| \x0313%(album) \x0306Track %(trackno)";
$format_movie = "\x0311%(title)";
$color_status_played_fg = "15";
$color_status_played_bg = "15";
$color_status_unplayed_fg = "14";
$color_status_unplayed_bg = "14";
$length_status = "20";
$char_status_played = "-";
$char_status_unplayed = "-";


$forcedUpdate = 1;
$lastMediaUrl = "";

sub format_base {
    my ($poop, $data, $tmp);
    $data = $_[0];
    $tmp = progbar($data->{'Percentage'});
    $poop = $format_base;
    $poop =~ s/\%\(status\)/$tmp/;
    $poop =~ s/\%\(progress\)/$data->{'Percentage'}/;
    $poop =~ s/\%\(playtime\)/$data->{'Time'}/;
    $poop =~ s/\%\(duration\)/$data->{'Duration'}/;
    $poop =~ s/\%\(player\)/$data->{'Player'}/;
    $poop;
}

sub formater {
	print "checking";
    my $data = decode_json(qx'python ~/.dot/.zsh/nowplaying/nowplaying.py');
    my $currentMediaUrl;
    my $status;
    if ($data->{'PlayStatus'} eq "Playing") {
        my $meta;
        $status = format_base($data);
        if ($data->{'Season'}) {
            # Watching a TV Series
            $meta = $format_tvshow;
            $meta =~ s/\%\(showtitle\)/$data->{'Show Title'}/;
            $meta =~ s/\%\(season\)/$data->{'Season'}/;
            $meta =~ s/\%\(episode\)/$data->{'Episode'}/;
            $meta =~ s/\%\(episodetitle\)/$data->{'Title'}/;
            $status =~ s/\%\(meta\)/$meta/;
        } elsif ($data->{'Type'} eq "Video") {
            # Watching a Movie
            $meta = $format_movie;
            $meta =~ s/\%\(title\)/$data->{'Title'}/;
            $status =~ s/\%\(meta\)/$meta/;
        } elsif ($data->{'Type'} eq "Audio") {
            # Listening to music
            $meta = $format_audio;
            $meta =~ s/\%\(title\)/$data->{'Title'}/;
            $meta =~ s/\%\(artist\)/$data->{'Artist'}/;
            $meta =~ s/\%\(album\)/$data->{'Album'}/;
            $meta =~ s/\%\(trackno\)/$data->{'Track'}/;
            $status =~ s/\%\(meta\)/$meta/;
        }
        $currentMediaUrl = $data->{'Filename'};
    }
    if ( $status && $data->{'Changed'} eq "True" && $currentMediaUrl ne $lastMediaUrl ) {
        announce($status);
    }
}

sub progbar {
    my ($poop, $percent, $pieces, $playedpieces);
    $percent = $_[0];
    $pieces = ( 100 / $length_status);
    $poop = "\x03" . $color_status_played_fg;# . "," . $color_status_played_bg;
    $playedpieces = floor( $percent / $pieces );
    for($i = 0; $i < $playedpieces; $i++) {
        $poop = $poop . $char_status_played;
    }
    $poop = $poop . "\x03" . $color_status_unplayed_fg;# . "," . $color_status_unplayed_bg;
    for($i = ($length_status - $playedpieces); $i > 1; $i--) {
        $poop = $poop . $char_status_unplayed;
    }
    $poop;
}

sub announce {
    my $msg = $_[0];
    foreach(servers()) {
        my $server = $_;
        if ($server->{"tag"} eq "Gameshaft") {
            $server->command('action #Gameshaft '.$msg);
        }
    }
}

command_bind 'np' => sub {
    $forcedUpdate = 1;
    formater();
};

timeout_add( $interval * 1000, \&formater, "NowPlayingTimer" );
