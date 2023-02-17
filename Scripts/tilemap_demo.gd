extends Node2D

@export var dynamic_map_size : Vector2i = Vector2i(100, 100)
@onready var tile_map : TileMap = $TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var x_range = dynamic_map_size.x
	var y_range = dynamic_map_size.y
	for ix in range(x_range):
		for iy in range(y_range):
			tile_map.set_cell(0, Vector2i(ix, iy), 1, Vector2i.ZERO)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
