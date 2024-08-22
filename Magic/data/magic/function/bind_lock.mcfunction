scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
tag @s add bind_lock_temp

execute if entity @s[tag=actively_held] as @e if score @s entity_id = Temp reg_1 run ride @s mount @e[tag=bind_lock_temp,limit=1]
execute if entity @s[tag=tied_off, scores={weave_remaining_time=1..}] as @e if score @s entity_id = Temp reg_1 run ride @s mount @e[tag=bind_lock_temp,limit=1]

tag @e remove bind_lock_temp