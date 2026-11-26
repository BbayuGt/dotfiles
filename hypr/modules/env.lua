

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Useful Env
hl.env("BROWSER", "librewolf")
hl.env("EDITOR", "nvim")
hl.env("LIBVIRT_DEFAULT_URI", "qemu:///system")

-- Toolkit backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- Others
hl.env("GDK_WAYLAND_DISABLE","ext_background_effect_manager_v1")
hl.env("BROWSER", "brave")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("ELECTRON_ENABLE_WAYLAND", "1")
hl.env("SSH_AUTH_SOCK", "$HOME/.bitwarden-ssh-agent.sock")
--hl.env("HYPRCURSOR_THEME", "NimiNightmare")
hl.env("HYPRCURSOR_SIZE", "50")
