extends ParallaxBackground

var scrollingspeed=100

func _process(delta):
	scroll_offset.x -= scrollingspeed*delta

#func _on_quit_pressed():
	#get_tree().quit()
