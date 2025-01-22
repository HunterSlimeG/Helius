extends Node3D

var b: StaticBody3D
var player = Global.player
var build = ""
var buildMesh = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.menu = false
	player = Global.player
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit") and !Global.menu:
		Global.menu = true
		$Crosshair.visible = false
		$Menu.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif event.is_action_pressed("Exit") and Global.menu:
		_on_resume_pressed()
	if event.is_action_pressed("Build") and !Global.menu:
		Global.menu = true
		$Crosshair.visible = false
		$Build.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif event.is_action_pressed("Build") and Global.menu:
		_on_resume_pressed()
	if event.is_action_pressed("Place") and build!="" and !Global.menu:
		b = load("res://Scenes/"+build+".tscn").instantiate()
		b.position = $Highlight/Mesh.position
		add_child(b)
	if event.is_action_pressed("Cancel"):
		build = ""

func _on_resume_pressed() -> void:
	Global.menu = false
	$Crosshair.visible = true
	$Menu.visible = false
	$Build.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
