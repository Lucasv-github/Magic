function magic_help:clear_chat
execute at @s run playsound minecraft:entity.arrow.hit_player

tag @s remove magic_help_interactive_tutorial_wait_build
tag @s add magic_help_interactive_tutorial_wait_drop

tellraw @s ["",{"text":"Congratulations! You have now made your first spell","bold":true,"color":"gold"},"\n",{"text":"But unless you are very lucky it won't work. You will need a reference of spells to be able to do anything useful","bold":true,"color":"gold"},"\n","\n",{"text":"But first you will need to learn one of the most important mechanics","bold":true,"color":"dark_red"},"\n",{"text":"Whatever spell you just made is sitting in your rightmost slot","bold":true,"color":"gold"},"\n","\n",{"text":"You will need to drop this spell before making a new one. If you don't drop your old spells, nothing will work","bold":true,"color":"dark_red"}]


