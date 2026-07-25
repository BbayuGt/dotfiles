local dnd_active = false

local function set_dnd(enable)
    if enable and not dnd_active then
        hl.exec_cmd("swaync-client --dnd-on")
        dnd_active = true
    elseif not enable and dnd_active then
        hl.exec_cmd("swaync-client --dnd-off")
        dnd_active = false
    end
end

local function check_fullscreen_dnd()
    local w = hl.get_active_window()

    if w and w.fullscreen >= 2 then
        set_dnd(true)
    else
        set_dnd(false)
    end
end

hl.on("window.fullscreen", function(w)
    check_fullscreen_dnd()
end)

hl.on("window.active", function(w)
    check_fullscreen_dnd()
end)
