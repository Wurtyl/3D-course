extends Node3D
var mouse_position_2d := Vector2.ZERO
var mouse_ray := Vector3.ZERO
var world_mouse_position: Variant = null
var _ground_plane := Plane(Vector3.UP)
@onready var _box: Node3D = %Box
@onready var _camera_3d: Camera3D = %Camera3D

func _physics_process(delta: float) -> void:
	_ground_plane.d = global_position.y
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT): 
		mouse_position_2d = get_viewport().get_mouse_position()
		mouse_ray = _camera_3d.project_ray_normal(mouse_position_2d) 
		world_mouse_position = _ground_plane.intersects_ray(_camera_3d.global_position, mouse_ray) 
		_box.global_position = world_mouse_position 
