extends Node2D

# TODO allow cursor movement by holding down the inputs

signal minigame_over

var word_bank = ["gorgonzola", "glue", "aardvark", "camel"]
var base_speed = 300
var speed
var bad_word_chance
var spawn_time
var initial_spawn_delay = 1
var row_count
var rng = RandomNumberGenerator.new()
var key_words

var word_fade_percent = 0.6
var cursor_decay = 0.8
var base_delta = 1 / 60.0
var base_cursor_y
var row_height = 114 / 4
onready var base_word_position = Vector2(10, 5)

var time_to_spawn = initial_spawn_delay
var cursor_row = 1
var curr_word = 0
var curr_word_spawned = false

onready var cursor = $InsultScroller/Cursor
onready var bg = $InsultScroller/Background
var word_scene = preload("res://Word.tscn")

func _ready():
  base_cursor_y = cursor.position.y
  base_word_position += bg.position - Vector2(bg.texture.get_width(), bg.texture.get_height()) / 2
  run_game(["everyone", "that", "gets", "close", "to", "you", "leaves"], [0, 2, 3, 6], 1, 0.85, 0.6, 4)

func run_game(insult_words, key_word_indices, speed_scalar, bad_word_spawn_chance, word_spawn_time, cursor_rows):
  rng.randomize()
  $InsultBubble.display(insult_words, key_word_indices)
  speed = speed_scalar * base_speed
  bad_word_chance = bad_word_spawn_chance
  spawn_time = word_spawn_time
  row_count = cursor_rows
  key_words = []
  for i in key_word_indices:
    key_words.append(insult_words[i])

var move_up = false
var move_down = false
func _process(delta):
  move_up = move_up or Input.is_action_just_pressed("ui_up")
  move_down = move_down or Input.is_action_just_pressed("ui_down")

func _physics_process(delta):
  handle_cursor(delta)
  
  time_to_spawn -= delta
  if time_to_spawn <= 0:
    spawn_word()
    time_to_spawn = spawn_time
    
  move_words(delta)

func move_words(delta):
  for word in $InsultScroller/Words.get_children():
    word.position.x += delta * speed
    if word.position.x > cursor.position.x:
      if word.good_word:
        if not word.on_fire:
          word.good_word = false
          word.mark_bad()
          $InsultBubble.on_InsultScroller_word_passed(false, "")
          
          curr_word_spawned = false
          curr_word += 1
          if curr_word >= key_words.size():
            emit_signal("minigame_over")
          else:
            pass # TODO
      else:
        var amount_past = word.position.x - cursor.position.x
        var percent_past = amount_past / (bg.texture.get_width() / 2)
        if percent_past > word_fade_percent:
          word.queue_free()
        word.set_transparency((word_fade_percent - percent_past) / word_fade_percent)
    elif word.position.x + word.get_size().x > cursor.position.x:
      if word.row == cursor_row:
        if word.good_word:
          word.on_fire = true
          $InsultBubble.on_InsultScroller_word_passed(true, word.word)
          # TODO
        else:
          word.mark_bad()
          $InsultBubble.on_InsultScroller_word_passed(false, word.word)
        

func spawn_word():
  if curr_word >= key_words.size():
    return
  var word_to_spawn
  var good_word = false
  if not curr_word_spawned and (rng.randf() > bad_word_chance):
    word_to_spawn = key_words[curr_word]
    curr_word_spawned = true
    good_word = true
  else:
    word_to_spawn = word_bank[rng.randi_range(0, word_bank.size() - 1)]
  var word = word_scene.instance()
  var spawn_row = rng.randi_range(0, row_count - 1)
  word.setup(word_to_spawn, spawn_row, good_word)
  $InsultScroller/Words.add_child(word)
  word.position = base_word_position + Vector2(0, spawn_row * row_height)

func handle_cursor(delta):
  if move_up && move_down:
    move_up = false
    move_down = false
  if move_up and cursor_row > 0:
    cursor_row -= 1
  if move_down and cursor_row < row_count - 1:
    cursor_row += 1
  move_up = false
  move_down = false
  
  var target_y = base_cursor_y + row_height * cursor_row
  var decay_rate = pow(cursor_decay, delta / base_delta)
  cursor.position.y = cursor.position.y * decay_rate + target_y * (1 - decay_rate)
