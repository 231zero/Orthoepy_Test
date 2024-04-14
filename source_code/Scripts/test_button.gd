extends Button

@export var nickname : String

func _ready():
	$text.text = '[center]' + nickname


func _on_pressed():
	$AnimationPlayer.play('tap')
