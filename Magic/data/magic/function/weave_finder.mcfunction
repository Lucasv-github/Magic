scoreboard players operation Temp reg_1 = @s player_id

#Need to be above
scoreboard players set Temp reg_2 1
execute as @e[scores={finder_time=1..}] if score @s finder_owner_id = Temp reg_1 run scoreboard players add Temp reg_2 1

#Allow removal with same weave
execute as @e[limit=1,sort=nearest,distance=..10,tag=!target_point, type=!snowball] if score @s finder_time matches 1.. run tag @s add just_removed_finder
scoreboard players set @e[tag=just_removed_finder] finder_index 0
scoreboard players set @e[tag=just_removed_finder] finder_owner_id 0
scoreboard players set @e[tag=just_removed_finder] finder_time 0

execute as @e[limit=1,sort=nearest,distance=..10,tag=!target_point, type=!snowball] run scoreboard players operation @s[tag=!just_removed_finder] finder_index = Temp reg_2
execute as @e[limit=1,sort=nearest,distance=..10,tag=!target_point, type=!snowball] run scoreboard players operation @s[tag=!just_removed_finder] finder_owner_id = Temp reg_1
execute as @e[limit=1,sort=nearest,distance=..10,tag=!target_point, type=!snowball] run scoreboard players set @s[tag=!just_removed_finder] finder_time 600

tag @e[limit=1,sort=nearest,distance=..10,tag=!target_point, type=!snowball] remove just_removed_finder