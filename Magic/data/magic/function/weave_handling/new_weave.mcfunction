#say new weave

scoreboard players set @s[tag=built] state 0

#scoreboard players add @s[tag=built] player_weave_index 1
#We can live with this collision risk
execute store result score @s player_weave_index run random value 0..2147483646

scoreboard players set @s weave_length 0

tag @s remove built
tag @s remove active

#Prevent held execute again, SHOULD NOT
#scoreboard players operation Temp reg_1 = @s player_id
#execute as @e[type=minecraft:armor_stand,tag=target_point,tag=actively_held,tag=!hold_used,scores={state=1}] if score @s player_id = Temp reg_1 run function magic:cleanup/remove_cleanup