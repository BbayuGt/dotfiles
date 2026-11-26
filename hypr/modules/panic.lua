Panic = false

hl.on("monitor.removed", function ()
    if Panic then hl.exec_cmd("poweroff") end
end)
