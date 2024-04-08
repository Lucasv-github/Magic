scoreboard players operation Temp reg_1 = @s finder_owner_id
execute store result score @s position_x run data get entity @s Pos[0]
execute store result score @s position_y run data get entity @s Pos[1]
execute store result score @s position_z run data get entity @s Pos[2]

execute as @a if score @s player_id = Temp reg_1 run tag @s add current_tracker_see
tellraw @a[tag=current_tracker_see] ["",{"score":{"name":"@s","objective":"finder_index"},"color":"gold"},{"text":": "},{"selector":"@s","color":"gold"},{"text":" "},{"score":{"name":"@s","objective":"position_x"},"color":"gold"},{"text":" : "},{"score":{"name":"@s","objective":"position_y"},"color":"gold"},{"text":" : "},{"score":{"name":"@s","objective":"position_z"},"color":"gold"}]
tag @a remove current_tracker_see
