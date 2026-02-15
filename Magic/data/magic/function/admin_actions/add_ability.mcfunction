################################################################################
#Purpose: Add the ability to a player specified by the scoreboard select_player
#Runner: A magic admin player that sets its add_ability to nonzero, ran via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players set @s add_ability 0
scoreboard players enable @s[tag=admin] add_ability

scoreboard players operation Temp reg_1 = @s select_player
execute as @a if score @s player_id = Temp reg_1 run function magic:magic_support/add_ability