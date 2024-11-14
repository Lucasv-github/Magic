execute store result entity @s Pos[0] double 1 run scoreboard players get @e[tag=teleport_target,limit=1] destination_x
execute store result entity @s Pos[1] double 1 run scoreboard players get @e[tag=teleport_target,limit=1] destination_y
execute store result entity @s Pos[2] double 1 run scoreboard players get @e[tag=teleport_target,limit=1] destination_z

tp @e[tag=teleport_target,limit=1] @s
tag @e remove teleport_target
kill @s