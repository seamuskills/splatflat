extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var target = get_viewport().get_mouse_position()
export var speed = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	target -= self.global_position
	target = target.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position.x += speed*target.x*delta
	global_position.y += speed*target.y*delta
