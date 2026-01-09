################################################################################
#Purpose: Retrive value at index: $(index) from the (tiredness) strength table
#Runner: Doesn't matter run via magic_support/auto_add_ability
#Return values: Value at index in @s reg_1
#Authors: Lprogrammer
################################################################################

#$say $(index)
$execute store result score Temp reg_1 run data get storage magic:strength_table Data[$(index)]