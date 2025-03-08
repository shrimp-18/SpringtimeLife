extends ScrollContainer

@export_range(0.1, 10, 0.4) var card_scale: float = 1
@export_range(0.1, 10, 0.4) var card_current_scale: float = 1.1
@export_range(0.1, 10, 0.4) var scroll_duration: float = 0.2

var card_current_index: int = 0
var card_x_positions: Array = []

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_right") and card_current_index < card_x_positions.size() - 1:
			card_current_index += 1
			scroll()
		if event.is_action_pressed("ui_left") and card_current_index > 0:
			card_current_index -= 1
			scroll()

var scroll_tween
func scroll() -> void:
	scroll_tween = get_tree().create_tween()
	scroll_tween.tween_property(
	self,
	"scroll_horizontal",
	card_x_positions[card_current_index],
	scroll_duration).from(scroll_horizontal).set_trans(scroll_tween.TRANS_BACK).set_ease(scroll_tween.EASE_OUT)

@onready var margin_r: int = $CenterContainer/MarginContainer.get("theme_override_constants/margin_right")
@onready var card_space: int = $CenterContainer/MarginContainer/HBoxContainer.get("theme_override_constants/separation")
@onready var card_nodes: Array = $CenterContainer/MarginContainer/HBoxContainer.get_children()

func _ready() -> void:
	await get_tree().process_frame
	
	get_h_scroll_bar().modulate.a = 20
	
	for _card in card_nodes:
		var _card_pos_x: float = (margin_r + _card.position.x) - ((size.x - _card.position.x) / 6)
		_card.pivot_offset = (_card.size / 2)
		card_x_positions.append(_card_pos_x)
		
	scroll_horizontal = card_x_positions[card_current_index]
	scroll()
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
		if event.pressed:
			scroll_tween.stop()
		else:
			scroll()


func _on_card_menu_1_focus_entered() -> void:
	
