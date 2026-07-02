extends Control

@onready var label_saat: Label = $VBoxContainer/HBox_time_text/Label_saat
@onready var label_minet: Label = $VBoxContainer/HBox_time_text/Label_minet
@onready var label_secend: Label = $VBoxContainer/HBox_time_text/Label_secend
@onready var timer_count: Timer = $Timer_count
@onready var button_start: Button = $VBoxContainer/HBox_time/Button_start
@onready var line_edit_saat: SpinBox = $VBoxContainer/HBox_time/LineEdit_saat
@onready var line_edit_dagigeh: SpinBox = $VBoxContainer/HBox_time/LineEdit_dagigeh
@onready var line_edit_chanieh: SpinBox = $VBoxContainer/HBox_time/LineEdit_chanieh
@onready var check_box_tekrar: CheckBox = $VBoxContainer/HBox_time/CheckBox_tekrar
@onready var label_huor: Label = $VBoxContainer/HBox_text/Label_huor
@onready var label_min: Label = $VBoxContainer/HBox_text/Label_min
@onready var label_sce: Label = $VBoxContainer/HBox_text/Label_sce
const SFX_ALARM_LOOP_1 = preload("uid://h1dj331av28p")
const SFX_ALARM_LOOP_2 = preload("uid://bvgcw3auu3cgr")
const SFX_ALARM_LOOP_3 = preload("uid://b13p3inuxaneg")
const SFX_ALARM_LOOP_4 = preload("uid://ce7mxpoyphjme")
const SFX_ALARM_LOOP_5 = preload("uid://nlsiu4dt50j")
@onready var check_box_1: CheckBox = $VBoxContainer/HBox_sound/CheckBox
@onready var check_box_2: CheckBox = $VBoxContainer/HBox_sound/CheckBox2
@onready var check_box_3: CheckBox = $VBoxContainer/HBox_sound/CheckBox3
@onready var check_box_4: CheckBox = $VBoxContainer/HBox_sound/CheckBox4
@onready var check_box_5: CheckBox = $VBoxContainer/HBox_sound/CheckBox5
@onready var check_box_eng: CheckBox = $VBoxContainer/HBoxContainer/CheckBox_eng
@onready var check_box_persian: CheckBox = $VBoxContainer/HBoxContainer/CheckBox_persian
@onready var check_box_arabic: CheckBox = $VBoxContainer/HBoxContainer/CheckBox_arabic
@onready var check_box_spanish: CheckBox = $VBoxContainer/HBoxContainer/CheckBox_Spanish
@onready var check_box_chinese: CheckBox = $VBoxContainer/HBoxContainer/CheckBox_Chinese
@onready var check_box_portuguese: CheckBox = $VBoxContainer/HBoxContainer/CheckBox_Portuguese
@onready var audio_fx: AudioStreamPlayer = $Audio_fx
@onready var audio_start: AudioStreamPlayer = $Audio_start

@onready var langueg:String = "eng"
var all_languegs: Dictionary = {
	"fa": ["متوقف کردن","شروع کردن","   زمان را تنظیم کنید  ","ساعت","دقیقه","ثانیه","تکرار","صدای 1","صدای 2","صدای 3","صدای 4","صدای 5"],
	"eng": ["Stop","Start","   Set the time  ","Hour","Minute","Second","Repeat","Sound 1","Sound 2","Sound 3","Sound 4","Sound 5"],
	"ar": ["إيقاف","بدء","   ضبط الوقت  ","ساعة","دقيقة","ثانية","تكرار","صوت 1","صوت 2","صوت 3","صوت 4","صوت 5"],
	"sp": ["Detener","Comenzar","   Ajustar la hora  ","Hora","Minuto","Segundo","Repetir","Sonido 1","Sonido 2","Sonido 3","Sonido 4","Sonido 5"],
	"ch": ["停止","开始","   设置时间  ","小时","分钟","秒","重复","声音 1","声音 2","声音 3","声音 4","声音 5"],
	"po": ["Parar","Começar","   Definir o tempo  ","Hora","Minuto","Segundo","Repetir","Som 1","Som 2","Som 3","Som 4","Som 5"]
}
var start_time:bool = false
var time_saat
var time_min
var time_sec
var m_s:Array = [0.0,0.0,0.0] #megdar line_edit_saat dagigeh va sanyeh
var fx_choice:int = 5

func _ready() -> void:
	update_lang()

func update_text(saat:int,mi:int,sec:int) -> void:
	label_saat.text = str(saat)
	label_minet.text = str(mi)
	label_secend.text = str(sec)

func _on_button_1_pressed() -> void:
	if !timer_count.is_stopped():
		timer_count.stop()
	time_saat = 00
	time_min = 3
	time_sec = 00
	line_edit_saat.value = time_saat
	line_edit_dagigeh.value = time_min
	line_edit_chanieh.value = time_sec
	update_text(time_saat,time_min,time_sec)
	start_time = false
	
func _on_button_3_pressed() -> void:
	if !timer_count.is_stopped():
		timer_count.stop()
	time_saat = 00
	time_min = 5
	time_sec = 00
	line_edit_saat.value = time_saat
	line_edit_dagigeh.value = time_min
	line_edit_chanieh.value = time_sec
	update_text(time_saat,time_min,time_sec)
	start_time = false
	
func _on_button_5_pressed() -> void:
	if !timer_count.is_stopped():
		timer_count.stop()
	time_saat = 00
	time_min = 10
	time_sec = 00
	line_edit_saat.value = time_saat
	line_edit_dagigeh.value = time_min
	line_edit_chanieh.value = time_sec
	update_text(time_saat,time_min,time_sec)
	start_time = false
	
func _on_button_10_pressed() -> void:
	if !timer_count.is_stopped():
		timer_count.stop()
	time_saat = 00
	time_min = 30
	time_sec = 00
	line_edit_saat.value = time_saat
	line_edit_dagigeh.value = time_min
	line_edit_chanieh.value = time_sec
	update_text(time_saat,time_min,time_sec)
	start_time = false
	
func _on_button_15_pressed() -> void:
	if !timer_count.is_stopped():
		timer_count.stop()
	time_saat = 01
	time_min = 00
	time_sec = 00
	line_edit_saat.value = time_saat
	line_edit_dagigeh.value = time_min
	line_edit_chanieh.value = time_sec
	update_text(time_saat,time_min,time_sec)
	start_time = false

func _on_button_30_pressed() -> void:
	if !timer_count.is_stopped():
		timer_count.stop()
	time_saat = 01
	time_min = 30
	time_sec = 00
	line_edit_saat.value = time_saat
	line_edit_dagigeh.value = time_min
	line_edit_chanieh.value = time_sec
	update_text(time_saat,time_min,time_sec)
	start_time = false

func _on_button_start_pressed() -> void:
	if line_edit_saat.value == 0.0 and line_edit_dagigeh.value == 0.0 and line_edit_chanieh.value == 0.0:
		return
	if !start_time:
		time_saat = line_edit_saat.value
		time_min = line_edit_dagigeh.value
		time_sec = line_edit_chanieh.value
		update_text(time_saat,time_min,time_sec)
		timer_count.start()
		button_start.text = all_languegs[langueg][0]
		start_time = true
		audio_start.play()
	else :
		time_saat = 0
		time_min = 0
		time_sec = 0
		check_m_s()
		timer_count.stop()
		start_time = false

func _on_timer_count_timeout() -> void:
	count_timer()
	
func count_timer() -> void:
	time_sec -= 1
	if time_sec < 0 and time_min > 0:
		time_min -= 1
		time_sec = 59
	if time_sec < 0 and time_min == 0 and time_saat > 0:
		time_saat -= 1
		time_min = 59
		time_sec = 59
	if time_saat == 0 and  time_min == 0 and time_sec < 0:
		finsh()
	update_text(time_saat,time_min,time_sec)

func finsh() -> void:
	if check_box_tekrar.button_pressed:
		time_saat = line_edit_saat.value
		time_min = line_edit_dagigeh.value
		time_sec = line_edit_chanieh.value
		update_text(time_saat,time_min,time_sec)
	else :
		timer_count.stop()
		time_saat = 0
		time_min = 0
		time_sec = 0
		button_start.text = all_languegs[langueg][1]
		start_time = false
		update_text(time_saat,time_min,time_sec)
	play_sound()

func _on_line_edit_saat_value_changed(value: float) -> void:
	m_s[0] = value
	check_m_s()

func _on_line_edit_dagigeh_value_changed(value: float) -> void:
	m_s[1] = value
	check_m_s()
	
func _on_line_edit_chanieh_value_changed(value: float) -> void:
	m_s[2] = value
	check_m_s()
	
func check_m_s() -> void:
	timer_count.stop()
	start_time = false
	if m_s == [0.0,0.0,0.0]:
		button_start.text = all_languegs[langueg][2]
	else :
		button_start.text = all_languegs[langueg][1]
		update_text(line_edit_saat.value,line_edit_dagigeh.value,line_edit_chanieh.value)
		
func _on_check_box_pressed() -> void:
	if check_box_1.button_pressed:
		check_box_2.button_pressed = false
		check_box_3.button_pressed = false
		check_box_4.button_pressed = false
		check_box_5.button_pressed = false
		fx_choice = 1
		play_sound()

func _on_check_box_2_pressed() -> void:
	if check_box_2.button_pressed:
		check_box_1.button_pressed = false
		check_box_3.button_pressed = false
		check_box_4.button_pressed = false
		check_box_5.button_pressed = false
		fx_choice = 2
		play_sound()
		
func _on_check_box_3_pressed() -> void:
	if check_box_3.button_pressed:
		check_box_2.button_pressed = false
		check_box_1.button_pressed = false
		check_box_4.button_pressed = false
		check_box_5.button_pressed = false
		fx_choice = 3
		play_sound()

func _on_check_box_4_pressed() -> void:
	if check_box_4.button_pressed:
		check_box_2.button_pressed = false
		check_box_3.button_pressed = false
		check_box_1.button_pressed = false
		check_box_5.button_pressed = false
		fx_choice = 4
		play_sound()

func _on_check_box_5_pressed() -> void:
	if check_box_5.button_pressed:
		check_box_2.button_pressed = false
		check_box_3.button_pressed = false
		check_box_4.button_pressed = false
		check_box_1.button_pressed = false
		fx_choice = 5
		play_sound()
		
func play_sound() -> void:
	match fx_choice:
		1:
			audio_fx.stream = SFX_ALARM_LOOP_1
			audio_fx.play()
		2:
			audio_fx.stream = SFX_ALARM_LOOP_2
			audio_fx.play()
		3:
			audio_fx.stream = SFX_ALARM_LOOP_3
			audio_fx.play()
		4:
			audio_fx.stream = SFX_ALARM_LOOP_4
			audio_fx.play()
		5:
			audio_fx.stream = SFX_ALARM_LOOP_5
			audio_fx.play()
			
func _on_check_box_eng_pressed() -> void:
	check_box_persian.button_pressed = false
	check_box_arabic.button_pressed = false
	check_box_chinese.button_pressed = false
	check_box_portuguese.button_pressed = false
	check_box_spanish.button_pressed = false
	langueg = "eng"
	update_lang()

func _on_check_box_persian_pressed() -> void:
	check_box_eng.button_pressed = false
	check_box_arabic.button_pressed = false
	check_box_chinese.button_pressed = false
	check_box_portuguese.button_pressed = false
	check_box_spanish.button_pressed = false
	langueg = "fa"
	update_lang()
	
func _on_check_box_arabic_pressed() -> void:
	check_box_eng.button_pressed = false
	check_box_persian.button_pressed = false
	check_box_chinese.button_pressed = false
	check_box_portuguese.button_pressed = false
	check_box_spanish.button_pressed = false
	langueg = "ar"
	update_lang()

func _on_check_box_spanish_pressed() -> void:
	check_box_eng.button_pressed = false
	check_box_persian.button_pressed = false
	check_box_chinese.button_pressed = false
	check_box_portuguese.button_pressed = false
	check_box_arabic.button_pressed = false
	langueg = "sp"
	update_lang()

func _on_check_box_chinese_pressed() -> void:
	check_box_eng.button_pressed = false
	check_box_persian.button_pressed = false
	check_box_arabic.button_pressed = false
	check_box_portuguese.button_pressed = false
	check_box_spanish.button_pressed = false
	langueg = "ch"
	update_lang()

func _on_check_box_portuguese_pressed() -> void:
	check_box_eng.button_pressed = false
	check_box_persian.button_pressed = false
	check_box_chinese.button_pressed = false
	check_box_arabic.button_pressed = false
	check_box_spanish.button_pressed = false
	langueg = "po"
	update_lang()
	
func update_lang() -> void:
	button_start.text = all_languegs[langueg][2]
	label_huor.text = all_languegs[langueg][3]
	label_min.text = all_languegs[langueg][4]
	label_sce.text = all_languegs[langueg][5]
	check_box_tekrar.text = all_languegs[langueg][6]
	check_box_1.text = all_languegs[langueg][7]
	check_box_2.text = all_languegs[langueg][8]
	check_box_3.text = all_languegs[langueg][9]
	check_box_4.text = all_languegs[langueg][10]
	check_box_5.text = all_languegs[langueg][11]
	
func _on_button_github_pressed() -> void:
	OS.shell_open("https://github.com/AbduEbrahimi/LoopTimer")
	audio_start.play()
