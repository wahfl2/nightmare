extends Camera2D


const SCREEN_SIZE = Vector2(1920, 1080)
const CAM_MOVE_DELTA = 0.001
const CAM_POS_EPSILON = 7.5
const TRANSITION_FREEZE_TIME = 0.2

var prev_target_pos = Vector2(0, 0)
var time_since_transition = TRANSITION_FREEZE_TIME


# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_transition += delta
	
	var player_pos = $"../World/Player".position
	var target_pos: Vector2 = round(player_pos / SCREEN_SIZE) * SCREEN_SIZE
	
	if !target_pos.is_equal_approx(prev_target_pos):
		prev_target_pos = target_pos
		time_since_transition = 0.0
	
	for i in delta / CAM_MOVE_DELTA:
		position += (target_pos - position) / 200
	
	if time_since_transition < TRANSITION_FREEZE_TIME:
		$"../World".process_mode = Node.PROCESS_MODE_DISABLED
	else:
		$"../World".process_mode = Node.PROCESS_MODE_ALWAYS
