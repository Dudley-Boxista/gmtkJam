extends Area2D




func _on_body_entered(body: Node2D) -> void:
	print ("win")
	queue_free()
	get_tree().change_scene_to_file("res://scenes/FASE2.tscn")
