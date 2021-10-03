extends Control

onready var text = $SpeechBubbleBG/Text

var gray_text_color = Color.gray
var unreached_keyword_color = Color.darkgray
var black_text_color = Color.black
var correct_keyword_color = Color.orange
var incorrect_keyword_color = Color.brown

var rng = RandomNumberGenerator.new()
var _insult_words = []
var _keyword_indices = []

var words = []

var keyword_font = load("res://fonts/keyword_font.tres")
var word_font = load("res://fonts/word_font.tres")
  
var index = 0
var test_bools = [true, true, false, false]
var test_hit_words = ["everyone", "gets", null, "icepack"]

var word_styles = {}

func _ready():
  rng.randomize()

func _process(delta):
  pass
#  Fake signals for debugging
#  rng.randomize()
#  var my_random_number = rng.randi_range(1, 100)
#  if my_random_number == 1:
#    if index > 3:
#      return
#    on_InsultScroller_word_passed(test_bools[index], test_hit_words[index])
#    index += 1
  
  
func display(insult_words, key_word_indices):
  _insult_words = insult_words
  words = insult_words
  _keyword_indices = key_word_indices
  var text_content = ""
  for i in words.size():
    word_styles[i] = {} 
    
  for i in words.size():
    word_styles[i]["reached"] = false
    word_styles[i]["correct"] = true
    if i in _keyword_indices:
      word_styles[i]["is_keyword"] = true
    else:
      word_styles[i]["is_keyword"] = false
      
  render_text()
    
  
func render_text():
  clear()
  for i in word_styles.keys():
    var style = word_styles[i]
    if style["is_keyword"]:
      text.push_font(keyword_font)
      if style["reached"]:
        if style["correct"]: 
          text.push_color(correct_keyword_color)
        else:
          text.push_color(incorrect_keyword_color)
      else:
          text.push_color(unreached_keyword_color)
    else:
      text.push_font(word_font)
      if style["reached"]:
        text.push_color(black_text_color)
      else:
        text.push_color(gray_text_color)
      
    text.add_text(words[i])
    if i == len(words) - 1:
      text.add_text(".")
    else:
      text.add_text(" ")
    
func clear():
  text.clear()

func on_InsultScroller_word_passed(successful_hit, word_hit):
#  print("%s | %s" % [successful_hit, word_hit])
  if successful_hit:
    var found_word = false
    for i in words.size():
      var word = words[i]
      if word == word_hit:
        found_word = true
        word_styles[i]["reached"] = true
        word_styles[i]["correct"] = true
        for j in range(i+1, words.size()):
          if not word_styles[j]["is_keyword"]:
            word_styles[j]["reached"] = true
          else:
            break
        break
  else:
    if word_hit:
      var found_word = false
      for i in words.size():
        if word_styles[i]["is_keyword"]:
          if word_styles[i]["reached"] == true:
            continue
          else:
            words[i] = word_hit
            word_styles[i]["reached"] = true
            word_styles[i]["correct"] = false
            for j in range(i+1, words.size()):
              if not word_styles[j]["is_keyword"]:
                word_styles[j]["reached"] = true
              else:
                break
            break
    else:
      var found_word = false
      for i in words.size():
        if word_styles[i]["is_keyword"]:
          if word_styles[i]["reached"] == true:
            continue
          else:
            words[i] = "…UHHH,"
            word_styles[i]["reached"] = true
            word_styles[i]["correct"] = false
            for j in range(i+1, words.size()):
              if not word_styles[j]["is_keyword"]:
                word_styles[j]["reached"] = true
              else:
                break
            break
           
  render_text()
