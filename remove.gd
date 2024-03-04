extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"../ScoreLabel".text = "Score: %s"% get_parent().score  
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_Area2D_body_entered(body):
	if body.is_in_group("球"): # 假设你的球加入了一个叫"球"的组
		body.queue_free()


func _on_body_entered(body):
	
	if body.is_in_group("ball"):
		print("ball in ")
		body.queue_free()
		get_parent().score   +=1
		print("label updata to score:", get_parent().score   )
		$"../ScoreLabel".text = "Score: %s"% get_parent().score  
		print("leave balls:",get_tree().get_nodes_in_group("ball").size())
		if get_tree().get_nodes_in_group("ball").size() == 0:
			$"../ScoreLabel".text = "Game Over, Score: %s"% get_parent().score  
	pass # Replace with function body.
