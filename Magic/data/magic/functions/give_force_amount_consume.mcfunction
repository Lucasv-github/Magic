#TODO this should probably not be deprecated
#Will self run and give Give_force reg_1 force to player

#If we are stonrg enough
execute if score @s regenerated_strength >= Give_force reg_1 run scoreboard players operation @s current_held += Give_force reg_1
execute if score @s regenerated_strength >= Give_force reg_1 run scoreboard players operation @s regenerated_strength -= Give_force reg_1
scoreboard players set Temp reg_1 0

#Else draw everything left
scoreboard players operation Temp reg_1 = Give_force reg_1
scoreboard players operation Temp reg_1 -= @s regenerated_strength

execute if score @s regenerated_strength < Give_force reg_1 run scoreboard players operation @s current_held += Temp reg_1
execute if score @s regenerated_strength < Give_force reg_1 run scoreboard players set @s regenerated_strength 0

#If we have enough strenght