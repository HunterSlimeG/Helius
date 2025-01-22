extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	Global.player = self


func _physics_process(delta):
	var Menu = Global.menu
	if !Menu:
		if not is_on_floor():
			velocity.y -= gravity * delta
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var input_dir = Input.get_vector("Left", "Right", "Forward", "Back")
		var dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized() 
		var direction = dir.rotated(Vector3.UP, $Camera3D.rotation.y)
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED/3)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	else:
		velocity.x = 0
		velocity.z = 0
		velocity.y -= gravity * delta

	move_and_slide()

func _process(delta: float) -> void:
	if $Camera3D/RayCast3D.is_colliding() and owner.build!="":
		owner.get_node("Highlight/Mesh").visible = true
		owner.get_node("Highlight/Mesh").position.x = $Camera3D/RayCast3D.get_collision_point().x
		owner.get_node("Highlight/Mesh").position.y = $Camera3D/RayCast3D.get_collision_point().y+.5
		owner.get_node("Highlight/Mesh").position.z = $Camera3D/RayCast3D.get_collision_point().z
	else:
		owner.get_node("Highlight/Mesh").visible = false
		
		
