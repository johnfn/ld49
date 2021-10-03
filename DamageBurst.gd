extends Sprite

func _ready():
  var timer = $Timer
  timer.connect("timeout", self, "queue_free")
  timer.start()
