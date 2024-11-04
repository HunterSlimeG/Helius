extends PanelContainer
var data = {
	"fullscreen_on" : false,
	"display_fps" : false,
	"max_fps" : 60,
	"brightness" : 50,
	"master_vol" : 100,
	"music_vol" : 100,
	"sfx_vol" : 100,
	"mouse_sens" : 1,
}
var fullscreen_on = data.fullscreen_on
var	display_fps = data.display_fps
var	max_fps = data.max_fps
var brightness = data.brightness
var	master_vol = data.master_vol
var	music_vol = data.music_vol
var	sfx_vol = data.sfx_vol
var mouse_sens = data.mouse_sens
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_settings_data(content: Variant) -> void:
	data = content
	fullscreen_on = data.fullscreen_on
	display_fps = data.display_fps
	max_fps = data.max_fps
	brightness = data.brightness
	master_vol = data.master_vol
	music_vol = data.music_vol
	sfx_vol = data.sfx_vol
	mouse_sens = data.mouse_sens
	if fullscreen_on:
		$TabContainer/General/MarginContainer/Fullscreen._select_int(1)
	else:
		$TabContainer/General/MarginContainer/Fullscreen._select_int(0)
func _on_save_pressed() -> void:
	data.fullscreen_on = fullscreen_on
	data.display_fps = display_fps
	data.max_fps = max_fps
	data.brightness = brightness
	data.master_vol = master_vol
	data.music_vol = music_vol
	data.sfx_vol = sfx_vol
	data.mouse_sens = mouse_sens
	Data.save_data(data)


func _on_apply_pressed() -> void:
	if fullscreen_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_close_pressed() -> void:
	visible = false
	$"../PanelContainer".visible = false


func _on_Fullscreen_item_selected(index: int) -> void:
	if index == 0:
		data.fullscreen_on = false
		fullscreen_on = false
	if index == 1:
		data.fullscreen_on = true
		fullscreen_on = true
