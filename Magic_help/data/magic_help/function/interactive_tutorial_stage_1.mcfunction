function magic_help:clear_chat
execute at @s run playsound minecraft:entity.arrow.hit_player

effect give @s minecraft:resistance infinite 255
effect give @s minecraft:saturation infinite 1

execute store result score @s destination_x run data get entity @s Pos[0]
execute store result score @s destination_y run data get entity @s Pos[1]
execute store result score @s destination_z run data get entity @s Pos[2]

spreadplayers 0 0 0 10000 false @s

execute at @s run setblock ~1 ~ ~ minecraft:barrier
execute at @s run setblock ~-1 ~ ~ minecraft:barrier

execute at @s run setblock ~ ~ ~1 minecraft:barrier
execute at @s run setblock ~ ~ ~-1 minecraft:barrier

execute at @s run setblock ~1 ~1 ~ minecraft:barrier
execute at @s run setblock ~-1 ~1 ~ minecraft:barrier

execute at @s run setblock ~ ~1 ~1 minecraft:barrier
execute at @s run setblock ~ ~1 ~-1 minecraft:barrier


execute at @s run setblock ~ ~-1 ~ minecraft:barrier

execute at @s run setblock ~ ~2 ~ minecraft:barrier

tag @s add magic_help_interactive_tutorial_wait_open

tellraw @s ["",{"text":"You will get released once you know how to open your Magic","bold":true,"color":"gold"},"\n",{"text":"It is quite easy:","bold":true,"color":"gold"},"\n","\n",{"text":"1 Sneak until you see: ","bold":true,"color":"dark_green"},{"text":"~~~~","color":"gold"},{"text":" in chat","bold":true,"color":"dark_green"}, {"text":" don't look straight up while doing this","color":"dark_red","bold":true},"\n",{"text":"2 Quickly look straight up ","bold":true,"color":"dark_green"},{"text":"while still sneaking","color":"dark_red","bold":true}]