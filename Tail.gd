extends MeshInstance2D


const TAIL_ORIGIN = Vector2(0, -10)
const TAIL_START_RADIUS = 25.0
const TAIL_LENGTH = 100.0
const TAIL_MESH_RES = 30


func add_vertex2(st: SurfaceTool, v: Vector2):
	st.add_vertex(Vector3(v.x, v.y, 0))

# Called when the node enters the scene tree for the first time.
func _ready():
	var st = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)
	st.set_color(Color.WHITE)

	add_vertex2(st, TAIL_ORIGIN + Vector2(0, TAIL_START_RADIUS))
	for i in TAIL_MESH_RES:
		var delta = i / float(TAIL_MESH_RES)
		var y_add = (1.0 - delta) * TAIL_START_RADIUS
		y_add *= (i % 2) * 2 - 1

		var x_add = delta * TAIL_LENGTH
		add_vertex2(st, TAIL_ORIGIN + Vector2(x_add, y_add))

	mesh = st.commit()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
