extends Sprite2D

# Reference to the bullet scene
var bullet_prefab = preload("res://Prefabs/bullet.tscn")

func _ready():
	pass

func _process(delta):
	# Rotate gun to face the mouse cursor
	var mouse_pos = get_global_mouse_position()
	var dir_to_mouse = (mouse_pos - global_position).normalized()
	rotation = dir_to_mouse.angle()
	
	if(Input.is_action_just_pressed("shoot")):
		fire()

#func _input(event):
#	if event is InputEventMouseButton:
#		if event.button_index == 0 and event.pressed:
#			# Fire bullet
#			fire()



func fire():
	# Create a bullet instance
	var bullet = bullet_prefab.instantiate()
	bullet.velocityInherit = get_parent().velocity
	
	print("anakin shot lol.")
	# Initialize the bullet
	var spawn_point = $BulletSpawnPoint.global_position
	bullet.global_position = spawn_point
	bullet.init((get_global_mouse_position() - spawn_point).normalized())

	# Add bullet to the scene
	get_tree().current_scene.add_child(bullet)
