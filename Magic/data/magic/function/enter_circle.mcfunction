#Work with angreal

#Angreal here for joiner
scoreboard players set @s reg_1 0
execute as @s[tag=can_use] store result score @s reg_1 run data get entity @s SelectedItem.components.minecraft:custom_data.Amplification
execute as @s[tag=can_use, scores={reg_1=1..},tag=!circled,tag=!circle_owner,tag=!angrealed] run function magic:enter_angreal

#Need to be below angreal
function magic:store_hotbar

execute at @s run scoreboard players operation @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=using, tag=circle_owner] cumulative_halve_amount_hold += @s cumulative_halve_amount_hold

#Execute at prevents this from working if no one nerby is a circle owner anymore

#Person can't do anything if not owner of circle

#This can't be used here as it will drop what we have just stored. And they you think: oh just move it above "magic:store_hotbar". DO NOT DO THAT. Exit will drop your hotbar and you will pick it up, thus duplicating your stuff. This function should only ever be run when someone is comming from NOT using the power, thus exit should not be needed
#execute at @s if entity @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=circle_owner] run function magic:exit

execute at @s if entity @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=circle_owner] run tag @s add circled

#Get id of owner
execute at @s run scoreboard players operation @s circled_owner_id = @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=using, tag=circle_owner] player_id

scoreboard players set @s state 0
scoreboard players set @s my_draw_amount 0