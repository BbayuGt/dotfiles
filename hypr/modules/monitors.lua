
------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ -- Default Monitor Setting - Fallback
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

hl.monitor({ -- Monitor Laptop
    output   = "desc:Communications Supply Corporation (A division of WESCO) 0x0000",
    mode     = "1920x1200@60",
    position = "auto-left",
    scale    = 1,
})

hl.monitor({ -- Monitor
    output   = "desc:Xiaomi Corporation Mi Monitor",
    mode     = "1920x1080@144",
    vrr      = 1,
    position = "auto-right",
    bitdepth = 10,
    scale    = 1,
})

