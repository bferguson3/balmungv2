extends Sprite

var mypos # = get_node("playerSprite").get_position_in_parent()
var rc
var g

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	g = get_node("/root/globals")
	pass


func CheckCollision(direction):
	if(direction == "ui_down"):
		return !g.playerBlockedDown
	elif(direction == "ui_right"):
		return !g.playerBlockedRight
	elif(direction == "ui_left"):
		return !g.playerBlockedLeft
	elif(direction == "ui_up"):
		return !g.playerBlockedUp
	else:
		return true

func MoveThisSprite(x, y):
	mypos = get_pos()
	mypos.x += x
	mypos.y += y
	set_pos(mypos)
	pass