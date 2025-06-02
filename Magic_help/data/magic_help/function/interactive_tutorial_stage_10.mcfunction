function magic_help:clear_chat
execute at @s run playsound minecraft:entity.arrow.hit_player

tag @s remove magic_help_interactive_tutorial_wait_balance
tag @s add magic_help_interactive_tutorial_wait_kill_2

execute at @s run tp @s ~ ~5 ~
execute at @s run fill ~ ~-1 ~ ~ ~-10 ~ minecraft:dirt replace
execute at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:dirt replace

execute at @s run summon zombie ~ ~ ~10 {Tags:["magic_help_interactive_tutorial_enemy"],active_effects:[{id:glowing,duration:1000000,show_particles:0b}],equipment:{head:{id:diamond_helmet},chest:{id:diamond_chestplate},legs:{id:diamond_leggings},feet:{id:diamond_boots}},drop_chances:{head:0f,chest:0f,legs:0f,feet:0f}}

execute at @s run summon zombie ~10 ~ ~ {Tags:["magic_help_interactive_tutorial_enemy"],active_effects:[{id:glowing,duration:1000000,show_particles:0b}],equipment:{head:{id:diamond_helmet},chest:{id:diamond_chestplate},legs:{id:diamond_leggings},feet:{id:diamond_boots}},drop_chances:{head:0f,chest:0f,legs:0f,feet:0f}}

execute at @s run summon zombie ~-10 ~ ~ {Tags:["magic_help_interactive_tutorial_enemy"],active_effects:[{id:glowing,duration:1000000,show_particles:0b}],equipment:{head:{id:diamond_helmet},chest:{id:diamond_chestplate},legs:{id:diamond_leggings},feet:{id:diamond_boots}},drop_chances:{head:0f,chest:0f,legs:0f,feet:0f}}

execute at @s run summon zombie ~ ~ ~-10 {Tags:["magic_help_interactive_tutorial_enemy"],active_effects:[{id:glowing,duration:1000000,show_particles:0b}],equipment:{head:{id:diamond_helmet},chest:{id:diamond_chestplate},legs:{id:diamond_leggings},feet:{id:diamond_boots}},drop_chances:{head:0f,chest:0f,legs:0f,feet:0f}}

tellraw @s {"text":"Well the tutorial is pretty much done now. You can kill the zombies to return","bold":true,"color":"gold"}