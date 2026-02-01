################################################################################
#Purpose: Take appropriate action when a player has an illegal weave action
#Runner: A player who has managed to get too many or too few weaves (by placing/taking from container)
#Return values:
#Authors: Lprogrammer
################################################################################

#say illegal weave

#tellraw @p {score:{name:"@s",objective:"reg_1"},color:"dark_blue"}
#tellraw @p {score:{name:"@s",objective:"weave_count"},color:"dark_red"}

#For now just bypassing this one
execute if score @s reg_1 < @s weave_count run function magic:weave_handling/handle_gone_weave 
execute if score @s reg_1 > @s weave_count run function magic:inventory/remove_illegal_weave

#Fallback to prevent running over and over if no fix is found
execute store result score @s reg_1 run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] 0
execute unless score @s reg_1 = @s weave_count run say I HAVE AN ILLEGAL WEAVE BUT THE SYSTEM COULDN'T FIX IT
execute unless score @s reg_1 = @s weave_count run scoreboard players operation @s weave_count = @s reg_1
