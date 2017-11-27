extends RayCast2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var g

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	g = get_node("/root/globals")
	set_process(true)
	pass
	
func _process(delta):
	if(get_name() == "playerRayDown"):
		if(is_colliding()):
			g.playerBlockedDown = true
		else:
			g.playerBlockedDown = false
	elif(get_name() == "playerRayRight"):
		if(is_colliding()):
			g.playerBlockedRight = true
		else:
			g.playerBlockedRight = false
	elif(get_name() == "playerRayLeft"):
		if(is_colliding()):
			g.playerBlockedLeft = true
		else:
			g.playerBlockedLeft = false
	elif(get_name() == "playerRayUp"):
		if(is_colliding()):
			g.playerBlockedUp = true
		else:
			g.playerBlockedUp = false
	pass
