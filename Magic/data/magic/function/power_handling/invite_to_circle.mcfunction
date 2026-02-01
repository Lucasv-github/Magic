################################################################################
#Purpose: Send a message that players around @s can use to join @s's circle, then correct offhand
#Runner: An owner of a circle
#Return values:
#Authors: Lprogrammer
################################################################################

execute at @s[tag=circle_owner] run tellraw @a[distance=..10] {"text":" () ","bold":true,"color":"gold","click_event":{"action":"run_command","command":"/trigger state set 10"}}
function magic:inventory/swap_hands