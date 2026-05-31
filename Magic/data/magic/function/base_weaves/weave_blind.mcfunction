scoreboard players operation Temp reg_1 = @s weave_locked_entity_id
execute store result storage magic:levitate amount int 1 run scoreboard players get @s reg_1
execute as @e if score @s entity_id = Temp reg_1 run effect give @s minecraft:blindness 20 255 true

tag @s add weave_blind