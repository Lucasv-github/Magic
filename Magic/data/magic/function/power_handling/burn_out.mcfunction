################################################################################
#Purpose: Burn a player, circle owner or circle member based on amount of constributed draw power
#Runner: Any entity drawing more than x4 their halve_amount_hold
#Return values:
#Authors: Lprogrammer
################################################################################

say burned out

#Non circle handling
tag @s[tag=!circle_owner] add next_sever
execute as @s[tag=!circle_owner] run return 0

#Circle handling

say circled handling

#Owner also has circled_owner_id of itself
scoreboard players operation Temp reg_1 = @s player_id
#We don't exclude owner here with tag
execute as @a if score @s circled_owner_id = Temp reg_1 run tag @s add burn_out_member

scoreboard players operation Temp reg_1 = @s total_draw_amount

tellraw @a {score:{name:"@s",objective:"reg_1"},color:"dark_green"}

scoreboard players operation @a[tag=burn_out_member] reg_1 = Temp reg_1
scoreboard players operation @a[tag=burn_out_member] reg_1 *= 100 reg_1
execute as @a[tag=burn_out_member] run scoreboard players operation @s reg_1 /= @s my_draw_amount

execute as @a[tag=burn_out_member] run say BOM

execute as @a[tag=burn_out_member] run tellraw @a {score:{name:"@s",objective:"reg_1"},color:"dark_blue"}

execute as @a[tag=burn_out_member,scores={reg_1=50..}] run tag @s add next_sever

tag @a remove burn_out_member
