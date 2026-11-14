extends CharacterBody2D
var speed = 400
var ringCount = 0
func _physics_process(_delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") #get the input  
	velocity = input_direction * speed # its a global variable (player.velocity)
	move_and_slide() # velocity is already in the parentheses
	


func _on_pickup_area_area_entered(area: Area2D) -> void: ## referring to the orange's area
		if area.is_in_group("ringGroup") and not $pickupRing.visible: ## if that is a ring, then delete it
			area.queue_free() ## free from the workspace
			$pickupRing.visible = true ## make orange
			speed = speed * 5 
			# play a sound 
			
		if area.is_in_group("basketGroup") and $pickupRing.visible: # if object touched is the bascket
			$pickupRing.visible = false
			$pickupRing.queue_free()
			speed = speed / 5
			ringCount += 1
			# add 1 to rings counter
			$CanvasLayer/ringCountDisplay.text = "Rings: " + str(ringCount)
