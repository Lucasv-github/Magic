execute at @s run fill ~5 ~5 ~5 ~-5 ~-5 ~-5 minecraft:air replace minecraft:barrier
execute at @s run fill ~5 ~5 ~5 ~-5 ~-5 ~-5 minecraft:air replace minecraft:repeating_command_block
execute at @s run function magic:detections/can_unload
execute if score Temp reg_1 matches 1 at @s run forceload remove ~ ~