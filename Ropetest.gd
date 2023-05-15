extends CharacterBody2D

@onready var pivot = $"../Node2D"
const SPEED = 500.0

func _physics_process(delta):
	velocity = Input.get_vector("a","d","w","s") * SPEED
	var distance_to_pivot = pivot.position.distance_to(position)
	var taut = clamped_remap(distance_to_pivot, 100, 500, 0, 1)
	var direction_to_pivot: Vector2 = pivot.position - position
	velocity += (direction_to_pivot.normalized() * maxf(direction_to_pivot.length(), velocity.length())) * (taut)
	print(distance_to_pivot)
	move_and_slide()

func clamped_remap(value, istart, iend, ostart, oend):
	return remap(clampf(value, istart, iend), istart, iend, ostart, oend)
