execute at @s[tag=circle_owner] run tellraw @a[distance=..10] {"text":" () ","bold":true,"color":"gold","click_event":{"action":"run_command","command":"/trigger state set 10"}}

execute store result score @s reg_1 run data get entity @s equipment.offhand.count
execute store result storage magic:give_power_regulator_count amount int 1 run scoreboard players get @s reg_1
item replace entity @s weapon.offhand with minecraft:air
function magic:give_power_regulator_count with storage magic:give_power_regulator_count