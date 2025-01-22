extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func chosen(b: String, bM):
	Global.menu = false
	$"../Crosshair".visible = true
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	owner.build = b
	owner.buildable = true
	$"../Highlight/Mesh".mesh = bM

func _on_furnace_pressed() -> void:
	chosen("Furnace", load("res://Resources/3D/Meshes/Furnace.tres"))


func _on_trade_pressed() -> void:
	chosen("Trade_Station", load("res://Resources/3D/Meshes/Trade_Station.tres"))
