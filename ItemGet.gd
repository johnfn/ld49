extends Control

var spin_speed = 0.3
var rotation = 0

onready var subheader = $CenterContainer/VBoxContainer/Subheader
onready var header = $CenterContainer/VBoxContainer/Header
onready var bg = $CenterContainer/VBoxContainer/ImgContainer/Bg
onready var bg2 = $CenterContainer/VBoxContainer/ImgContainer/Bg2

var bga
var bg2a

onready var item_imgs = {
  "HALL PASS": $CenterContainer/VBoxContainer/ImgContainer/HallPass,
  "TIMMY'S SCHOOL FILES": $CenterContainer/VBoxContainer/ImgContainer/TimmyFiles,
  "TRUE ENLIGHTENMENT": $CenterContainer/VBoxContainer/ImgContainer/Enlightenment,
}

var item_descs = {
  "HALL PASS": "with this you can go anywhere your heart desires",
  "TIMMY'S SCHOOL FILES": "wow things are going poorly for you",
  "TRUE ENLIGHTENMENT": "levels of anger known only to the gods allow you to GET ANGRY, even at inanimate objects",
}

func _ready():
  subheader.text = ""
  header.text = ""
  bg.rect_pivot_offset = bg.rect_size / 2
  bg2.rect_pivot_offset = bg2.rect_size / 2
  for img in item_imgs.values():
    img.visible = false
  bga = bg.modulate.a
  bg2a = bg2.modulate.a

func set_alpha(a):
  header.modulate.a = a
  subheader.modulate.a = a
  for img in $CenterContainer/VBoxContainer/ImgContainer.get_children():
    img.modulate.a = a
  bg.modulate.a = a * bga
  bg2.modulate.a = a * bg2a
  
func show_item(item_name):
  header.text = item_name
  subheader.text = item_descs[item_name]
  item_imgs[item_name].visible = true

func hide_item():
  for img in item_imgs.values():
    img.visible = false
  header.text = ""
  subheader.text = ""
  # TODO fade out/exit

func _process(delta):
  rotation += spin_speed * delta
  bg.set_rotation(rotation)
  bg2.set_rotation(-rotation)
