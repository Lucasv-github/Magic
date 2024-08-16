tag @e[distance=..10,tag=ward_connected,scores={weave_remaining_time=1..},limit=1,tag=tied_off,sort=nearest] add ward_to_be_run

execute at @e[tag=ward_to_be_run] run scoreboard players reset @e[tag=ward_to_be_run] weave_locked_player_id
execute as @e[tag=ward_to_be_run] run function magic:weaves

tag @e remove ward_to_be_run