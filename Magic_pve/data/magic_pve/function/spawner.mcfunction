execute store result score @s reg_1 run random value 0..20
#execute as @s[scores={reg_1=20}] at @s run function magic_pve:mob_spawns/spawn_zombie_netherite
execute as @s[scores={reg_1=0..4}] at @s run function magic_pve:mob_spawns/spawn_zombie_leather
tag @s add magic_pve_processed_entity