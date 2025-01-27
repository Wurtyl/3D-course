class_name Projectile3D extends Area3D
@export var projectile_vfx: PackedScene = null
@export var impact_vfx: PackedScene = null
var speed := 10.0
var max_range := 10.0
var _visual: ProjectileSkin3D = null
var _traveled_distance := 0.0

func _ready() -> void:
	_visual = projectile_vfx.instantiate()
	add_child(_visual)
	_visual.appear()

func _physics_process(delta: float) -> void:
	var distance := speed * delta
	var motion := -transform.basis.z * distance
	position += motion
	_traveled_distance += distance
	if _traveled_distance > max_range:
		_destroy()

func _destroy() -> void:
	set_physics_process(false)
	_visual.destroy()
	_visual.tree_exited.connect(queue_free)
