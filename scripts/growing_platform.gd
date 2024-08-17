extends Area2D

var isMouseOver: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	isMouseOver = true

func _on_mouse_exited() -> void:
	isMouseOver = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if isMouseOver and event.is_action_pressed("use_magnifier"):
		$"../AnimatableBody2D/SmallCollisionShape".disabled = !$"../AnimatableBody2D/SmallCollisionShape".disabled
		$"../AnimatableBody2D/SmallCollisionShape/SmallPlatform".visible = !$"../AnimatableBody2D/SmallCollisionShape/SmallPlatform".visible
		$"../AnimatableBody2D/BigCollisionShape".disabled = !$"../AnimatableBody2D/BigCollisionShape".disabled
		$"../AnimatableBody2D/BigCollisionShape/BigPlatform".visible = !$"../AnimatableBody2D/BigCollisionShape/BigPlatform".visible
		$SmallCollisionAreaShape.disabled = !$SmallCollisionAreaShape.disabled
		$BigCollisionAreaShape.disabled = !$BigCollisionAreaShape.disabled
	
