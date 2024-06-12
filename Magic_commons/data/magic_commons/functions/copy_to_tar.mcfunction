#say copying

#This apparently sleeps while loading
scoreboard players set Temp reg_3 0
execute positioned as @s in minecraft:overworld if loaded ~ ~ ~ run scoreboard players set Temp reg_3 1
execute if score Temp reg_3 matches 0 positioned as @s in minecraft:overworld run forceload add ~ ~

execute positioned as @s in magic_commons:tar run clone from minecraft:overworld ~15 -64 ~15 ~ 319 ~ to magic_commons:tar ~ -64 ~
execute if score Temp reg_3 matches 0 positioned as @s in minecraft:overworld run forceload remove ~ ~
execute positioned as @s in magic_commons:tar run forceload remove ~ ~

kill @s

