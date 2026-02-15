################################################################################
#Purpose: Hurt entities shielding @s based on their strength discrepancies
#Runner: The entity who is shielded and trying to use magic, via power_handling/tap_power
#Return values:
#Authors: Lprogrammer
################################################################################

#say held overpower

execute store result storage magic:stun stun_amount int 1 run scoreboard players get 1 reg_1
function magic:magic_actions/stun with storage magic:stun

data remove storage magic:stun stun_amount

#Get sum of all tied off draw_amount in Temp reg_2 and sum of all active held rest draw in Temp reg_3

scoreboard players operation Temp reg_1 = @s entity_id

scoreboard players set Temp reg_2 0
scoreboard players set Temp reg_3 0
execute at @s as @e[tag=weave_shield,tag=target_point,tag=tied_off, scores={weave_remaining_time=1..},sort=nearest] if score @s weave_locked_entity_id = Temp reg_1 run scoreboard players operation Temp reg_2 += @s current_draw
execute at @s as @e[tag=weave_shield,tag=target_point,tag=actively_held,sort=nearest] if score @s weave_locked_entity_id = Temp reg_1 run scoreboard players operation Temp reg_3 += @s current_sink

#tellraw @a ["",{text:"Tied draw amount sum: ",color:"blue"},{score:{name:"Temp",objective:"reg_2"},color:"blue"}]
#tellraw @a ["",{text:"Held rest draw sum: ",color:"green"},{score:{name:"Temp",objective:"reg_3"},color:"green"}]

#Hurt for each shielder: halve_amount_hold*100/total_shield_sum/adjust

scoreboard players operation Temp reg_2 += Temp reg_3

#As this is currently it discourages multiple shields by one player on another which is good
#It should still be beneficial if multiple players have placed shields

scoreboard players operation Temp reg_1 = @s halve_amount_hold
scoreboard players operation Temp reg_1 *= 100 reg_1
scoreboard players operation Temp reg_1 /= Temp reg_2

#Adjust
scoreboard players operation Temp reg_1 /= 3 reg_1

#tellraw @a ["",{text:"Total hurt: ",color:"light_purple"},{score:{name:"Temp",objective:"reg_1"},color:"light_purple"}]

scoreboard players operation Temp reg_2 = @s entity_id
execute at @s as @e[tag=weave_shield,tag=target_point,tag=actively_held,sort=nearest] if score @s weave_locked_entity_id = Temp reg_2 run scoreboard players operation @s shield_punish_draw += Temp reg_1
execute at @s as @e[tag=weave_shield,tag=target_point,tag=actively_held,sort=nearest] if score @s weave_locked_entity_id = Temp reg_2 run scoreboard players operation @s current_drain += Temp reg_1









