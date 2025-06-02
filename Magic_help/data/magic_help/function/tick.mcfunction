scoreboard players enable @a magic_help_interactive_page

execute as @a[tag=magic_help_interactive_tutorial] unless score @s use_items matches 1 run tellraw @s ["",{text:"You just changed your build mode. This is done by putting ",bold:true,color:"red"},{text:"Force",bold:true,color:"dark_purple"},{text:" in your offhand. Fortunately, this tutorial has already made things easier for you by putting you back in ",bold:true,color:"red"},{text:"Default",bold:true,color:"dark_green"},{text:" build mode",bold:true,color:"red"}]
execute as @a[tag=magic_help_interactive_tutorial] unless score @s use_items matches 1 run scoreboard players set @s use_items 1

execute as @a[tag=magic_help_interactive_tutorial,scores={magic_help_interactive_page=1}] if data entity @s Inventory[] at @s run playsound minecraft:block.anvil.land
execute as @a[tag=magic_help_interactive_tutorial,scores={magic_help_interactive_page=1}] if data entity @s Inventory[] run tellraw @s {"text":"Your inventory is not empty :]","bold":true,"color":"dark_red"}
execute as @a[tag=magic_help_interactive_tutorial,scores={magic_help_interactive_page=1}] unless data entity @s Inventory[] run function magic_help:interactive_tutorial_stage_1

execute as @a[tag=magic_help_interactive_tutorial_wait_open,tag=using] run function magic_help:interactive_tutorial_stage_2

execute as @a[tag=magic_help_interactive_tutorial_wait_build,tag=built] run function magic_help:interactive_tutorial_stage_3

execute as @a[tag=magic_help_interactive_tutorial_wait_drop,tag=!built] run function magic_help:interactive_tutorial_stage_4

execute as @a[tag=magic_help_interactive_tutorial_wait_kill] at @s unless entity @e[distance=..100,type=minecraft:zombie,tag=magic_help_interactive_tutorial_enemy] run function magic_help:interactive_tutorial_stage_5

execute as @a[tag=magic_help_interactive_tutorial_wait_bind] at @s as @e[type=villager,tag=magic_help_interactive_tutorial_villager,sort=nearest,limit=1] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{"type":"minecraft:armor_stand"}}} as @a[limit=1,sort=nearest] run function magic_help:interactive_tutorial_stage_6

execute as @a[tag=magic_help_interactive_tutorial_wait_unbind,tag=!built] run function magic_help:interactive_tutorial_stage_7

execute as @a[tag=magic_help_interactive_tutorial_wait_decrease,scores={current_held=..499},tag=using] run function magic_help:interactive_tutorial_stage_8

execute as @a[tag=magic_help_interactive_tutorial_wait_increase,scores={current_held=501..},tag=using] run function magic_help:interactive_tutorial_stage_9

execute as @a[tag=magic_help_interactive_tutorial_wait_balance, nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",count:32,components:{"minecraft:custom_data":{Magic:6}}}}] run function magic_help:interactive_tutorial_stage_10

execute as @a[tag=magic_help_interactive_tutorial_wait_kill_2] at @s unless entity @e[distance=..100,type=minecraft:zombie,tag=magic_help_interactive_tutorial_enemy] run function magic_help:interactive_tutorial_done

scoreboard players set @a[tag=magic_help_interactive_tutorial_keep_held] current_held 500

#Soflock preventor
execute as @e[type=witch,tag=magic_help_interactive_tutorial_villager] run function magic_help:smithed_villager

#Too much preventor
execute as @a[tag=magic_help_interactive_tutorial] if score @s current_held >= @s halve_amount_hold run function magic_help:too_much

scoreboard players set @a magic_help_interactive_page 0