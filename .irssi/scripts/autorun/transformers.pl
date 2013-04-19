use Irssi;
use utf8;

sub event_input_msg {
    my ($msg, $server, $witem, $force_lang) = @_;
    if ($msg =~ m/^\>.+$/) {
        $msg = "\x033".$msg;
    } else {
        $msg =~ s/\<3/\x034<3\x03\N{U+200B}/;
    }
    Irssi::signal_continue($msg, $server, $witem);
}

Irssi::signal_add("send text", "event_input_msg");
