#$execute if score Temp reg_4 matches 1.. run say $(i)

scoreboard players set @s reg_4 0
$execute store result score @s reg_1 run data get entity @s Inventory[$(i)].tag.Force

scoreboard players operation Temp reg_2 = @s player_id
$execute store result score Temp reg_3 run data get entity @s Inventory[$(i)].tag.Player_weave_index

execute as @e[type=minecraft:armor_stand,tag=target_point, tag=actively_held] if score @s player_id = Temp reg_2 if score @s player_weave_index = Temp reg_3 run tag @s add current_to_be_run

tag @s add periodic_held_current_player

$execute as @e[tag=current_to_be_run] store result score @s t_1 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_1
$execute as @e[tag=current_to_be_run] store result score @s t_2 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_2
$execute as @e[tag=current_to_be_run] store result score @s t_3 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_3
$execute as @e[tag=current_to_be_run] store result score @s t_4 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_4
$execute as @e[tag=current_to_be_run] store result score @s t_5 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_5
$execute as @e[tag=current_to_be_run] store result score @s t_6 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_6
$execute as @e[tag=current_to_be_run] store result score @s t_7 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_7
$execute as @e[tag=current_to_be_run] store result score @s t_8 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_8
$execute as @e[tag=current_to_be_run] store result score @s t_9 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_9
$execute as @e[tag=current_to_be_run] store result score @s t_10 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_10
$execute as @e[tag=current_to_be_run] store result score @s t_11 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_11
$execute as @e[tag=current_to_be_run] store result score @s t_12 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_12
$execute as @e[tag=current_to_be_run] store result score @s t_13 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_13
$execute as @e[tag=current_to_be_run] store result score @s t_14 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_14
$execute as @e[tag=current_to_be_run] store result score @s t_15 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_15
$execute as @e[tag=current_to_be_run] store result score @s t_16 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_16
$execute as @e[tag=current_to_be_run] store result score @s t_17 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_17
$execute as @e[tag=current_to_be_run] store result score @s t_18 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_18
$execute as @e[tag=current_to_be_run] store result score @s t_19 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_19
$execute as @e[tag=current_to_be_run] store result score @s t_20 run data get entity @a[tag=periodic_held_current_player,limit=1] Inventory[$(i)].tag.T_20

tag @a remove periodic_held_current_player

execute if score @s reg_1 matches 8 run tag @e[tag=current_to_be_run,tag=!ward_connected] add held_executed_once
execute if score @s reg_1 matches 8 run execute as @e[tag=current_to_be_run,tag=!ward_connected] run function magic:holding_run_second
tag @e remove current_to_be_run


execute if score Temp reg_4 matches 1.. run scoreboard players remove Temp reg_4 1
execute if score Temp reg_4 matches 1.. store result storage periodic_held_index i int 1.0 run scoreboard players get Temp reg_4
execute if score Temp reg_4 matches 1.. run function magic:periodic_held_one with storage minecraft:periodic_held_index