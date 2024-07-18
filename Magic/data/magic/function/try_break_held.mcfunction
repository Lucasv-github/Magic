tag @s add trying_to_break_free_held

#Count how many shielding

scoreboard players set Temp reg_1 0

#Count how many shielding, use multiply by the amount the shielded tried to open with (click-10 (10 might change))
execute as @e[type=armor_stand,tag=target_point, tag=actively_held,scores={t_1=5,t_2=5,t_3=5,t_4=0}] if score @s weave_execute_id = @a[tag=trying_to_break_free_held, limit=1] player_id run scoreboard players add Temp reg_1 1
execute as @e[type=armor_stand,tag=target_point, tag=actively_held,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0}] if score @s weave_execute_id = @a[tag=trying_to_break_free_held, limit=1] player_id run scoreboard players add Temp reg_1 1

scoreboard players remove @s click_counter 1

scoreboard players operation Temp reg_1 *= @s click_counter

#Move how much to try to break free with from enemy (will be removed from enemy) to own reg_1
scoreboard players operation @s reg_1 = Temp reg_1


scoreboard players set Temp reg_1 0

#Count their strength
#TODO store this in armor stand
execute as @e[type=armor_stand,tag=target_point, tag=actively_held,scores={t_1=5,t_2=5,t_3=5,t_4=0}] if score @s weave_execute_id = @a[tag=trying_to_break_free_held, limit=1] player_id run scoreboard players operation Temp reg_1 += @s halve_amount_hold
execute as @e[type=armor_stand,tag=target_point, tag=actively_held,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0}] if score @s weave_execute_id = @a[tag=trying_to_break_free_held, limit=1] player_id run scoreboard players operation Temp reg_1 += @s halve_amount_hold

#Enemy draw factor (unlikely to be anything unless you are stronger than shielder)
#Copy
scoreboard players operation Temp reg_2 = @s halve_amount_hold
scoreboard players operation Temp reg_2 /= Temp reg_1


#Self draw factor
scoreboard players operation Temp reg_1 /= @s halve_amount_hold



#TODO deprecate with above fix
scoreboard players add Temp reg_1 1

#Now have how many to multiply draw from person breaking free
#Do the multiplication
scoreboard players operation @s reg_3 = @s reg_1
scoreboard players operation @s reg_3 *= Temp reg_1

#Enemy draw multiplication (after self as this destroys reg_1)
scoreboard players operation @s reg_1 *= Temp reg_2

#Prepare enemy amount
scoreboard players operation Remove_force reg_1 = @s reg_1

#tellraw @a {"score":{"name":"Temp","objective":"reg_2"}}

#Find enemy (on of shielders it is fine to find many, only last random id will be used)
execute as @e[type=armor_stand,tag=target_point, tag=actively_held,scores={t_1=5,t_2=5,t_3=5,t_4=0},sort=random] if score @s weave_execute_id = @a[tag=trying_to_break_free_held, limit=1] player_id run scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=armor_stand,tag=target_point, tag=actively_held,scores={t_1=5,t_2=5,t_3=5,t_4=5,t_5=0},sort=random] if score @s weave_execute_id = @a[tag=trying_to_break_free_held, limit=1] player_id run scoreboard players operation Temp reg_1 = @s player_id


#Enemy
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run effect give @s minecraft:nausea 5
scoreboard players operation Remove_force reg_1 *= 10 reg_1
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run function magic:remove_force_amount

#Self
damage @s 1 minecraft:magic
effect give @s minecraft:nausea 5

scoreboard players operation @s reg_3 *= 10 reg_1
scoreboard players operation @s regenerated_strength -= @s reg_3
scoreboard players set @s[scores={regenerated_strength=..0}] regenerated_strength 0

tag @s remove trying_to_break_free_held