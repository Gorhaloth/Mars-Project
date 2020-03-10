extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = Vector2(300,300)
var velocity = Vector2()
var mouse_location

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = get_direction()
	velocity = direction * speed
	velocity = move_and_slide(velocity)
	if Input.is_action_just_pressed("teleport"):
		teleport()
	

func get_direction():
	return Vector2(Input.get_action_strength("right")-Input.get_action_strength("left"),Input.get_action_strength("down")-Input.get_action_strength("up"))

func teleport():
	mouse_location = get_global_mouse_position()
	set_position(mouse_location)
