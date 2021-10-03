extends Node2D

signal word_passed(successful_hit, word_hit)
signal game_ended

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


func run_game(insult_words, key_word_indices):
  print(insult_words)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass
