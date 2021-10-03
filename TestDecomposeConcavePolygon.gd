extends StaticBody2D

func _ready():
  var polygon = $CollisionPolygon2D.polygon
  var shape = ConcavePolygonShape2D.new()
  
  var segments = PoolVector2Array()
  segments.resize(polygon.size() * 2);

  for i in range(polygon.size()):
    segments[(i << 1) + 0] = polygon[i]
    segments[(i << 1) + 1] = polygon[(i + 1) % polygon.size()]
  
  shape.set_segments(segments)
  var body = RigidBody2D.new()
  var owner = body.create_shape_owner(body)
  body.set_mode(RigidBody2D.MODE_STATIC)
  body.shape_owner_add_shape(owner, shape)
  add_child(body)
