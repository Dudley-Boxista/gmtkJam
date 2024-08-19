extends Area2D
@onready var bigPlatform = $"../AnimatableBody2D/BigCollisionShape"
@onready var smallPlatform = $"../AnimatableBody2D/SmallCollisionShape"
@onready var bigPlatformSprite = $"../AnimatableBody2D/BigCollisionShape/BigPlatform"
@onready var smallPlatformSprite = $"../AnimatableBody2D/SmallCollisionShape/SmallPlatform"
var isMouseOver: bool = false

func _on_mouse_entered() -> void:
	isMouseOver = true

func _on_mouse_exited() -> void:
	isMouseOver = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if isMouseOver and event.is_action_pressed("use_magnifier"):
		smallPlatform.disabled = !smallPlatform.disabled
		smallPlatformSprite.visible = !smallPlatformSprite.visible
		bigPlatform.disabled = !bigPlatform.disabled
		bigPlatformSprite.visible = !bigPlatformSprite.visible
		$SmallCollisionAreaShape.disabled = ! $SmallCollisionAreaShape.disabled
		$BigCollisionAreaShape.disabled = !$BigCollisionAreaShape.disabled
	
