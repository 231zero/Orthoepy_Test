extends Control


@onready var buttons = [$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button2,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button3,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button4,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button5,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button6,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button7,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button8,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button9,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button10,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button11,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button12,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button13,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button14,
						$Question_Tab/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/test_button15]




func disabled_buttons():
	Audio.play_click()
	disable_buttons(true)
	Global.active_window = 'test'
	# Transition here
	get_parent().get_parent().get_node("AnimationPlayer").play('fade_in')
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/test.tscn")



func _on_test_button_pressed():
	Global.words = ["аэропОрты", "аэропОрт", "бАнты", "бОроду", "бородА", "бухгАлтеров", "бухгАлтер", "вероисповЕдание", "водопровОд", "газопровОд", "граждАнство", "дефИс", "дешевИзна", "диспансЕр", "договорЁнность", "докумЕнт", "досУг", "еретИк", "жалюзИ", "знАчимость"]
	Global.test = 1
	disabled_buttons()


func _on_test_button_2_pressed():
	Global.words = ["Иксы", "каталОг", "квартАл", "киломЕтр", "кОнусов", "кОнус", "корЫсть", "крАны", "кремЕнь", "кремнЯ", "лЕкторов", "лЕктор", "лОктя", "лОкоть", "локтЕй", "лыжнЯ", "мЕстностей", "мЕстность", "намЕрение", "нарОст"]
	Global.test = 2
	disabled_buttons()


func _on_test_button_3_pressed():
	Global.words = ["нЕдруг", "недУг", "некролОг", "нЕнависть", "нефтепровОд", "новостЕй", "нОвость", "нОгтя", "нОготь", "ногтЕй", "Отрочество", "партЕр", "портфЕль", "пОручни", "придАное", "призЫв", "свЁкла", "сирОты", "сиротА", "созЫв"]
	Global.test = 3
	disabled_buttons()


func _on_test_button_4_pressed():
	Global.words = ["сосредотОчение", "срЕдства", "срЕдство", "стАтуя", "столЯр", "тамОжня", "тОрты", "тУфля", "цемЕнт", "цЕнтнер", "цепОчка", "шАрфы", "шофЁр", "экспЕрт", "вернА", "вЕрный", "знАчимый", "красИвее", "красИвый", "красИвейший"]
	Global.test = 4
	disabled_buttons()


func _on_test_button_5_pressed():
	Global.words = ["кУхонный", "ловкА", "лОвкий", "мозаИчный", "оптОвый", "прозорлИвый", "прозорлИва", "слИвовый", "бралА", "бралАсь", "брАться", "взялА", "взЯть", "взялАсь", "взЯться", "влилАсь", "влИться", "ворвалАсь", "ворвАться", "воспринЯть"]
	Global.test = 5
	disabled_buttons()


func _on_test_button_6_pressed():
	Global.words = ["воспринялА", "воссоздалА", "воссоздАть", "вручИт", "вручИть", "гналА", "гнАть", "гналАсь", "гнАться", "добралА", "добрАть", "добралАсь", "добрАться", "дождалАсь", "дождАться", "дозвонИтся", "дозвонИться", "дозИровать", "ждалА", "ждАть"]
	Global.test = 6
	disabled_buttons()


func _on_test_button_7_pressed():
	Global.words = ["жилОсь", "жИться", "закУпорить", "занЯть", "зАнял", "занялА", "зАняли", "заперлА", "заперЕть", "запломбировАть", "защемИт", "защемИть", "звалА", "звАть", "звонИт", "звонИть", "кАшлянуть", "клАла", "клАсть", "клЕить"]
	Global.test = 7
	disabled_buttons()


func _on_test_button_8_pressed():
	Global.words = ["крАлась", "крАсться", "кровоточИть", "лгалА", "лгАть", "лилА", "лилАсь", "лИться", "навралА", "наврАть", "наделИт", "наделИть", "надорвалАсь", "надорвАться", "назвалАсь", "назвАться", "накренИтся", "накренИться", "налилА", "налИть"]
	Global.test = 8
	disabled_buttons()


func _on_test_button_9_pressed():
	Global.words = ["нарвалА", "нарвАть", "начАть", "нАчал", "началА", "нАчали", "обзвонИт", "обзвонИть", "облегчИть", "облегчИт", "облилАсь", "облИться", "обнялАсь", "обнЯться", "обогналА", "обогнАть", "ободралА", "ободрАть", "ободрИть", "ободрИт"]
	Global.test = 9
	disabled_buttons()


func _on_test_button_10_pressed():
	Global.words = ["ободрИться", "ободрИтся", "обострИть", "одолжИть", "одолжИт", "озлОбить", "оклЕить", "окружИт", "окружИть", "опОшлить", "освЕдомиться", "освЕдомится", "отбылА", "отбЫть", "отдалА", "отдАть", "откУпорить", "отозвалА", "отозвАть", "отозвалАсь"]
	Global.test = 10
	disabled_buttons()


func _on_test_button_11_pressed():
	Global.words = ["отозвАться", "перезвонИт", "перезвонИть", "перелилА", "перелИть", "плодоносИть", "пломбировАть", "повторИт", "повторИть", "позвалА", "позвАть", "позвонИт", "позвонИть", "полилА", "полИть", "положИть", "положИл", "понЯть", "понялА", "послАла"]
	Global.test = 11
	disabled_buttons()


func _on_test_button_12_pressed():
	Global.words = ["послАть", "прибЫть", "прИбыл", "прибылА", "прИбыли", "принЯть", "прИнял", "принялА", "прИняли", "рвалА", "рвАть", "сверлИт", "сверлИть", "снялА", "совралА", "соврАть", "создалА", "создАть", "сорвалА", "сорвАть"]
	Global.test = 12
	disabled_buttons()


func _on_test_button_13_pressed():
	Global.words = ["сорИт", "сорИть", "убралА", "убрАть", "углубИть", "укрепИт", "укрепИть", "чЕрпать", "щемИт", "щемИть", "щЁлкать", "довезЁнный", "зАгнутый", "зАнятый", "занятА", "зАпертый", "заселЁнный", "заселенА", "кормЯщий", "кровоточАщий"]
	Global.test = 13
	disabled_buttons()


func _on_test_button_14_pressed():
	Global.words = ["нажИвший", "налИвший", "нанЯвшийся", "начАвший", "нАчатый", "низведЁнный", "облегчЁнный", "ободрЁнный", "обострЁнный", "отключЁнный", "повторЁнный", "поделЁнный", "понЯвший", "прИнятый", "принятА", "приручЁнный", "прожИвший", "снятА", "снЯтый", "сОгнутый"]
	Global.test = 14
	disabled_buttons()


func _on_test_button_15_pressed():
	Global.words = ["углублЁнный", "закУпорив", "начАв", "начАвшись", "отдАв", "поднЯв", "понЯв", "прибЫв", "создАв", "вОвремя", "дОверху", "донЕльзя", "дОнизу", "дОсуха", "зАсветло", "зАтемно", "красИвее", "красИво", "надОлго", "ненадОлго"]
	Global.test = 15
	disabled_buttons()


func _on_close_pressed():
	disable_buttons(true)
	Audio.play_click()
	if Global.active_window == 'choose_test':
		get_parent().get_parent().disable_buttons(false)
		Audio.play_pop_down_window()
		$AnimationPlayer.play_backwards('popup')
		Global.active_window = 'menu'

func disable_buttons(t):
	for i in buttons:
		i.disabled = t
