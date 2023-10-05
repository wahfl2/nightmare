extends Camera2D

const SCREEN_SIZE = Vector2(1920, 1080)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = $"../World/Player".position
	var target_pos = round(player_pos / SCREEN_SIZE) * SCREEN_SIZE
	
	if position != target_pos:
		$"../World".process_mode = Node.PROCESS_MODE_DISABLED
		position += (target_pos - position) / 5
	else:
		$"../World".process_mode = Node.PROCESS_MODE_ALWAYS
