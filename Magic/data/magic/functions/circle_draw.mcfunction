give @s minecraft:lead{CustomModelData:0,display:{Name:'[{"text":"Circle","italic":false,"color":"dark_purple"}]',Lore:['[{"text":"Force","italic":false}]']},Enchantments:[{}],Force:10} 1
scoreboard players operation Temp reg_1 = @s player_id

#If circled prevent more than x2
scoreboard players operation @s reg_2 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_2 += @s cumulative_halve_amount_hold

#Limit max amount
scoreboard players set Give_force reg_1 0
execute as @s unless score @s current_held > @s reg_2 as @a[tag=can_use, tag=can_see, tag=circled, scores={regenerated_strenght =1..}] if score @s circled_owner_id = Temp reg_1 at @s run scoreboard players add Give_force reg_1 1
execute as @s unless score @s current_held > @s reg_2 as @a[tag=can_use, tag=can_see, tag=circled, scores={regenerated_strenght =1..}] if score @s circled_owner_id = Temp reg_1 run scoreboard players remove @s regenerated_strenght 1
execute as @s unless score @s current_held > @s reg_2 run function magic:give_force_amount




