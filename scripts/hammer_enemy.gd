extends Node2D

@onready var timer = $TimerBeginToFall
@onready var timerFalling = $TimerFalling
@onready var attackTimer = $AttackTimer
@onready var attackDoneTimer = $AttackDoneTimer
@onready var smallHammerCollisionShape = $AnimatedSprite2D/Hammer/smallHammerCollisionShape
@onready var bigHammerCollisionShape = $AnimatedSprite2D/Hammer/bigHammerCollisionShape
@onready var hammerHit = $AnimatedSprite2D/HammerHit/CollisionShape2D

var isMouseOver: bool = false
var enemyShouldFall: bool = false
var isEnemyFalling: bool = false
var isEnemyAttacking: bool = false
var attackCanBeDone: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isEnemyFalling:
		self.move_local_y(10)
	else:
		if attackCanBeDone:
			attackCanBeDone = false
			attackTimer.start()
		if isEnemyAttacking:
			isEnemyAttacking = false
			$AnimatedSprite2D.animation = "AttackExecuted"
			attackDoneTimer.start()
			hammerHit.disabled = false


func _on_area_2d_mouse_entered() -> void:
	isMouseOver = true

func _on_area_2d_mouse_exited() -> void:
	isMouseOver = false

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if isMouseOver and event.is_action_pressed("use_magnifier"):
		if $AnimatedSprite2D.frame:
			enemyShouldFall = false
			$AnimatedSprite2D.frame = 0
		else:
			$AnimatedSprite2D.frame = 1
			enemyShouldFall = true
			timer.start()
		smallHammerCollisionShape.disabled = !smallHammerCollisionShape.disabled
		bigHammerCollisionShape.disabled = !bigHammerCollisionShape.disabled


func _on_timer_timeout() -> void:
	if enemyShouldFall:
		$AnimatedSprite2D.animation = "AttackBeginMagnifier"
		self.move_local_x(30)
		isEnemyFalling = true
		timerFalling.start()
		

func _on_timer_falling_timeout() -> void:
	self.queue_free()


func _on_attack_timer_timeout() -> void:
	isEnemyAttacking = true


func _on_attack_done_time_timeout() -> void:
	$AnimatedSprite2D.animation = "AttackBegin"
	attackCanBeDone = true
	hammerHit.disabled = true
