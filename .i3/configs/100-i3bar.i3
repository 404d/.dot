#!/bin/cat
bar {
    id systemline
    status_command /home/sl/dev/StatusCenter/i3bar.sh /home/sl/.dot/statuscenter.ini statuscenter.outputs.i3.i3 systemline
    tray_output none
    strip_workspace_numbers yes
    colors {
        focused_workspace #285577 #285577 #ffffff
        active_workspace #444444 #444444 #dddddd
        inactive_workspace #000000 #000000 #777777
        urgent_workspace #ff0000 #ff0000 #ffffff
    }
}
bar {
    id statusline
    position top
    status_command /home/sl/dev/StatusCenter/i3bar.sh /home/sl/.dot/statuscenter.ini statuscenter.outputs.i3.i3 statusline
    workspace_buttons yes
    binding_mode_indicator no
    colors {
        focused_workspace #000000 #000000 #000000
        active_workspace #000000 #000000 #000000
        inactive_workspace #000000 #000000 #000000
        urgent_workspace #000000 #000000 #000000
    }
}
