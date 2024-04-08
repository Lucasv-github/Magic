#TODO might as well deprecate this function?
#Held power being used
#clear @s minecraft:ender_eye 1
scoreboard players remove @s current_held 1

#Lost hold of it
execute as @s[scores={current_held=..0}] run function magic:exit