extends Node2D

export var walksp = 150
export var acc = 0.25
var speed = {
	"normal":150,
	"sink":75,
	"squid":80,
	"squid_ink":200,
	"squid_sink":60
}
var squid = false
var hsp = 0
var vsp = 0
onready var body = get_node("body")
const projectile = preload("res://projectile.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
	
func _physics_process(delta):
	var moveh = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	var movev = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	hsp = lerp(hsp,walksp*moveh*100,acc)
	vsp = lerp(vsp,walksp*movev*100,acc)
	var vector = Vector2(hsp*delta,vsp*delta)
	body.move_and_slide(vector)
	if (Input.is_action_pressed("fire")):
		var proj = projectile.instance()
		proj.global_position = body.global_position
		get_parent().add_child(proj)
