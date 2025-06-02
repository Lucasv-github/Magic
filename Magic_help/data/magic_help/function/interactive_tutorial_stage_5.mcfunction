function magic_help:clear_chat
execute at @s run playsound minecraft:entity.arrow.hit_player

tag @s remove magic_help_interactive_tutorial_wait_kill
tag @s add magic_help_interactive_tutorial_wait_bind

execute at @s run summon villager ~ ~5 ~5 {VillagerData:{type:plains,profession:farmer,level:2},Invulnerable:1b,Tags:["magic_help_interactive_tutorial_villager"]}

tellraw @s ["",{"text":"Now that the zombies are dead you can try a spell that will need to be dropped afterwards","bold":true,"color":"gold"},"\n","\n",{"text":"You see the villager nearby? Don't try to kill it","bold":true,"color":"gold"},"\n",{"text":"Instead build a spell using: ","bold":true,"color":"gold"},{text:"\n\uE000\uE000\uE000\uE000\uE000\n\uE000",font:"magic_resourcepack:elements"},"\n",{"text":"The newline in the spell is achived by putting either your spell or a spell part in your offhand","bold":true,"color":"gold"},"\n","\n",{"text":"Finally use it on the villager","bold":true,"color":"gold"}]