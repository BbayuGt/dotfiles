
-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function ()
    hl.exec_cmd("export PATH=\"$HOME/.local/bin:$PATH\"")
    hl.exec_cmd("waybar & hyprpaper & hypridle")
    hl.exec_cmd("systemctl start vicinae --user")
    hl.exec_cmd("/usr/lib/pam_kwallet_init")
    hl.exec_cmd("/usr/bin/kwalletd6")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP ELECTRON_OZONE_PLATFORM_HINT XDG_SESSION_TYPE")
    hl.exec_cmd("systemctl start --user hyprpolkitagent.service")
    hl.exec_cmd("/mnt/data/drpcsplit/discord_rpc_proxy")
end)

