################################################################################
#Purpose: Add element depending tags based on which elements are present in the weave storage denoted by $(index)
#Runner: An entity to get the tags
#Return values:
#Authors: Lprogrammer
################################################################################

$execute if data storage magic:weave_$(index) {Air:1b} run tag @s add weave_air
$execute if data storage magic:weave_$(index) {Earth:1b} run tag @s add weave_earth
$execute if data storage magic:weave_$(index) {Fire:1b} run tag @s add weave_fire
$execute if data storage magic:weave_$(index) {Water:1b} run tag @s add weave_water
$execute if data storage magic:weave_$(index) {Spirit:1b} run tag @s add weave_spirit