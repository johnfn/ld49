extends Node2D

var row
var word
var good_word
var on_fire
var is_bad

func setup(c_word, c_row, c_good_word):
  row = c_row
  word = c_word
  good_word = c_good_word
  on_fire = false
  is_bad = false
  get_node("Label").text = word

func get_size():
  return get_node("Label").get_combined_minimum_size()

func mark_bad():
  is_bad = true
  good_word = false
  on_fire = false
  get_node("Label").add_color_override("font_color", Color(1, 0.2, 0.2))

func set_transparency(a):
  get_node("Label").modulate.a = a
