################################################################################
#Purpose: Retrive value at index: $(index) from the distribution table
#Runner: The entity whose scoreboard the value should be put in, run via magic_support/auto_add_ability
#Return values: Value at index in @s reg_1
#Authors: Lprogrammer
################################################################################

#$say $(index)
$scoreboard players operation @s reg_1 = normals_$(index) normal_distributed