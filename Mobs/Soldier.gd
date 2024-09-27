extends CharacterBody2D


@export var speed = 500
var Health = 10

func _process(delta):
	var parent : PathFollow2D = get_parent()
	get_parent().set_progress(get_parent().get_progress() + speed*delta)

	if parent.get_progress_ratio() == 1:
		queue_free()

	if Health <= 0:
		get_parent().get_parent().queue_free()