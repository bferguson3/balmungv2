extends Sprite

var currentTimer = 0#Counting up delta...
var initialRepeat = 0.750 #How long for first repeat?
var startRepeat #Is this a key that needs a repeat timer?
var repeatTimer = 0.150#How long for the second+ repeats?
var lastKey
var repeatedOnce = false

var g
var player

var firstPress

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	g = get_node("/root/globals")
	player = get_node("../playerSprite")
	
	g.inputMode = g.inputModes.moving
	
	set_process(true)
	pass
	
	
func KeyAction(key):
	if(g.inputMode == g.inputModes.moving):
		if(key == "ui_up"):
			if(player.CheckCollision("ui_up")):
				player.MoveThisSprite(0, -32)
				#print("moving up")
		elif(key == "ui_down"):
			if(player.CheckCollision("ui_down")):
				player.MoveThisSprite(0, 32)
		elif(key == "ui_left"):
			if(player.CheckCollision("ui_left")):
				player.MoveThisSprite(-32, 0)
		elif(key == "ui_right"):
			if(player.CheckCollision("ui_right")):
				player.MoveThisSprite(32, 0)
	pass
	
func _process(delta):
	UnpressAll()

	if (Input.is_action_pressed("ui_up") && g.upReleased):
		lastKey = "ui_up"
		g.upPressed = true
		g.upReleased = false
		repeatedOnce = false
		startRepeat = true
		KeyAction(lastKey)
	elif (Input.is_action_pressed("ui_down") && g.downReleased):
		lastKey = "ui_down"
		g.downPressed = true
		g.downReleased = false
		repeatedOnce = false
		startRepeat = true
		KeyAction(lastKey)
	elif (Input.is_action_pressed("ui_left") && g.leftReleased):
		lastKey = "ui_left"
		g.leftPressed = true
		g.leftReleased = false
		repeatedOnce = false
		startRepeat = true
		KeyAction(lastKey)
	elif (Input.is_action_pressed("ui_right") && g.rightReleased):
		lastKey = "ui_right"
		g.rightPressed = true
		g.rightReleased = false
		repeatedOnce = false
		startRepeat = true
		KeyAction(lastKey)
			
	if (startRepeat):
		currentTimer += delta
	if(currentTimer >= initialRepeat):
		if(repeatedOnce == false):
			KeyAction(lastKey)
			repeatedOnce = true
			currentTimer = 0
	if(repeatedOnce == true):
		if(currentTimer > repeatTimer):
			KeyAction(lastKey)
			currentTimer = 0
			
	
	if (!Input.is_action_pressed("ui_up") && !g.upReleased):
		g.upReleased = true
		if(lastKey == "ui_up"):
			currentTimer = 0
			startRepeat = false
	if (!Input.is_action_pressed("ui_down") && !g.downReleased):
		g.downReleased = true
		if(lastKey == "ui_down"):
			currentTimer = 0
			startRepeat = false
	if (!Input.is_action_pressed("ui_left") && !g.leftReleased):
		g.leftReleased = true
		if(lastKey == "ui_left"):
			currentTimer = 0
			startRepeat = false
	if (!Input.is_action_pressed("ui_right") && !g.rightReleased):
		g.rightReleased = true
		if(lastKey == "ui_right"):
			currentTimer = 0
			startRepeat = false
	
	pass

func UnpressAll():
	g.upPressed = false
	g.downPressed = false
	g.leftPressed = false
	g.rightPressed = false
	pass