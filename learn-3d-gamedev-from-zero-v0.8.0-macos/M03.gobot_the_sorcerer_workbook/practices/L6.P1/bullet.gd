extends Area3D
const BulletSkin = preload("bullet_skin.gd")
@export var bullet_skin_scene: PackedScene = preload("bullet_skin.tscn") 
var speed := 10.0
var max_range := 10.0
var traveled_distance := 0.0
var visual: BulletSkin = null

func _ready() -> void:
	visual = bullet_skin_scene.instantiate() 
	add_child(visual) 
	visual.appear() 

func _physics_process(delta: float) -> void:
	var distance := speed * delta 
	var motion := -transform.basis.z * distance 
	position += motion 
	traveled_distance += distance 
	if traveled_distance > max_range:
		set_physics_process(false) 
		visual.destroy() 
		visual.tree_exited.connect(queue_free) 
