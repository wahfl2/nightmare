extends Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func atan2vec(v: Vector2) -> float:
	return atan2(v.y, v.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_vel: Vector2 = $"..".velocity
	var point = -player_vel

	var angle0 = atan2vec(point * Vector2(1.0, 0.1))
	var angle1 = atan2vec(point * Vector2(1.0, 0.25)) - angle0
	var angle2 = atan2vec(point * Vector2(1.0, 0.5)) - angle1 - angle0
	var angle3 = atan2vec(point * Vector2(1.0, 1.0)) - angle2 - angle1 - angle0

	var skel = get_node(self.skeleton)

	var bone0: Bone2D = skel.find_child("b0")
	bone0.rotation += (angle0 - bone0.rotation) / 1000

	var bone1: Bone2D = skel.find_child("b1")
	bone1.rotation += (angle1 - bone1.rotation) / 1000

	var bone2: Bone2D = skel.find_child("b2")
	bone2.rotation += (angle2 - bone2.rotation) / 1000

	var bone3: Bone2D = skel.find_child("b3")
	bone3.rotation += (angle3 - bone3.rotation) / 1000
