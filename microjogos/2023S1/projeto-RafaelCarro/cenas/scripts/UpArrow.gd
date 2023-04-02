extends AnimatableBody2D

var velocity = 12
var error = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_frame(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.y -= velocity
	if Input.is_action_just_pressed("cima"):
		if position.y < 752 && position.y > 585:
			$AnimatedSprite2D.set_frame(1)
			queue_free()
			$"../".aumentar_acertos()
		else:
			$AudioStreamPlayer.play()
			error = 1
	if error == 1:
		position.x += velocity
	if (position.x > 1920 || position.x < 0) && error == 1:
		queue_free()
	if (position.y > 1080 || position.y < 0) && error == 1:
		queue_free()
