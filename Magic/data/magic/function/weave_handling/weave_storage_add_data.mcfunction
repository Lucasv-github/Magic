################################################################################
#Purpose: Add a provided element to weave storage denoted by $(index) and add tags for easier element present detection
#Arguments: @s reg_1: element_value
#Runner: An entity housing the element_value
#Return values:
#Authors: Lprogrammer
################################################################################

#Doesn't matter
$data modify storage magic:weave_$(index) Elements append value 0
$execute store result storage magic:weave_$(index) Elements[-1] int 1.0 run scoreboard players get @s reg_1

#Makes detecting if an element is present in a weave easier
$execute as @s[scores={reg_1=1}] run data merge storage magic:weave_$(index) {Air:1b}
$execute as @s[scores={reg_1=2}] run data merge storage magic:weave_$(index) {Earth:1b}
$execute as @s[scores={reg_1=3}] run data merge storage magic:weave_$(index) {Fire:1b}
$execute as @s[scores={reg_1=4}] run data merge storage magic:weave_$(index) {Water:1b}
$execute as @s[scores={reg_1=5}] run data merge storage magic:weave_$(index) {Spirit:1b}