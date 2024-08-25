scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
tag @s add throw_lock_temp_thrower

scoreboard players set Temp reg_2 0

execute as @e if score @s entity_id = Temp reg_1 store success score Temp reg_2 run tag @s add throw_lock_temp_to_throw

execute store success score Temp reg_2 run ride @e[tag=throw_lock_temp_to_throw,limit=1] mount @e[tag=throw_lock_temp_thrower,limit=1]

#Allow opening while sitting
execute if score Temp reg_2 matches 1 run scoreboard players add @a[tag=throw_lock_temp_to_throw,limit=1] sneak_time 1

tag @e remove throw_lock_temp_thrower