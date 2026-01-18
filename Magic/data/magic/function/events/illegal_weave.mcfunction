################################################################################
#Purpose: Take appropriate action when a player has managed to get an illegal weave
#Runner: A player who has managed to get too many or too few weaves (by placing/taking from container)
#Return values:
#Authors: Lprogrammer
################################################################################

#tellraw @p {score:{name:"@s",objective:"reg_1"},color:"dark_blue"}
#tellraw @p {score:{name:"@s",objective:"weave_count"},color:"dark_red"}

#For now just bypassing this one
execute if score @s reg_1 < @s weave_count run scoreboard players remove @s weave_count 1
execute if score @s reg_1 > @s weave_count run function magic:inventory/remove_illegal_weave
