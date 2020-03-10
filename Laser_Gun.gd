extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_position
var can_shoot = true
export var beam_duration = 1.5
export var cooldown = 0.5
var hit = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$Laser.remove_point(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_local_mouse_position()
	rotation += mouse_position.angle()
	if Input.is_action_just_pressed("click"):
		shoot()
func shoot():
	hit = cast_beam()
	yield(get_tree().create_timer(beam_duration), "timeout")
	$Laser.remove_point(1)
	hit = null
	yield(get_tree().create_timer(cooldown), "timeout")
	can_shoot = true
	
func cast_beam():
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray($Muzzle.global_position, $Muzzle.global_position + transform.x * 1000, [self])
	if result:
		if !hit:
			$Laser.add_point(transform.xform_inv(result.position))
		else:
			$Laser.set_point_position(1, transform.xform_inv(result.position))
	return result
