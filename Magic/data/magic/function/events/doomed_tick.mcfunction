################################################################################
#Purpose: Run all doomed ticked logic
#Runner: A player having drawn too much power
#Return values:
#Authors: Lprogrammer
################################################################################

execute at @s run summon lightning_bolt
execute at @s run summon minecraft:fireball ~ ~-1 ~ {ExplosionPower:10,Motion:[0.0,-5.0,0.0]}

execute if score @s doomed matches ..100 run say LIGHT FORGIVE ME!
execute if score @s doomed matches ..100 run kill @s
execute if score @s doomed matches ..100 run scoreboard players set @s doomed 0

scoreboard players remove @s doomed 100