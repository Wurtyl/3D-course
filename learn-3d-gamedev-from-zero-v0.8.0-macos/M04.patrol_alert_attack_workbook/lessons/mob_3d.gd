class_name Mob3D extends CharacterBody3D

@export var skin: MobSkin3D = null
@export var hurt_box: HurtBox3D = null
@export_category("Detection")
@export var vision_range := 7.0
@export_range(0.0, 360.0, 0.1, "radians_as_degrees") var vision_angle := PI / 4.0
