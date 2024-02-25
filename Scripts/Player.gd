class_name Player extends CharacterBody2D
@export var gravity_scale:float = 1

var _gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	simulate_gravity(delta)
	move_and_slide.call_deferred()

func simulate_gravity(delta):
	if not is_on_floor():
		velocity.y += _gravity * gravity_scale * delta
		
func _on_ray_void_detector_void_near_found(side):
	if is_on_floor():
		match side:
			SIDE_RIGHT: print("right")
			SIDE_LEFT: print("left")
