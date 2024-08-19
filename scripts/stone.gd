extends Area2D
@onready var bigStone = $"../AnimatableBody2D/BigCollisionShape"
@onready var smallStone = $"../AnimatableBody2D/SmallCollisionShape"
@onready var bigStoneSprite = $"../AnimatableBody2D/BigCollisionShape/BigStone"
@onready var smallStoneSprite = $"../AnimatableBody2D/SmallCollisionShape/SmallStone"
var isMouseOver: bool = false

func _on_mouse_entered() -> void:
	isMouseOver = true

func _on_mouse_exited() -> void:
	isMouseOver = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if isMouseOver and event.is_action_pressed("use_magnifier"):
		smallStone.disabled = !smallStone.disabled
		smallStoneSprite.visible = !smallStoneSprite.visible
		bigStone.disabled = !bigStone.disabled
		bigStoneSprite.visible = !bigStoneSprite.visible
		$SmallCollisionAreaShape.disabled = ! $SmallCollisionAreaShape.disabled
		$BigCollisionAreaShape.disabled = !$BigCollisionAreaShape.disabled
	
