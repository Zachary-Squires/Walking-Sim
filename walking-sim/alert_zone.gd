extends Area3D

var playerInside = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(playerInside == true && Input.is_action_just_pressed("Interact")):
		$AudioStreamPlayer3D.play()


func _on_body_entered(body: Node3D) -> void:
	$Label3D.visible = true
	playerInside = true


func _on_body_exited(body: Node3D) -> void:
	$Label3D.visible = false
	playerInside = false
