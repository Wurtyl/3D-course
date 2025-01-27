extends Marker3D
@export var projectile_scene: PackedScene = null
@onready var _timer: Timer = %Timer
@export_range(0.1, 20.0, 0.05) var fire_rate := 3.0: set = set_fire_rate
@export_range(5.0, 100.0, 0.1) var max_projectile_speed := 12.0
@export_range(2.0, 40.0, 0.1) var max_range := 12.0
@export_range(0.0, 90.0, 0.1, "radians_as_degrees") var max_random_angle := PI / 10.0

func _ready() -> void:
	set_fire_rate(fire_rate)

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("shoot") and _timer.is_stopped():
		shoot()

func shoot() -> void:
	var projectile: Projectile3D = projectile_scene.instantiate()
	owner.add_sibling(projectile)
	_timer.start()
	projectile.global_transform = global_transform
	projectile.max_range = max_range
	projectile.speed = max_projectile_speed
	var random_angle := randf_range(-max_random_angle / 2.0, max_random_angle / 2.0)
	projectile.rotate_y(random_angle)

func set_fire_rate(new_fire_rate: float) -> void:
	fire_rate = clamp(new_fire_rate, 0.1, 20.0)
	if _timer == null:
		return
	_timer.wait_time = 1.0 / fire_rate
