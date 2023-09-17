extends CharacterBody2D


# Variables for movement
@export var speed = 200
@export var jump_strength = -400
@export var gravity = 20

# Initialize the velocity


# _Ready function
func _ready():
	pass

# _PhysicsProcess function for movement
func _physics_process(delta):
	
	# Left and Right Movement
	if Input.is_action_pressed("cat_left"):
		print("left")
		velocity.x = -speed * delta
	elif Input.is_action_pressed("cat_right"):
		print("right")
		velocity.x = speed * delta
	else:
		velocity.x = 0
	
	# Jump
	if Input.is_action_just_pressed("cat_jump") and is_on_floor():
		print("jumped")
		velocity.y = jump_strength
		
	#gravity = 1
	
	# Apply Gravity
	velocity.y += gravity * delta
	
	# Move the character
	# move_and_slide(velocity, Vector2.UP)
	move_and_slide()
