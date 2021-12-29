extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var target = get_viewport().get_mouse_position()
onready var solid = get_tree().get_nodes_in_group("solid")
onready var visNode = get_node("VisibilityNotifier2D")
export var stats = {
	"speed":10,
	"range":100,
	"damage":10
}
# Called when the node enters the scene tree for the first time.
func _ready():
	target -= self.global_position
	target = target.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var change = Vector2.ZERO
	change.x = stats.speed*target.x
	change.y = stats.speed*target.y
	var collision = move_and_collide(change)
	var deleted = false
	if (collision):
		for i in solid:
			if (collision.collider == i):
				get_parent().remove_child(self)
				queue_free()
				deleted = true
	if (deleted == false):
		if not visNode.is_on_screen():
			get_parent().remove_child(self)
			queue_free()
