extends Node2D

@onready var level_label: RichTextLabel = $Level
@onready var timer_label: RichTextLabel = $Timer
@onready var hearth_container: HBoxContainer = $"Hearth container"

var countdown: float = 3.0 

func _ready() -> void:

	level_label.text = "Level " + str(Global.minigames_done + 1)
	
	
	update_garlic_display()

func _process(delta: float) -> void:
	if countdown > 0:
		countdown -= delta
		timer_label.text = str(snapped(countdown, 0.1))
	else:
		timer_label.text = "GO!"
		

func update_garlic_display() -> void:
	var trashbins = hearth_container.get_children()
	for i in range(trashbins.size()):
		if i < Global.lives:
			trashbins[i].visible = true
		else:
			trashbins[i].visible = false
