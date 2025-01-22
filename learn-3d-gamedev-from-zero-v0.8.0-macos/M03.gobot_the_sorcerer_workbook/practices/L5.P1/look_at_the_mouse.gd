extends Node3D
var mouse_position_2d := Vector2.ZERO
var mouse_ray := Vector3.ZERO
var world_mouse_position: Variant = null
var _ground_plane := Plane(Vector3.UP) 
@onready var _gobot_skin_3d: Node3D = %Skin
@onready var _camera_3d: Camera3D = %Camera3D

func _physics_process(delta: float) -> void:
	if _ground_plane == null:
		return
	_ground_plane.d = global_position.y
	mouse_position_2d = get_viewport().get_mouse_position() 
	mouse_ray = _camera_3d.project_ray_normal(mouse_position_2d) 
	world_mouse_position = _ground_plane.intersects_ray(_camera_3d.global_position, mouse_ray) 
	if world_mouse_position != null: 
		_gobot_skin_3d.look_at(world_mouse_position) 
