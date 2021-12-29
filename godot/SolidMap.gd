extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var canvas_rid = get_canvas_item()
	# You may need to adjust these values
	VisualServer.canvas_item_set_draw_index(canvas_rid,-200)
	VisualServer.canvas_item_set_z_index(canvas_rid,-200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
