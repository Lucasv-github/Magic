scoreboard players operation Temp reg_1 = @s weave_locked_player_id
execute as @a if score @s player_id = Temp reg_1 run tag @s add heal_me

#Prevent self
execute if score Temp reg_1 = @s player_id run tag @a remove heal_me

effect give @a[tag=heal_me] minecraft:regeneration 2 2
effect give @a[tag=heal_me,tag=!using] minecraft:hunger 10 255

scoreboard players operation Remove_force reg_1 = @a[tag=heal_me,tag=using,tag=can_use,limit=1] current_held
scoreboard players operation Remove_force reg_1 /= 2 reg_1
scoreboard players add Remove_force reg_1 500
execute as @a[tag=heal_me,tag=using,tag=can_use] run function magic:remove_force_amount

tag @a remove heal_me