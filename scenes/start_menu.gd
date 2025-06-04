extends Node2D




func _on_start_button_pressed() -> void:
	
	# start game :)
	Globals.player_destination = Vector2(250, 568)
	get_tree().change_scene_to_file("res://levels/grass.tscn")
