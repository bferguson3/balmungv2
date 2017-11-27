extends Sprite

var mypos # = get_node("playerSprite").get_position_in_parent()


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func MoveThisSprite(x, y):
	mypos = get_pos()
	mypos.x += x
	mypos.y += y
	set_pos(mypos)
	pass