scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
tag @s add throw_lock_temp
execute if entity @s[tag=actively_held] as @e if score @s entity_id = Temp reg_1 run ride @s mount @e[tag=throw_lock_temp,limit=1]
execute if entity @s[tag=tied_off, scores={weave_remaining_time=1..}] as @e if score @s entity_id = Temp reg_1 run ride @s mount @e[tag=throw_lock_temp,limit=1]
tag @e remove throw_lock_temp