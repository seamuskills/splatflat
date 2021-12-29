extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var area = get_node("Area2D")
onready var projScene = load("res://projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	var canvas_rid = get_canvas_item()
	# You may need to adjust these values
	VisualServer.canvas_item_set_draw_index(canvas_rid,-100)
	VisualServer.canvas_item_set_z_index(canvas_rid,-100)

func is_instanced_from_scene(p_node):
	if not p_node.filename.empty():
		return p_node.filename
	return ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var c = area.get_overlapping_bodies()
	for i in c:
		if is_instanced_from_scene(i.get_parent()) == "res://projectile.tscn":
			color = get_node(str(i.get_path())+"/projectile").color
			color.a = 0.5
