function magic_help:clear_chat
execute at @s run playsound minecraft:entity.arrow.hit_player

tag @s remove magic_help_interactive_tutorial_wait_increase
tag @s add magic_help_interactive_tutorial_wait_balance

tellraw @s ["",{"text":"Now your mana is going up","bold":true,"color":"gold"},"\n","\n",{"text":"Remember that you can always select the eyes to prevent it from changing","bold":true,"color":"gold"},"\n","\n",{"text":"Also be very careful and make sure your mana doesn't get too high as that will kill you.","bold":true,"color":"dark_red"},"\n",{"text":"Drop some eyes to bring back the mana balance for next step","bold":true,"color":"gold"}]
