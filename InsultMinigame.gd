extends Node2D

func _ready():
  run_game(["everyone", "that", "gets", "close", "to", "you", "leaves"], [0, 2, 3, 6])

func run_game(insult_words, key_word_indices):
  $InsultBubble.display(insult_words, key_word_indices)
