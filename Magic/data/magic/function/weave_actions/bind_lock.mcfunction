################################################################################
#Purpose: Bind the entity that the weave corresponding to the armorstand @s locked on
#Runner: An armorstand holding a bind weave, run via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id

scoreboard players set Temp reg_2 0

tag @s[tag=actively_held] add bind_lock_temp_binder
tag @s[tag=tied_off, scores={weave_remaining_time=1..}] add bind_lock_temp_binder

execute as @s[tag=bind_lock_temp_binder] as @e if score @s entity_id = Temp reg_1 run tag @s add bind_lock_temp_to_bind

execute store success score Temp reg_2 run ride @e[tag=bind_lock_temp_to_bind,limit=1] mount @e[tag=bind_lock_temp_binder,limit=1]

#Allow opening while sitting
execute if score Temp reg_2 matches 1 run scoreboard players add @a[tag=bind_lock_temp_to_bind,limit=1] sneak_time 1

tag @e remove bind_lock_temp_binder
tag @e remove bind_lock_temp_to_bind