################################################################################
#Purpose: Decode a /trigger build set inputed weave and add its elements one by one
#Runner: An entity that inputed a weave with /trigger build set, via tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################


scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 1000000000 reg_1
scoreboard players operation @s reg_1 /= 100000000 reg_1
function magic:weave_handling/entire_weave_decide

scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 100000000 reg_1
scoreboard players operation @s reg_1 /= 10000000 reg_1
function magic:weave_handling/entire_weave_decide

scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 10000000 reg_1
scoreboard players operation @s reg_1 /= 1000000 reg_1
function magic:weave_handling/entire_weave_decide

scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 1000000 reg_1
scoreboard players operation @s reg_1 /= 100000 reg_1
function magic:weave_handling/entire_weave_decide

scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 100000 reg_1
scoreboard players operation @s reg_1 /= 10000 reg_1
function magic:weave_handling/entire_weave_decide

scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 10000 reg_1
scoreboard players operation @s reg_1 /= 1000 reg_1
function magic:weave_handling/entire_weave_decide

scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 1000 reg_1
scoreboard players operation @s reg_1 /= 100 reg_1
function magic:weave_handling/entire_weave_decide

scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 100 reg_1
scoreboard players operation @s reg_1 /= 10 reg_1
function magic:weave_handling/entire_weave_decide

scoreboard players operation @s reg_1 = @s build
scoreboard players operation @s reg_1 %= 10 reg_1
function magic:weave_handling/entire_weave_decide

execute as @s[tag=using] if score @s count matches 1.. run scoreboard players remove @s count 1
execute as @s[tag=using] if score @s count matches 1.. run function magic:weave_handling/entire_weave

scoreboard players set @s build 0