tag @e[distance=..10,type=item_frame,sort=nearest,limit=1] add sink_power_angreal

execute if data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_base unless data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_top run scoreboard players operation Temp reg_1 = @s player_id
execute if data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_base unless data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_top run scoreboard players set Temp reg_2 0
execute if data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_base unless data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_top as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players operation Temp reg_2 = @s current_held
execute if data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_base unless data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_top as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 run scoreboard players set @s current_held 2
execute if data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_base unless data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_top run scoreboard players remove Temp reg_2 2


execute if data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_base unless data entity @e[tag=sink_power_angreal,limit=1] Item.tag.Angreal_top store result score Temp reg_1 run data get entity @e[tag=sink_power_angreal,limit=1] Item.tag.Power_sinked
scoreboard players operation Temp reg_1 += Temp reg_2
tellraw @a[tag=can_see,distance=..10] {"score":{"name":"Temp","objective":"reg_1"},"color":"gold"}
execute store result entity @e[tag=sink_power_angreal,limit=1] Item.tag.Power_sinked int 1 run scoreboard players get Temp reg_1

tag @e[tag=sink_power_angreal] remove sink_power_angreal