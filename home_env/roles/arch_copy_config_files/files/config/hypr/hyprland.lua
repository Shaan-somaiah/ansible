## See https://hypr.land/news/26_lua/

local terminal = "kitty"
local file_manager = "thunar"
local menu = "rofi -show drun"
local browser = "firefox"
local code = "code"

hl.monitor({
  output = "DP-4",
  mode = "1920x1080@100",
  position = "auto",
  scale = "auto",
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 10,
    border_size = 2,
    col = {
      active_border = {
        colors = { "rgba(6c7086ee)", "rgba(7f849cee)" },
        angle = 45,
      },
    },
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },
  decoration = {
    rounding = 10,
    active_opacity = 1.0,
    inactive_opacity = 0.9,
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
  animations = {
    enabled = false,
  },
  dwindle = {
    preserve_split = true,
  },
  master = {
    new_status = "master",
  },
  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo = false,
  },
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.curve("myBezier", {
  type = "bezier",
  points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

hl.on("hyprland.start", function()
  hl.exec_cmd("quickshell")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("swaync")
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  hl.exec_cmd("swaync-client -df")
  hl.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 0")
  hl.exec_cmd("wal -i ~/.config/background")
  hl.exec_cmd("matugen image \
      /home/{{ ansible_user }}/.config/background.jpg \
      --mode dark \
      --source-color-index 0 \
      --json hex \
      > /home/{{ ansible_user }}/.config/my_colors/colors.json")

end)

hl.bind("SUPER + 1", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + 2", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + 3", hl.dsp.exec_cmd(code))
hl.bind("SUPER + 4", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))

hl.bind("SUPER + Page_Up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + Page_Down", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
