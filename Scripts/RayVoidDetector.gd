class_name RayVoidDetector extends RayCast2D

signal void_near_found(side:Side)

@export var body:PhysicsBody2D
@export var offset_x_from_player:float

var _body_position_before:Vector2
var _body_velocity:Vector2

func _physics_process(_delta) -> void:
	_body_velocity = body.position - _body_position_before
	_body_position_before = body.position
	if _body_velocity.x == 0:
		return
		
	position.x = sign(_body_velocity.x) * offset_x_from_player
	force_raycast_update()
	if is_colliding():
		return
	if _body_velocity.x > 0:
		void_near_found.emit(SIDE_RIGHT)
	else:
		void_near_found.emit(SIDE_LEFT)
