function magic_help:clear_chat
execute at @s run playsound minecraft:entity.arrow.hit_player

tag @s remove magic_help_interactive_tutorial_wait_decrease
tag @s add magic_help_interactive_tutorial_wait_increase

item replace entity @s hotbar.5 from entity @s inventory.0
item replace entity @s inventory.0 with minecraft:air

tellraw @s ["",{"text":"That is right, your mana decreased","bold":true,"color":"gold"},"\n","\n",{"text":"If your mana gets to zero you will have to reopen Magic","bold":true,"color":"gold"},"\n","\n",{"text":"To increase your mana, you have to use the ender eye, bringing the stack to above 32","bold":true,"color":"gold"},{"text":" then you deselect that slot","bold":true,"color":"dark_red"}]
