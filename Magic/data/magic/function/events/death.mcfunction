#Don't drop if keep inventory true
execute store result score Temp reg_1 run gamerule keep_inventory

execute if score Temp reg_1 matches 0 at @s run function magic:inventory/drop_hotbar

execute as @s[tag=circle_owner] run function magic:remove_circle

scoreboard players operation Temp reg_1 = @s circled_owner_id
execute as @s[tag=circled] as @a[tag=circle_owner,tag=using,tag=can_use] if score @s player_id = Temp reg_1 run function magic:power_handling/exit

tag @s remove circled

scoreboard players set @s death_detect 0
scoreboard players set @s doomed 0

#Remove every weave bound to player to try making it a bit more fair
scoreboard players operation Temp reg_1 = @s player_id

execute as @e[tag=target_point,tag=tied_off,scores={weave_remaining_time=1..}] if score @s weave_locked_player_id = Temp reg_1 run tag @s add remove_cleanup_temp
execute as @e[tag=target_point,tag=actively_held] if score @s weave_locked_player_id = Temp reg_1 run tag @s add remove_cleanup_temp
execute as @e[tag=remove_cleanup_temp] run function magic:weave_handling/remove_weave
tag @e remove remove_cleanup_temp
