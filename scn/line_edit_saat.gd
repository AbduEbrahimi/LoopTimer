extends SpinBox

var _old_text := ""

func _ready() -> void:
	# دریافت LineEdit داخل SpinBox
	var line_edit: LineEdit = get_line_edit()
	# اتصال به سیگنال تغییر متن
	line_edit.text_changed.connect(_on_text_changed)

func _on_text_changed(new_text: String) -> void:
	# اگر متن خالی است یا عددی معتبر است، آن را ذخیره کن
	if new_text.is_empty() or new_text.is_valid_int():
		_old_text = new_text
	else:
		# در غیر این صورت، متن قبلی معتبر را برگردان
		var line_edit: LineEdit = get_line_edit()
		line_edit.text = _old_text
		# برای بهبود تجربه کاربری، مکان‌نما را به انتها ببر
		line_edit.caret_column = line_edit.text.length()
