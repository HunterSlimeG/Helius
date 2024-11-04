extends Node3D

var furnace = preload("res://Scenes/Furnace.tscn").instantiate()
var player = Global.player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.menu = false
	player = Global.player
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		Global.menu = true
		$Crosshair.visible = false
		$Menu.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("Place"):
		furnace.position.x = player.position.x
		furnace.position.y = player.position.y
		furnace.position.z = player.position.z+1
		add_child(furnace)

func _on_resume_pressed() -> void:
	Global.menu = false
	$Crosshair.visible = true
	$Menu.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
