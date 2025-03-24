class_name MobBee3D extends Mob3D

func _ready() -> void:
	var state_machine := AI.StateMachine.new()
	add_child(state_machine)

	var idle := AI.StateIdle.new(self)
	var chase  := AI.StateChase.new(self)
	chase.chase_speed = 3.0
	var look_at_player := AI.StateLookAtPlayer.new(self)
	look_at_player.duration = 2.0
	var charge := AI.StateCharge.new(self)
	charge.charge_speed = 14.0
	var wait_after_charge := AI.StateWait.new(self)
	wait_after_charge.duration = 1.5

	state_machine.transitions = {
		idle: {
			AI.Events.PLAYER_ENTERED_LINE_OF_SIGHT: chase,
		},
		chase: {
			AI.Events.PLAYER_EXITED_LINE_OF_SIGHT: idle,
			AI.Events.PLAYER_ENTERED_ATTACK_RANGE: look_at_player,
			
		}
	}
	state_machine.activate(idle)
	state_machine.is_debugging = true
