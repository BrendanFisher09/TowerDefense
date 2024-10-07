extends Panel


@onready var tower = preload("res://red_bullet_tower.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		#Left click Down
		add_child(tempTower)
			
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouseMotion and event.button_mask == 1:
		# Lefy Click Down Drag
		get_child(1).global_position = get_global_mouse_position()

	elif event is InputEventMouseButton and event.button_mask == 0:
		#Left Click Up
		print("Left button Up")
		get_child(1).queue_free()
		var path = get_tree().get_root().get_node("Main/Towers")

		path.add_child(tempTower)
		tempTower.global_position = get_global_mouse_position()
		tempTower.get_node("Panel").hide()
