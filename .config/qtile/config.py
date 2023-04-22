# IMPORT
import os
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from xrcat import xrcat


#   DEFINE VARIABLES
mod = "mod4"
terminal = "alacritty"
home = os.path.expanduser('~')
nav = "firefox"
nav_app= "rofi -show drun -theme 'drofi' -show-icons"
main_font = "JetBrainsMono Nerd Font"
explorer="pcmanfm"

# pip install xrcat
xrcat.updateResources()

#   KEY BINDS
keys = [
	Key([mod], 's', lazy.group["scratchpad"].dropdown_toggle('term'),desc="dropdown terminal"),
	Key([mod], 'a', lazy.group["scratchpad"].dropdown_toggle('pavuctl'),desc="dropdown audio control"),
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
	#   Ult keys
	Key([mod],"F8",lazy.spawn("xbacklight -dec 10")),
	Key([mod],"F9",lazy.spawn("xbacklight -inc 10")),
	Key([mod],"F10",lazy.spawn("pamixer -d 10")),
	Key([mod],"F11",lazy.spawn("pamixer -i 10")),
	Key([],"Print",lazy.spawn("screenshot.sh")),
	Key([mod],"F1",lazy.spawn("power.sh")),
	Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
	Key([mod], "e", lazy.spawn(explorer), desc="Launch file manager"),
	Key([mod], "p", lazy.spawn("mpc toggle"), desc="Toggle mpd"),
	Key([mod], "n", lazy.spawn("rofipd"), desc="Change the music"),
	Key([mod], "m", lazy.spawn("alacritty -e ncmpcpp"), desc="Open music player"),
	Key([mod],"F2", lazy.spawn("playlist_mpd"), desc="playlist"),
	Key([mod],"F3", lazy.spawn("wall_eng"), desc="wallpaper script"),
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
	Key([mod], "z", lazy.spawn("dirop.sh"), desc="config files"),
             ### Switch focus of monitors
    Key([mod], "period",lazy.next_screen(),desc='Move focus to next monitor'),
    Key([mod], "comma",lazy.prev_screen(),desc='Move focus to prev monitor'),

]

groups       = [
	Group("1",layout='monadtall'),
	Group("2",layout='monadtall'),
	Group("3",layout='monadtall'),
	Group("4",layout='monadtall'),
	Group("5",layout='monadtall'),
	Group("6",layout='monadtall'),
	Group("7",layout='monadtall'),
	Group("8",matches=[Match(wm_class=["discord"])],layout='floating')
]   

from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder(mod)

#   DropDown

groups.append(
		ScratchPad("scratchpad",[
				DropDown("term",terminal,height=0.6, width=0.80,x=0.1,y=0.2),
				DropDown("pavuctl","pavucontrol",height=0.6, width=0.80,x=0.1,y=0.2),]),

)


layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus":xrcat.getResource("color13"),
                "border_normal":xrcat.getResource("color8"),
                }


# colors (in case xrcat stops working)

# catppuccin = {
# 	"flamingo": "#f2cdcd",
# 	"mauve": "#cba6f7",
# 	"pink": "#f5c2e7",
# 	"maroon": "#eba0ac",
# 	"red": "#f38ba8",
#     "red1":"#ED8796",
# 	"peach": "#fab387",
# 	"yellow": "#f9e2af",
# 	"green": "#a6e3a1",
# 	"teal": "#94e2d5",
# 	"blue": "#89b4fa",
# 	"sky": "#89dceb",
# 	"white": "#cdd6f4",
# 	"gray": "#6e6c7e",
# 	"black": "#11111b",
#     "rosewater":"#f5e0dc",
# 	"bg2":"#313244",
#     "bg3":"#24273a",
# }




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
	foreground=xrcat.getResource("background"),
)
extension_defaults = widget_defaults.copy()


# Widgets
def init_widgets_list():
	
	widgets_list = [
            # widget.Wallpaper(
            #             directory="~/img/wallpapers",
            #             wallpaper_command=["changer"],
            #             max_chars=8,
            #             random_selection=False,
            #             label="  ",
            #             foreground=catppuccin["white"],
            #             background=catppuccin["bg3"],

            #             mouse_callbacks = {'Button3': lazy.spawn("pcmanfm img/wallpapers")},
            # ),
                widget.CurrentLayoutIcon(
                        foreground=xrcat.getResource("*color8"),
                ),
                widget.Spacer(
                        length=3,
            ),
				widget.GroupBox(
						highlight_method="line",
						rounded = False,
						margin_y = 3,
						margin_x = 0,
						padding_y = 5,
						padding_x = 3,
						borderwidth = 3,
						background=xrcat.getResource("*background"),
						highlight_color=[xrcat.getResource("*color8"),xrcat.getResource("color8")],
						inactive=xrcat.getResource("color8"),
						this_current_screen_border = xrcat.getResource("color1"),
				),
                widget.Spacer(
                        length=8,
            ),
                widget.Mpd2(
                    foreground=xrcat.getResource("foreground"),
                    play_states={'pause':'  ','play':'','stop':'  '},
                    max_chars=80,
                    status_format='{play_status} {title}',
                    color_progress=xrcat.getResource("color9"),
                    no_connection='   no connection',

                ),
			    widget.Spacer(),	
			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=xrcat.getResource("color3"),
						background=xrcat.getResource("background"),
			),
				widget.Clock(
						format=" %H:%M",
						background=xrcat.getResource("color3"),
						),
			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=xrcat.getResource("color3"),
						background=xrcat.getResource("background"),
			),
			    widget.Spacer(),	
				widget.Systray(),
                widget.Spacer(
                        length=3,
                        background=xrcat.getResource("background"),
            ),

			widget.TextBox(
						text="",
						padding=-2,
						fontsize=25,
						foreground=xrcat.getResource("color9"),
						background=xrcat.getResource("background"),
			),
				widget.CheckUpdates(
						update_interval = 1800,
						no_update_string='No updates',
						# font='JetBrains Mono ExtraBold',
						display_format = "󰃘 {updates} ",
						padding = 5,
						background=xrcat.getResource("color9"),
                        initial_text="Aguarde...",
						colour_have_updates=xrcat.getResource("foreground"),
						distro = "Arch_checkupdates",
                        mouse_callbacks = {'Button1': lazy.spawn('chk_up'),'Button3': lazy.spawn(terminal + ' -e sudo pacman -Syyu')},
					),
			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=25,
						foreground=xrcat.getResource("color9"),
						background=xrcat.getResource("background"),
			),
						
				widget.Spacer(
            			length=3,
            			background=xrcat.getResource("background"),
            ),

			widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=xrcat.getResource("color3"),
						background=xrcat.getResource("background"),
			),
				widget.PulseVolume(
						background=xrcat.getResource("color3"),
						fmt='󰕾 {}',
						volume_down_command="pamixer -d 10",
						volume_up_command="pamixer -i 10",
						volume_app="pavucontrol",
			   ),


			    widget.TextBox(
						text="",
						padding=-2,
						fontsize=30,
						foreground=xrcat.getResource("color3"),
						background=xrcat.getResource("background"),
			),
	] 

	return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    del widgets_screen1[4]
    del widgets_screen1[9:19]
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2                 # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20,background=xrcat.getResource("background"))),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=22,background=xrcat.getResource("background")))]



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
    border_focus=xrcat.getResource("color2"),
    border_normal= xrcat.getResource("color0"),
    float_rules=[
		*layout.Floating.default_float_rules,
		Match(wm_class="confirmreset"),  # gitk
		Match(wm_class="pavucontrol"),  # gitk
		Match(wm_class="Thunar"),  # gitk
		Match(wm_class="makebranch"),  # gitk
		Match(wm_class="maketag"),  # gitk
		Match(wm_class="Sxiv"),  # gitk
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
