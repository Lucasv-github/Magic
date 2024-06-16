scoreboard players enable @a magic_help
scoreboard players enable @a magic_help_page
scoreboard players enable @a magic_help_list
scoreboard players enable @a magic_help_interactive_page

#Text tutorial
give @a[scores={magic_help_list=1..}] written_book[written_book_content={pages:["[[\"FAF: Lightning\\n\\nFFF: Small fball\\n\\nEFE: Explosion\\n\\nEFEF: Explosion+\\n\\nEFEFF: Explosion++\\n\\nEFEFFF: Explosion++\"]]","[[\"EFEEFEFFF: Big explosion\\n\\nEFEEFEEFEFFF:Huge explosion\\n\\nFF: Throwable fball\\n\\nF: Small f\\n\\nFFFFFFFF: Large f\\n\\nFFFFF: f ray\"]]","[[\"SFE: Hard cut\\n\\nAAAFA: Bridge\\n\\nAFA: Light\\n\\nSSSS: Shield\\n\\nSSS: Progressive shield\\n\\nSSSSSSSSSSSSSS: Shield while active\"]]","[[\"ASW:Stun\\n\\nSSSSSSSS: Disguise\\n\\nE: Small hole\\n\\nEEEEEE: Large hole\\n\\nW: Small w\\n\\nWWWW: Large w\"]]","[[\"WF: Ice\\n\\nWFWF: Large ice\\n\\nSSSSSSS: Sever\\n\\nSSSSSSSSSSSSSSSSS: Sever while active\\n\\nSS: Invert\\n\\nAAFF: a shield\"]]","[[\"AAFAA Aim blocker\\n\\nAAAFFFAAA: Walkable a shield\\n\\nAA: Levitate\\n\\nAAA: Slow\\n\\nAAAA: Bind in a\\n\\nFWA: Clear w small\"]]","[[\"FFFFWA: Clear w large\\n\\nAAAAA: Throw\\n\\nEEEFWFASSSAFWFEEEE: Basic travel\\n\\nAASW: Heal\\n\\nSSWWFFEEAA: Sense\\n\\nWWFWW: Extinguish\"]]","[[\"AAFFAA: Invisibility\\n\\nAFAAAFA: Blind\\n\\nSSSSS: Basic tracker\\n\\nFA: Remove armor\\n\\nAFAFFF: f sword\\n\\nEFFWFFE: Damage\"]]","[[\"FFSFFS: Pain\\n\\nSA: Progressive shield block\\n\\nFEF: Small lava\\n\\nFFFFEFFFF: Large lava\\n\\nEEEFWASSAWFEEE: Tar travel\\n\\nSSSSSSSSSSSSSSSSSS: Shield strike back\"]]","[[\"SSSSSAAAAA: Shield counter\"]]"],title:"Magic cheat book",author:"GreatBreakerBob",generation:0}]


tellraw @a[scores={magic_help=1..}] ["",{"text":"As this datapack is \"horribly complex\" I have tried making this guide","bold":true,"color":"blue"},"\n",{"text":"Next","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_help_page set 1"}}]

tellraw @a[scores={magic_help_page=1}] {"text":"------------------------------","bold":true,"color":"blue"}
tellraw @a[scores={magic_help_page=1}] ["",{"text":"The first step when using magic is opening it:","bold":true,"color":"blue"},"\n","\n",{"text":"1. Crouch until you see (and hear) the squiggly lines: ","bold":true,"color":"blue"},{"text":"~~~~","color":"gold"},"\n",{"text":"2. Click the squiggly lines: ","bold":true,"color":"blue"},{"text":"~~~~","color":"gold"},"\n","\n",{"text":"Next","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_help_page set 2"}}]

tellraw @a[scores={magic_help_page=2}] {"text":"------------------------------","bold":true,"color":"blue"}
tellraw @a[scores={magic_help_page=2}] ["",{"text":"That wasn't very hard?","bold":true,"color":"blue"},"\n","\n",{"text":"You now have quite a cluttered inventory ","bold":true,"color":"blue"},{"text":"DON'T TOUCH ANYTHING YET","bold":true,"color":"dark_red"},"\n","\n",{"text":"First a quick rundown of what everything is","bold":true,"color":"blue"},"\n","\n",{"text":"Your stamina is visualized by ten bars: ","bold":true,"color":"blue"},{"text":"||||||||||","color":"gold"},"\n",{"text":"It will decrease while you use magic and increase when you don't","bold":true,"color":"blue"},"\n","\n",{"text":"The number before the stamina is your held amount","bold":true,"color":"blue"},"\n",{"text":"This is harder to explain but put shortly it is the tiny amount of power that you are currently holding","bold":true,"color":"blue"},"\n","\n",{"text":"Next","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_help_page set 3"}}]


tellraw @a[scores={magic_help_page=3}] {"text":"------------------------------","bold":true,"color":"blue"}
tellraw @a[scores={magic_help_page=3}] ["",{"text":"The ","bold":true,"color":"blue"},{"text":"held amount ","bold":true,"color":"dark_green"},{"text":"is the most important think","bold":true,"color":"blue"},"\n","\n",{"text":"The more power you are holding the greater your advantage is durig fighting","bold":true,"color":"blue"},"\n","\n",{"text":"If it ever gets to 0 you will have to reopen the power again, a huge disadvantage","bold":true,"color":"blue"},"\n",{"text":"(Opening the power is done by crouching and clicking)","bold":true,"color":"blue"},"\n","\n",{"text":"But you can't hold too much","bold":true,"color":"dark_red"},"\n",{"text":"If you ever start taking damage you are holding too much. Safest bet is to drop all your ender eyes and reopening magic","bold":true,"color":"blue"},"\n","\n",{"text":"Next","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_help_page set 4"}}]

tellraw @a[scores={magic_help_page=4}] {"text":"------------------------------","bold":true,"color":"blue"}
tellraw @a[scores={magic_help_page=4}] ["",{"text":"Now that you know enough to hopefully not kill yourself","bold":true,"color":"blue"},"\n","\n",{"text":"It is time yo increase your ","bold":true,"color":"blue"},{"text":"held amount ","bold":true,"color":"dark_green"},"\n","\n",{"text":"This is done simply by using a few ender eyes","bold":true,"color":"blue"},"\n",{"text":"And then deselecting their slot","bold":true,"color":"dark_red"},"\n",{"text":"But be careful , remember not too much","bold":true,"color":"dark_red"},"\n",{"text":"The maximum is around ~100 but the values are assigned randomly on first join. 20 should be more than enough right now","bold":true,"color":"blue"},"\n","\n",{"text":"You can select the slot for a quick stop and return the number of ender eyes to 32 for a more permanent stop","bold":true,"color":"blue"},"\n","\n",{"text":"You can also decrease the amount by holding fewer than 32 ender eyes","bold":true,"color":"blue"},"\n",{"text":"Next","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_help_page set 5"}}]

tellraw @a[scores={magic_help_page=5}] {"text":"------------------------------","bold":true,"color":"blue"}
tellraw @a[scores={magic_help_page=5}] ["",{"text":"Your ","bold":true,"color":"blue"},{"text":"held amount ","bold":true,"color":"dark_green"},{"text":"is hopefully around 20 right now. If it is greater than that is doesn't matter unless it keeps increasing or you are taking damage","bold":true,"color":"blue"},"\n",{"text":"If you are taking damage drop all eyes and try again","bold":true,"color":"dark_red"},"\n","\n",{"text":"Finally you can build your spell","bold":true,"color":"blue"},"\n","\n",{"text":"A simple lightning bolt can be made using the compination","bold":true,"color":"blue"},{"text":" FAF","bold":true,"color":"dark_red"},"\n","\n",{"text":"You will have to (drop/click) 1 Fire, 1 Air and 1 Fire. In that order","bold":true,"color":"blue"},"\n",{"text":"If all went well you should now have your spell in your rightmost slot","bold":true,"color":"blue"},"\n","\n",{"text":"And now you click with the spell whereever you want to shoot","bold":true,"color":"blue"},"\n",{"text":"Finally you repeat all this. You can give yourself a list by typing /trigger magic_help_list","bold":true,"color":"blue"},"\n","\n",{"text":"This guide is done","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger magic_help_page set 0"}}]

#Interactive tutorial
execute as @a[tag=magic_help_interactive_tutorial,scores={magic_help_interactive_page=1}] if data entity @s Inventory[] run tellraw @s {"text":"Your inventory is not empty :]","bold":true,"color":"dark_red"}
execute as @a[tag=magic_help_interactive_tutorial,scores={magic_help_interactive_page=1}] unless data entity @s Inventory[] run function magic_help:interactive_tutorial_stage_1

execute as @a[tag=magic_help_interactive_tutorial_wait_open,tag=using] run function magic_help:interactive_tutorial_stage_2

execute as @a[tag=magic_help_interactive_tutorial_wait_build,tag=built] run function magic_help:interactive_tutorial_stage_3

execute as @a[tag=magic_help_interactive_tutorial_wait_drop,tag=!built] run function magic_help:interactive_tutorial_stage_4

execute as @a[tag=magic_help_interactive_tutorial_wait_kill] at @s unless entity @e[distance=..100,type=minecraft:zombie,tag=magic_help_interactive_tutorial_enemy] run function magic_help:interactive_tutorial_stage_5

execute as @a[tag=magic_help_interactive_tutorial_wait_bind] at @s if entity @e[type=villager,tag=magic_help_interactive_tutorial_villager,scores={bound=1..},sort=nearest,limit=1] run function magic_help:interactive_tutorial_stage_6

execute as @a[tag=magic_help_interactive_tutorial_wait_unbind,tag=!built] run function magic_help:interactive_tutorial_stage_7

execute as @a[tag=magic_help_interactive_tutorial_wait_decrease,scores={current_held=..499},tag=using] run function magic_help:interactive_tutorial_stage_8

execute as @a[tag=magic_help_interactive_tutorial_wait_increase,scores={current_held=501..},tag=using] run function magic_help:interactive_tutorial_stage_9

execute as @a[tag=magic_help_interactive_tutorial_wait_balance, nbt={SelectedItem:{id:"minecraft:ender_eye",count:32,components:{"minecraft:custom_data":{Force:6}}}}] run function magic_help:interactive_tutorial_stage_10

execute as @a[tag=magic_help_interactive_tutorial_wait_kill_2] at @s unless entity @e[distance=..100,type=minecraft:zombie,tag=magic_help_interactive_tutorial_enemy] run function magic_help:interactive_tutorial_done

scoreboard players set @a[tag=magic_help_interactive_tutorial_keep_held] current_held 500

scoreboard players set @a magic_help 0
scoreboard players set @a magic_help_page 0
scoreboard players set @a magic_help_list 0
scoreboard players set @a magic_help_interactive_page 0