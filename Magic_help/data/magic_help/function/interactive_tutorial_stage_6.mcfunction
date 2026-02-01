function magic_help:clear_chat
execute at @s run playsound minecraft:entity.arrow.hit_player

tag @s remove magic_help_interactive_tutorial_wait_bind
tag @s add magic_help_interactive_tutorial_wait_unbind

tellraw @s ["",{"text":"You have now bound the villager","bold":true,"color":"gold"},"\n","\n",{"text":"I hope you remember what I said about dropping your spell","bold":true,"color":"gold"},"\n",{"text":"Either way if you would build an explosion right now it wouldn't work. The explosion ingredients would simply be added on top of the 4 air you already have in your spell","bold":true,"color":"gold"},"\n","\n",{"text":"This is solved by (as I have already told you) dropping the spell","bold":true,"color":"dark_red"}]