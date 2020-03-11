extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(13):
		for s in range(22):
			$TileMap.set_cell(s,i,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
