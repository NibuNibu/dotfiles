------------------
---- MONITORS ----
------------------

MonitorAlias = "Virtual-1"

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = MonitorAlias,
    mode     = "1920x1080@60.00Hz",
    position = "0x0",
    scale    = "1",
})

-- just to be sure first 5 workspaces are visible
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = MonitorAlias, persistent = true })    
end




