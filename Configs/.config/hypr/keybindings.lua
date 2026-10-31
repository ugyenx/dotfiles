local terminal    = "kitty"
-- local fileManager = "nautilus --new-window"
local fileManager = "thunar"
-- local fileManager = "pcmanfm"
local editor      = "code"
local browser     = "zen-browser"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local ipc = "noctalia msg "

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

hl.bind(
    mainMod .. " + Return",
    hl.dsp.exec_cmd(terminal),
    { description = "Open terminal" }
)

local closeWindowBind = hl.bind(
    mainMod .. " + Q",
    hl.dsp.window.close(),
    { description = "Close current window" }
)

-- closeWindowBind:set_enabled(false)

hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
    { description = "Exit Hyprland" }
)
hl.bind(
    mainMod .. " + B",
    hl.dsp.exec_cmd(browser),
    { description = "Open Browser" }
)

hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManager),
    { description = "Open file manager" }
)

hl.bind(
    mainMod .. " + SHIFT + SPACE",
    hl.dsp.window.float({ action = "toggle" }),
    { description = "Toggle floating window" }
)

hl.bind(
    mainMod .. " + C",
    hl.dsp.exec_cmd(editor),
    { description = "Open code editor" }
)

hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo(),
    { description = "Toggle pseudo-tiling" }
)

hl.bind(
    mainMod .. " + G",
    hl.dsp.window.swap({ next = true }),
    { description = "Swap window position" }
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit"),
    { description = "Toggle split direction" }
)

hl.bind(
    mainMod .. " + F",
    hl.dsp.window.fullscreen({
        mode = "maximized",
        action = "toggle"
    }),
    { description = "Toggle maximized mode" }
)

hl.bind(
    mainMod .. " + SHIFT + F",
    hl.dsp.window.fullscreen({
        mode = "fullscreen",
        action = "toggle"
    }),
    { description = "Toggle fullscreen mode" }
)

-- Move focus with mainMod + arrow keys

hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" }),
    { description = "Focus window to the left" }
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" }),
    { description = "Focus window to the right" }
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" }),
    { description = "Focus window above" }
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" }),
    { description = "Focus window below" }
)

-- Window Resize using keys

hl.bind(
    mainMod .. " + SHIFT + right",
    hl.dsp.window.resize({ x = 80, y = 0, relative = true }),
    {
        repeating = true,
        description = "Increase window width"
    }
)

hl.bind(
    mainMod .. " + SHIFT + left",
    hl.dsp.window.resize({ x = -80, y = 0, relative = true }),
    {
        repeating = true,
        description = "Decrease window width"
    }
)

hl.bind(
    mainMod .. " + SHIFT + down",
    hl.dsp.window.resize({ x = 0, y = 80, relative = true }),
    {
        repeating = true,
        description = "Increase window height"
    }
)

hl.bind(
    mainMod .. " + SHIFT + up",
    hl.dsp.window.resize({ x = 0, y = -80, relative = true }),
    {
        repeating = true,
        description = "Decrease window height"
    }
)

-- Switch workspaces with mainMod + [0-9]

-- Move active window to a workspace with mainMod + SHIFT + [0-9]

for i = 1, 10 do

    local key = i % 10 -- 10 maps to key 0

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }),
        { description = "Switch to workspace " .. i }
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }),
        { description = "Move window to workspace " .. i }
    )

end

-- Example special workspace (scratchpad)

hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic"),
    { description = "Toggle special workspace" }
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" }),
    { description = "Move window to special workspace" }
)

-- Scroll through existing workspaces with mainMod + scroll

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" }),
    { description = "Switch to next workspace" }
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" }),
    { description = "Switch to previous workspace" }
)

-- Move/resize windows with mainMod + LMB/RMB and dragging

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    {
        mouse = true,
        description = "Move window with mouse"
    }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    {
        mouse = true,
        description = "Resize window with mouse"
    }
)

-- Laptop multimedia keys for volume and LCD brightness

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    {
        locked = true,
        repeating = true,
        description = "Increase system volume"
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    {
        locked = true,
        repeating = true,
        description = "Decrease system volume"
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    {
        locked = true,
        repeating = true,
        description = "Toggle system mute"
    }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    {
        locked = true,
        repeating = true,
        description = "Toggle microphone mute"
    }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    {
        locked = true,
        repeating = true,
        description = "Increase screen brightness"
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    {
        locked = true,
        repeating = true,
        description = "Decrease screen brightness"
    }
)

-- Requires playerctl

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    {
        locked = true,
        description = "Play next track"
    }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true,
        description = "Play or pause media"
    }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true,
        description = "Play or pause media"
    }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    {
        locked = true,
        description = "Play previous track"
    }
)

-- Noctalia Keybindings

-- Core binds

hl.bind(
    mainMod .. "+Space",
    hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"),
    { description = "Open Noctalia launcher" }
)

hl.bind(
    mainMod .. "+A",
    hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"),
    { description = "Open Noctalia control center" }
)

hl.bind(
    mainMod .. "+comma",
    hl.dsp.exec_cmd(ipc .. "settings-toggle"),
    { description = "Open Noctalia settings" }
)

hl.bind(
    "ALT + Tab",
    hl.dsp.exec_cmd(ipc .. "window-switcher"),
    { description = "Open Noctalia window switcher" }
)

hl.bind(
    mainMod .. " + SHIFT + V",
    hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"),
    { description = "Open clipboard history" }
)

hl.bind(
    mainMod .. " + K",
    hl.dsp.exec_cmd(ipc .. "panel-toggle kenn/keybind-cheatsheet:cheatsheet"),
    { description = "Open keybind cheatsheet" }
)
hl.bind(
    mainMod .. " + SHIFT + K",
    hl.dsp.exec_cmd(ipc .. "panel-toggle blackbartblues/keymap:panel"),
    { description = "Open keymap cheatsheet" }
)
hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd(ipc .. "session lock"),
    { description = "Lock session" }
)

hl.bind(
    mainMod .. " + Backspace",
    hl.dsp.exec_cmd(ipc .. "panel-toggle session"),
    { description = "Open session menu" }
)

-- Media keys

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(ipc .. "volume-up"),
    { description = "Increase volume with Noctalia" }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(ipc .. "volume-down"),
    { description = "Decrease volume with Noctalia" }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(ipc .. "volume-mute"),
    { description = "Toggle volume mute with Noctalia" }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(ipc .. "brightness-up"),
    { description = "Increase brightness with Noctalia" }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(ipc .. "brightness-down"),
    { description = "Decrease brightness with Noctalia" }
)

-- Screenshot

hl.bind(
    "Print",
    hl.dsp.exec_cmd("noctalia msg screenshot-region"),
    { description = "Take a region screenshot" }
)

hl.bind(
    mainMod .. " + Print",
    hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"),
    { description = "Take a fullscreen screenshot" }
)

hl.bind(
    mainMod .. " + SHIFT + Print",
    hl.dsp.exec_cmd("noctalia msg screenshot-annotate"),
    { description = "Take and annotate screenshot" }
)


-- Voxtype push-to-talk: hold SUPER + V to dictate
hl.bind(
    "SUPER + V",
    hl.dsp.exec_cmd("voxtype record start"),
    { description = "Voxtype: Start recording" }
)

hl.bind(
    "SUPER + V",
    hl.dsp.exec_cmd("voxtype record stop"),
    {
        release = true,
        description = "Voxtype: Stop recording and transcribe"
    }
)
