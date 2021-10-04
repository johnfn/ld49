extends Node2D

signal minigame_over
signal attack_landed

var word_bank = ["gorgonzola", "glue", "aardvark", "camel", "horrible", "terrible", "gross", "ugly", "that", "two", "trade", "hell", "monster", "rain", "thou", "traitor", "mess", "oof", "unstable", "virus", "far-fetched", "unconscious", "carve", "humble", "anger", "dangerous", "scab", "squid", "impossible", "tremble", "crime", "revile", "juicebox", "what", "won't", "how", "if", "then", "trap", "leg", "egg", "jim", "cooper", "libido", "stupid", "jerk", "chicken", "afraid", "ache", "annoy", "allergic", "anxious", "attack", "bizarre", "blather", "bleak", "bloat", "block", "bomb", "bother", "breakup", "saturn", "brutal", "bs", "chaos", "child", "cocky", "complain", "confess", "corrupt", "coward", "crash", "curse", "decay", "degenerate", "demon", "submissive", "breedable", "depressed", "devil", "discord", "disrupt", "down", "up", "enrage", "evil", "explode", "fail", "fear", "fake", "frozen", "garbo", "goofy", "grumpy", "harsh", "heckle", "hostile", "idiot", "impose", "inept", "irate", "jam", "junk", "kick", "lame", "lazy", "lie", "loser", "meltdown", "mistake", "mystery", "naughty", "negate", "nightmare", "noisy", "outlaw", "overkill", "pain", "panic", "petty", "jail", "quit", "rabid", "rage", "reject", "regret", "rotten", "sad", "scam", "senile", "immature", "slap", "slow", "snob", "spoil", "stuck", "suffer", "torment", "twist", "unfair", "unsafe", "vague", "villain", "weak", "wrath", "trick", "which", "who", "by", "along", "alone", "because", "into", "until", "ago", "on", "off"]

var base_speed = 300
var speed
var bad_word_chance
var spawn_time
var initial_spawn_delay = 1
var row_count
var rng = RandomNumberGenerator.new()
var key_words

var input_repeat_time = 0.25
var burst_time = 0.5
var damage_x = 1
var word_fade_percent = 0.3
var cursor_decay = 0.8
var base_delta = 1 / 60.0
var base_cursor_y
var row_height = 114 / 4
var min_bad_spawns = 1
var max_bad_spawns = 5
onready var base_word_position

var time_to_spawn = initial_spawn_delay
var cursor_row = 1
var curr_word = 0
var curr_word_spawned = false
var curr_word_node
var bad_spawns = 0
var game_ended = false
var game_started = false

onready var cursor = $InsultScroller/Cursor
onready var bg = $InsultScroller/Background
var word_scene = preload("res://Word.tscn")
var burst_scene = preload("res://DamageBurst.tscn")

func _ready():
  damage_x = (damage_x - 0.5) * bg.texture.get_width() * bg.scale.x + bg.position.x
  base_cursor_y = cursor.position.y
  base_word_position = bg.position - bg.texture.get_size() * bg.scale / 2

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
  game_started = true

var move_up = false
var move_down = false
var move_up_counter = 0
var move_down_counter = 0
func _process(delta):
  move_up = move_up or Input.is_action_just_pressed("ui_up")
  move_down = move_down or Input.is_action_just_pressed("ui_down")
  
  if Input.is_action_pressed("ui_up"):
    move_up_counter += delta
  else:
    move_up_counter = 0
    
  if Input.is_action_pressed("ui_down"):
    move_down_counter += delta
  else:
    move_down_counter = 0
    
  if move_up_counter > input_repeat_time:
    move_up = true
    move_up_counter = 0
    
  if move_down_counter > input_repeat_time:
    move_down = true
    move_down_counter = 0

func _physics_process(delta):
  if not game_started:
    return
  if not game_ended and check_game_end():
    game_ended = true
    emit_signal("minigame_over")
  
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
          reset_curr_word()
        elif word.position.x + word.get_size().x > damage_x:
          word.hit_enemy()
      else:
        var amount_past = word.position.x - cursor.position.x
        var percent_past = amount_past / (bg.texture.get_width() / 2)
        if percent_past > word_fade_percent:
          word.queue_free()
        word.set_transparency((word_fade_percent - percent_past) / word_fade_percent)
    elif word.position.x + word.get_size().x > cursor.position.x:
      if word.row == cursor_row:
        if word.good_word:
          if not word.on_fire:
            word.set_on_fire()
            reset_curr_word()
            $InsultBubble.on_InsultScroller_word_passed(true, word.word)
            emit_signal("attack_landed")
        elif not word.is_bad:
          word.mark_bad()
          $InsultBubble.on_InsultScroller_word_passed(false, word.word)
          if curr_word_spawned:
            curr_word_node.mark_bad()
          reset_curr_word()

func reset_curr_word():
  curr_word_spawned = false
  curr_word_node = null
  curr_word += 1

func spawn_word():
  if curr_word >= key_words.size():
    return
  var word_to_spawn
  var good_word = false
  if not curr_word_spawned and ((bad_spawns >= min_bad_spawns and rng.randf() > bad_word_chance) or bad_spawns >= max_bad_spawns):
    bad_spawns = 0
    word_to_spawn = key_words[curr_word]
    curr_word_spawned = true
    good_word = true
  else:
    bad_spawns += 1
    word_to_spawn = word_bank[rng.randi_range(0, word_bank.size() - 1)]
  var word = word_scene.instance()
  var spawn_row = rng.randi_range(0, row_count - 1)
  word.setup(word_to_spawn, spawn_row, good_word)
  $InsultScroller/Words.add_child(word)
  word.position = base_word_position + Vector2(0, spawn_row * row_height)
  if good_word:
    curr_word_node = word

func check_game_end():
  return curr_word >= key_words.size()

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
