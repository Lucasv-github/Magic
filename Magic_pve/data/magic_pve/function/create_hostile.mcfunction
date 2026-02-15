function magic:magic_support/add_ability

execute store result score @s magic_pve_my_tick run random value 0..20

#To open with some power
scoreboard players set @s sneak_time 0
