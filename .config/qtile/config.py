# IMPORT
import os
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

#   DEFINE VARIABLES
mod = "mod4"
terminal = "alacritty"
home = os.path.expanduser('~')
nav = "firefox"
nav_app= "rofi -show drun"
main_font = "JetBrainsMono Nerd Font"

#   KEY BINDS
keys = [
	Key([mod], 's', lazy.group["scratchpad"].dropdown_toggle('term'),desc="dropdown terminal"),
	Key([mod], 'a', lazy.group["scratchpad"].dropdown_toggle('pavuctl'),desc="dropdown audio control"),
	Key([mod], 'm', lazy.group["scratchpad"].dropdown_toggle('spotify'),desc="dropdown spotify"),
	Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
	Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
	Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
	Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
	Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

	# Moving out of range in Columns layout will create new column.
	Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
	Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
	Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
	Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
	Key([mod],"f",lazy.window.toggle_fullscreen()),

	# Grow windows. If current window is on the edge of screen and direction
	# will be to screen edge - window would shrink.
	Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
	Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
	Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
	Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
	Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
	#   Ult keys
	Key([],"F8",lazy.spawn("xbacklight -dec 10")),
	Key([],"F9",lazy.spawn("xbacklight -inc 10")),
	Key([],"F10",lazy.spawn("pamixer -d 10")),
	Key([],"F11",lazy.spawn("pamixer -i 10")),
	Key([],"Print",lazy.spawn("screenshot.sh")),
	Key([],"F1",lazy.spawn("power.sh")),
	Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
	Key(
		[mod, "shift"],
		"Return",
		lazy.layout.toggle_split(),
		desc="Toggle between split and unsplit sides of stack",
	),
	Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
	Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
	Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
	Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
	Key([mod], "d", lazy.spawn(nav_app), desc="Spawn a command using a prompt widget"),
	Key([mod], "w", lazy.spawn(nav), desc="Browser window"),
	Key([mod], "c", lazy.spawn("config.sh"), desc="config files"),
]

groups       = [
	Group("1",layout='monadtall'),
	Group("2",layout='monadtall'),
	Group("3",layout='monadtall'),
	Group("4",matches=[Match(wm_class=["discord"])],layout='floating')
]   

from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder(mod)

#   DropDown

groups.append(
		ScratchPad("scratchpad",[
				DropDown("term",terminal,height=0.6, width=0.80,x=0.1,y=0.2),
				DropDown("spotify","spotify-launcher",height=0.800, width=0.800,x=0.1,y=0.01),
				DropDown("pavuctl","pavucontrol",height=0.6, width=0.80,x=0.1,y=0.2),]),

)

#   Color Def
catppuccin = {
	"flamingo": "#f2cdcd",
	"mauve": "#cba6f7",
	"pink": "#f5c2e7",
	"maroon": "#eba0ac",
	"red": "#f38ba8",
    "red1":"#ED8796",
	"peach": "#fab387",
	"yellow": "#f9e2af",
	"green": "#a6e3a1",
	"teal": "#94e2d5",
	"blue": "#89b4fa",
	"sky": "#89dceb",
	"white": "#cdd6f4",
	"gray": "#6e6c7e",
	"black": "#11111b",
    "rosewater":"#f5e0dc",
	"bg2":"#313244",
}


layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus":catppuccin["white"],
                "border_normal": catppuccin["gray"]
                }


layouts = [
	layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
	layout.MonadTall(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.RatioTile(**layout_theme),
    layout.Floating(**layout_theme)
	#layout.Max(),
]

widget_defaults = dict(
	font=main_font,
	fontsize=14,
	padding=2,
	foreground=catppuccin["black"],
)
extension_defaults = widget_defaults.copy()


# Widgets
def init_widgets_list():
	
	widgets_list = [
			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=catppuccin["bg2"],
						background=catppuccin["gray"],
			),
				widget.GroupBox(
						highlight_method="line",
						rounded = False,
						margin_y = 3,
						margin_x = 0,
						padding_y = 5,
						padding_x = 3,
						borderwidth = 3,
						background=catppuccin["bg2"],
						highlight_color=[catppuccin["bg2"], catppuccin["black"]],
						inactive=catppuccin["gray"],
						this_current_screen_border = catppuccin["red1"],
				),
			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=catppuccin["bg2"],

						background=catppuccin["black"],
			),
                widget.Spacer(
                        length=3,
                        background="#00000000",
            ),
                widget.CurrentLayoutIcon(
                        foreground=catppuccin["white"],
                ),
                widget.CurrentLayout(
                        foreground=catppuccin["white"],
                ),
				widget.WindowName(format='{state} {name}', empty_group_string='Arch '),
			    widget.Spacer(),	
                widget.Mpris2(
                    foreground=catppuccin["white"],
                    display_metadata=['xesam:title','xesam:artist'],
                    playing_text=" {track}",
                    paused_text=" {track}",
                    max_chars=40,
                ),
			    widget.Spacer(),	
				widget.Systray(),
                widget.Spacer(
                        length=3,
                        background="#00000000",
            ),

			widget.TextBox(
						text="",
						padding=-2,
						fontsize=25,
						foreground=catppuccin["peach"],
						background=catppuccin["black"],
			),
				widget.CheckUpdates(
						update_interval = 1800,
						no_update_string='No updates',
						# font='JetBrains Mono ExtraBold',
						display_format = "󰃘 {updates} ",
						padding = 5,
						background=catppuccin["peach"],
                        initial_text="Aguarde...",
						colour_have_updates=catppuccin["bg2"],
						distro = "Arch_checkupdates",
                        mouse_callbacks = {'Button1': lazy.spawn(terminal + ' -e sudo pacman -Syyu')},
					),
			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=25,
						foreground=catppuccin["peach"],
						background=catppuccin["black"],
			),
						
				widget.Spacer(
            			length=3,
            			background="#00000000",
            ),

			widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=catppuccin["yellow"],
						background=catppuccin["black"],
			),
				widget.PulseVolume(
						background=catppuccin["yellow"],
						fmt='󰕾 {}',
						volume_down_command="pamixer -d 10",
						volume_up_command="pamixer -i 10",
						volume_app="pavucontrol",
			   ),


			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=catppuccin["yellow"],
						background=catppuccin["black"],
			),

				widget.Spacer(
            			length=3,
            			background="#00000000",
            ),

			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=catppuccin["flamingo"],
						background=catppuccin["black"],
			),
				widget.Clock(
						format=" %I:%M %p",
						background=catppuccin["flamingo"],
						),
			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=catppuccin["flamingo"],
						background=catppuccin["black"],
			),

	] 
	return widgets_list

def init_widgets_screen1():
	widgets_screen1 = init_widgets_list()
	return widgets_screen1

#   Addind support for multiple screens, just in case
def init_screens():
	return [Screen(top=bar.Bar(widgets=init_widgets_list(), opacity=1.0, size=20,background=catppuccin["black"]))]

screens = init_screens()

# Drag floating layouts.
mouse = [
	Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
	Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
	Click([mod], "Button2", lazy.window.bring_to_front()),
]

#   IDK
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_width= 3,
    border_focus=catppuccin["green"],
    border_normal= catppuccin["gray"],
    float_rules=[
		*layout.Floating.default_float_rules,
		Match(wm_class="confirmreset"),  # gitk
		Match(wm_class="pavucontrol"),  # gitk
		Match(wm_class="Thunar"),  # gitk
		Match(wm_class="makebranch"),  # gitk
		Match(wm_class="maketag"),  # gitk
		Match(wm_class="ssh-askpass"),  # ssh-askpass
		Match(wm_class="discord"),  # ssh-askpass
		Match(title="branchdialog"),  # gitk
		Match(title="pinentry"),  # GPG key password entry
	]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
