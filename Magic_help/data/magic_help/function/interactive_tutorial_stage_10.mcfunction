tellraw @s ["","\n","\n","\n"]

tag @s remove magic_help_interactive_tutorial_wait_balance
tag @s add magic_help_interactive_tutorial_wait_kill_2

execute at @s run tp @s ~ ~5 ~
execute at @s run fill ~ ~-1 ~ ~ ~-10 ~ minecraft:dirt replace
execute at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:dirt replace

execute at @s run summon zombie ~ ~ ~10 {Tags:["magic_help_interactive_tutorial_enemy"],HandItems:[{id:diamond_sword,count:1},{id:shield,count:1}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:diamond_leggings,count:1},{id:diamond_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],active_effects:[{id:glowing,duration:1000000,amplifier:1,show_particles:0b}]}

execute at @s run summon zombie ~10 ~ ~ {Tags:["magic_help_interactive_tutorial_enemy"],HandItems:[{id:diamond_sword,count:1},{id:shield,count:1}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:diamond_leggings,count:1},{id:diamond_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],active_effects:[{id:glowing,duration:1000000,amplifier:1,show_particles:0b}]}

execute at @s run summon zombie ~-10 ~ ~ {Tags:["magic_help_interactive_tutorial_enemy"],HandItems:[{id:diamond_sword,count:1},{id:shield,count:1}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:diamond_leggings,count:1},{id:diamond_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],active_effects:[{id:glowing,duration:1000000,amplifier:1,show_particles:0b}]}

execute at @s run summon zombie ~ ~ ~-10 {Tags:["magic_help_interactive_tutorial_enemy"],HandItems:[{id:diamond_sword,count:1},{id:shield,count:1}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:diamond_leggings,count:1},{id:diamond_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],active_effects:[{id:glowing,duration:1000000,amplifier:1,show_particles:0b}]}

tellraw @s {"text":"Well the tutorial is pretty much done now. You can kill the zombies to return","bold":true,"color":"gold"}