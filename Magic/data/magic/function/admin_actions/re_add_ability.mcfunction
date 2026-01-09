################################################################################
#Purpose: Re-add the ability to a player who lost its ability specified by the scoreboard select_player
#Runner: A magic admin player that sets its re_add_ability to nonzero, ran via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players set @s re_add_ability 0
scoreboard players enable @s[tag=admin] re_add_ability

scoreboard players operation Temp reg_1 = @s select_player
execute as @a if score @s player_id = Temp reg_1 run tag @s add can_see
execute as @a if score @s player_id = Temp reg_1 run tag @s add can_use