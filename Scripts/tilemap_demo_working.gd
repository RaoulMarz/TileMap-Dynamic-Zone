extends Node2D

@onready var tile_map : TileMap = $TileMap
@export var test_grid : bool = false
@export var change_random_tiles : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var dynamic_map_size : Vector2i = Vector2i(10, 10)
	var x_range = dynamic_map_size.x
	var y_range = dynamic_map_size.y
	
	for iy in range(y_range):
		var row_tile_indices = []
		for ix in range(x_range):
			row_tile_indices.push_back(tile_map.get_cell_source_id(0, Vector2i(ix, iy)))
		print("row[%s], tile indices = %s" % [iy, row_tile_indices])
				
	if test_grid:
		for ix in range(x_range):
			for iy in range(y_range - 5):
				if change_random_tiles and (randi() % 100) >= 25:
					tile_map.set_cell(0, Vector2i(ix, iy), randi() % 10, Vector2i.ZERO)
				else:
					tile_map.set_cell(0, Vector2i(ix, iy), 0, Vector2i.ZERO)
			for iy in range(y_range - 5, y_range):
				if change_random_tiles and (randi() % 100) >= 25:
					tile_map.set_cell(0, Vector2i(ix, iy), randi() % 10, Vector2i.ZERO)
				else:
					tile_map.set_cell(0, Vector2i(ix, iy), 3, Vector2i.ZERO)
	else:
		tile_map.set_cell(0, Vector2i(0, 0), 1, Vector2i.ZERO)
		tile_map.set_cell(0, Vector2i(2, 2), 3, Vector2i.ZERO)
		tile_map.set_cell(0, Vector2i(4, 4), 6, Vector2i.ZERO)
		tile_map.set_cell(0, Vector2i(2, 4), 1, Vector2i.ZERO)
		tile_map.set_cell(0, Vector2i(3, 5), 2, Vector2i.ZERO)
		tile_map.set_cell(0, Vector2i(6, 5), 2, Vector2i.ZERO)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
