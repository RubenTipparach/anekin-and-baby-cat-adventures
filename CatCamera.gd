extends Camera2D

# Reference to the player node
@export var player: Node2D

# Offset between player's position and camera
@export var offsetCam = Vector2(0, 0)

# Deadzone in the middle where camera won't move
@export var deadzone = Vector2(50, 50)

@export var followSpeed: float = 1

var desired_position = Vector2(0, 0)

func _ready():
	# Assuming the player node is named "Player"
	#player = get_node("/root/worldo/Anekin_CAT")
	desired_position = player.global_position
	pass

func _process(delta):
	# Get the player's global position
	var player_pos = player.global_position

	# Calculate the difference between camera and player position
	var difference = global_position - player_pos

	# Initialize target position for the camera
	var target_position = global_position

	# Handle X-axis Deadzone
	if abs(difference.x) > deadzone.x:
		target_position.x = player_pos.x + sign(difference.x) * deadzone.x

	# Handle Y-axis Deadzone
	if abs(difference.y) > deadzone.y:
		target_position.y = player_pos.y + sign(difference.y) * deadzone.y

	# Smoothly move the camera to the target position
	global_position.x = lerp(global_position.x, target_position.x, followSpeed * delta)
	global_position.y = lerp(global_position.y, target_position.y, followSpeed * delta)
