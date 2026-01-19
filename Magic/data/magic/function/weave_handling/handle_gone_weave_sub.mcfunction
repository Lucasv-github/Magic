################################################################################
#Purpose: Run itself and check if weave at index $(i) in player weave copy specified by $(player_id) exists in player, if not remove the weave data
#Runner: A player who has lost a weave without dropping it, run via events/illegal_weave.mcfunction -> handle_gone_weave.mcfunction or by itself
#Return values:
#Authors: Lprogrammer
################################################################################

scoreboard players add Temp reg_1 1
execute store result storage magic:handle_gone_weave_sub i int 1 run scoreboard players get Temp reg_1

scoreboard players set Temp reg_2 0
$execute store result score Temp reg_2 run data get storage magic:player_$(player_id)_weaves Indexes[$(i)]

execute unless score Temp reg_2 matches 0 store result storage magic:has_weave player_weave_index int 1 run scoreboard players get Temp reg_2
function magic:weave_handling/has_weave with storage magic:has_weave

scoreboard players operation Temp reg_3 = @s reg_1

#execute unless score Temp reg_2 matches 0 if score Temp reg_3 matches 0 run tellraw @p {score:{name:"Temp",objective:"reg_2"},color:"dark_red"}
execute unless score Temp reg_2 matches 0 if score Temp reg_3 matches 0 store result storage magic:remove_weave_data index int 1 run scoreboard players get Temp reg_2


execute unless score Temp reg_2 matches 0 if score Temp reg_3 matches 0 run function magic:cleanup/remove_weave_data with storage magic:remove_weave_data
#execute unless score Temp reg_2 matches 0 if score Temp reg_3 matches 0 if score @s reg_1 matches 1 run say RRR
execute unless score Temp reg_2 matches 0 if score Temp reg_3 matches 0 if score @s reg_1 matches 1 run scoreboard players remove @s weave_count 1

execute unless score Temp reg_2 matches 0 run function magic:weave_handling/handle_gone_weave_sub with storage magic:handle_gone_weave_sub