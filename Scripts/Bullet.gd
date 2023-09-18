extends RigidBody2D

@export var speed = 800.0

var velocityInherit: Vector2

func _ready():
	$Timer.start()
	
# Initialize the bullet's direction
func init(direction):
	rotation = direction.angle()
	linear_velocity = Vector2(speed, 0).rotated(direction.angle()) + velocityInherit

# Self-destruct to clean up the scene
func _on_timer_timeout():
	print("timeout lol")
	queue_free()
