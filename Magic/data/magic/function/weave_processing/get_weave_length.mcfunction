################################################################################
#Purpose: Retrieve the length of a weave in storage denoted by $(index)
#Runner: Doesn't matter
#Return values: Temp reg_1: weave_length
#Authors: Lprogrammer
################################################################################

$execute store result score Temp reg_1 run data get storage magic:weave_$(index) Elements