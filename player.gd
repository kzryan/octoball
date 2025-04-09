extends RigidBody2D

signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	
	
func _physics_process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.\
	if Input.is_action_pressed("Right"):
		velocity.x += 1
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
	if Input.is_action_pressed("Down"):
		pass
	if Input.is_action_pressed("Up"):
		pass
		
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	'''
	if velocity.y < -900:
		$AnimatedSprite2D.animation = "dribble"
		$AnimatedSprite2D.flip_h = true
	'''
	

	
		# Apply the velocity to the RigidBody2D
	self.linear_velocity.x = velocity.x
	position = position.clamp(Vector2.ZERO, screen_size)
