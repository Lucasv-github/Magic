execute store result entity @s Pos[0] double 1 run scoreboard players get @p[tag=teleport_target] destination_x
execute store result entity @s Pos[1] double 1 run scoreboard players get @p[tag=teleport_target] destination_y
execute store result entity @s Pos[2] double 1 run scoreboard players get @p[tag=teleport_target] destination_z
tp @p[tag=teleport_target] @s
tag @p[tag=teleport_target] remove teleport_target
kill @s