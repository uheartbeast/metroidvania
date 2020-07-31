extends Resource
class_name PlayerStats

var max_health = 4
var health = max_health setget set_health
var max_missiles = 3
var missiles = max_missiles setget set_missiles
var missiles_unlocked = false setget set_missiles_unlocked

signal player_health_changed(value)
signal player_missiles_changed(value)
signal player_missiles_unlocked(value)
signal player_died

func set_health(value):
	if value < health:
		Events.emit_signal("add_screenshake", 0.4, 0.5)
	health = clamp(value, 0, max_health)
	emit_signal("player_health_changed", health)
	if health == 0:
		emit_signal("player_died")

func set_missiles(value):
	missiles = clamp(value, 0, max_missiles)
	emit_signal("player_missiles_changed", missiles)

func set_missiles_unlocked(value):
	missiles_unlocked = value
	SaverAndLoader.custom_data.missiles_unlocked = value
	emit_signal("player_missiles_unlocked", missiles_unlocked)

func refill_stats():
	self.health = max_health
	self.missiles = max_missiles
