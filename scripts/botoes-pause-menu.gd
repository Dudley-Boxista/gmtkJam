extends Control
#Em process (no inspector) muda o Mode para Alwalys 

func _ready():
	visible = false
	
func _process(delta):
	pass
func _unhandled_input(event):
	#ui cancel automaticamente é esc
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true

#obter essas funções dos botoes apertador pelo sinais
func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false



func _on_quit_pressed() -> void:
	get_tree().quit()

# mais detalhes no video

func _on_return_to_main_menu_pressed() -> void:
	print ("não tem ainda :v")
