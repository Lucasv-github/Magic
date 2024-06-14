#TODO make sure stand has travel weave
#TODO could be better select
scoreboard players operation @s destination_x = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_x
scoreboard players operation @s destination_y = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_y
scoreboard players operation @s destination_z = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,distance=..3] destination_z

scoreboard players operation @s destination_x = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_x
scoreboard players operation @s destination_y = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_y
scoreboard players operation @s destination_z = @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=gateway_end,distance=..3] destination_z

function magic:teleport