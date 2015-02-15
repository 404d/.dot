use vars qw($VERSION %IRSSI);

use Irssi::TextUI;

$VERSION = "0.1";
%IRSSI = (
    authors     => "_404`d",
    contact     => "simen4000\@gmail.com",
    name        => "statusbar",
    description => "Recreates the status bar elements in IRSSI for use with the powerline theme.",
    license     => "CC 3.0 BY-NC-SA"
);

$lastTime;

sub time {
    my ($item, $size) = @_;
    my $time = "%7%k ";
    my $clock = "";
    @timeData = localtime(time);
    if ( $timeData[2] < 10 ) {
       $clock .= "0";
    }
    $clock .= $timeData[2] . ":";
    if ( $timeData[1] < 10 ) {
        $clock .= "0";
    }
    $clock .= $timeData[1] . ":";
    if ( $timeData[0] < 10 ) {
        $clock .= "0";
    }
    $clock .= $timeData[0];
    $time .= $clock;
    $time .= " %4%w ";
    $lastTime = $clock;
    $item->default_handler($size, $time, 1);
}

sub refresh_time {
    Irssi::statusbar_items_redraw('time');
}

Irssi::timeout_add(1000, \&refresh_time, "TimeRefresher");

Irssi::statusbar_item_register("time", "$0", "time");
Irssi::statusbars_recreate_items();
