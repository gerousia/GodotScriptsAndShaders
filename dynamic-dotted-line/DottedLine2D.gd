extends Control

export (float, 0.1, 1.0) var vertical_anchor = 0.1
export var dot_color = Color.white
export var dot_size = 1
export var dot_spacing = 10 

func _draw():
	var y = rect_size.y * vertical_anchor
	for x in range(0, rect_size.x, dot_size + dot_spacing):
		var pos = Vector2(x, y)
		var size = Vector2(dot_size, dot_size)
		var rect = Rect2(pos, size)
		
		var stylebox = StyleBoxFlat.new()
		stylebox.anti_aliasing = true
		stylebox.bg_color = dot_color
		stylebox.set_corner_radius_all(dot_size)
		
		draw_style_box(stylebox, rect)

func _notification(what):
	if what == NOTIFICATION_DRAW:
		update()

func _on_resize():
	update()
