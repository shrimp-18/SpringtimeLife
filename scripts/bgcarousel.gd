extends ScrollContainer
@onready var coin_label=$"../Label"
@onready var audio=$"../AudioStreamPlayer2D"
@export_range(0.1, 10, 0.4) var card_scale: float = 1
@export_range(0.1, 10, 0.4) var card_current_scale: float = 1.1
@export_range(0.1, 10, 0.4) var scroll_duration: float = 0.2
@onready var cardmenu1=$CenterContainer2/MarginContainer/HBoxContainer/CardMenu1
@onready var cardmenu2=$CenterContainer2/MarginContainer/HBoxContainer/CardMenu2
@onready var cardmenu3=$CenterContainer2/MarginContainer/HBoxContainer/CardMenu3
@onready var cardmenu4=$CenterContainer2/MarginContainer/HBoxContainer/CardMenu4
var blank=preload("res://scenes/blank.png")
var style2=preload("res://scenes/lock1.png")
var style3=preload("res://scenes/lock2.png")
var style4=preload("res://scenes/lock3.png")
var card_current_index: int = 0
var card_x_positions: Array = []
var selected_background_index: int = 0  # Stores selected player index

@onready var margin_r: int = $CenterContainer/MarginContainer.get("theme_override_constants/margin_right")
@onready var card_space: int = $CenterContainer/MarginContainer/HBoxContainer.get("theme_override_constants/separation")
@onready var card_nodes: Array = $CenterContainer/MarginContainer/HBoxContainer.get_children()

var scroll_tween

func _ready() -> void:
	await get_tree().process_frame

	# Load previously selected player if available
	if FileAccess.file_exists("user://selected_background.save"):
		var file = FileAccess.open("user://selected_background.save", FileAccess.READ)
		selected_background_index = file.get_var()
		file.close()
		card_current_index = selected_background_index 
		scroll()

	get_h_scroll_bar().modulate.a = 0  # Hide scrollbar

	# Calculate card positions
	for _card in card_nodes:
		var _card_pos_x: float = (margin_r + _card.position.x) - ((size.x - _card.position.x) / 6)
		_card.pivot_offset = (_card.size / 2)
		card_x_positions.append(_card_pos_x)

	# Ensure scrolling starts at the right position
	scroll_horizontal = card_x_positions[card_current_index]
	scroll()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right") and selected_background_index < card_nodes.size() - 1:
		selected_background_index += 1
		card_current_index = selected_background_index  # Ensure correct index
		print("Moving Right to Index:", selected_background_index)
		scroll()
	elif event.is_action_pressed("ui_left") and selected_background_index > 0:
		selected_background_index -= 1
		card_current_index = selected_background_index  # Ensure correct index
		print("Moving Left to Index:", selected_background_index)
		scroll()
	elif event.is_action_pressed("ui_accept"):
		select_background()

func scroll():
	if scroll_tween:
		scroll_tween.stop() 

	scroll_tween = get_tree().create_tween()
	scroll_tween.tween_property(
		self,
		"scroll_horizontal",
		card_x_positions[card_current_index],  # Corrected index
		scroll_duration
	).from(scroll_horizontal).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	
	print("Scrolling to:", card_x_positions[card_current_index])

func _process(_delta: float) -> void:
	for _index in range(card_x_positions.size()):
		var _card_pos_x: float = card_x_positions[_index]
		var _swipe_length: float = (card_nodes[_index].size.x / 1) + (card_space / 1)
		var _swipe_current_length: float = abs(_card_pos_x - scroll_horizontal)
		var _card_scale: float = remap(_swipe_current_length, _swipe_length, 0, card_scale, card_current_scale)
		var _card_opacity: float = remap(_swipe_current_length, _swipe_length, 0, 0.3, 1)
		
		_card_scale = clamp(_card_scale, card_scale, card_current_scale)
		_card_opacity = clamp(_card_opacity, 0.5, 1)
		
		card_nodes[_index].scale = Vector2(_card_scale, _card_scale)
		card_nodes[_index].modulate.a = _card_opacity
		
		if _swipe_current_length < _swipe_length:
			card_current_index = _index

func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed and scroll_tween:
			scroll_tween.stop()
		else:
			scroll()
	

signal background_selected(index)  

func select_background():
	GameController.selected_background_index = card_current_index
	print("Selected background:", GameController.selected_background_index)
	emit_signal("background_selected", card_current_index) 


func _on_texture_button_2_pressed() -> void:
	select_background()
	match GameController.selected_background_index:
		0:
			GlobalParallaxBackground.visible=true
			ParallaxBackgroundd.visible=false
			ParallaxBackground3.visible=false
			ParallaxBackground4.visible=false
		1:
			if(GameController.total_coins >=0 and cardmenu2.texture==style2):
				GameController.total_coins= GameController.total_coins-150
				coin_label.text=str(GameController.total_coins)
				audio.play()
				cardmenu2.texture=blank
				GameController.save_data()
				ParallaxBackgroundd.visible=true
				GlobalParallaxBackground.visible=false
				ParallaxBackground3.visible=false
				ParallaxBackground4.visible=false
				
		2:
			if(GameController.total_coins>=200 and cardmenu3.texture==style3):
				GameController.total_coins=GameController.total_coins-200
				coin_label.text=str(GameController.total_coins)
				audio.play()
				cardmenu3.texture=blank
				GameController.save_data()
				ParallaxBackground3.visible=true
				ParallaxBackgroundd.visible=false
				GlobalParallaxBackground.visible=false
				ParallaxBackground4.visible=false
		3:
			if(GameController.total_coins>=300 and cardmenu4.texture==style4):
				GameController.total_coins =GameController.total_coins-300 
				coin_label.text=str(GameController.total_coins)
				audio.play()
				cardmenu4.texture=blank
				GameController.save_data()
				ParallaxBackgroundd.visible=false
				GlobalParallaxBackground.visible=false
				ParallaxBackground3.visible=false
				ParallaxBackground4.visible=true
