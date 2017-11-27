extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _on_Area2D_body_enter(body):
	print(body.get_name())
	
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
