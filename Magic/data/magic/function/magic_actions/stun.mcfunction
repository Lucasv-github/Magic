################################################################################
#Purpose: Apply a magic stun to a player: damage + nausea + loss of draw adjustors, with the strength of $(stun_amount)
#Runner: A player to be stunned
#Return values:
#Authors: Lprogrammer
################################################################################

damage @s 1 minecraft:magic
effect give @s nausea 5
$execute unless items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] $(stun_amount)