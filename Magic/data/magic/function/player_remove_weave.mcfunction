#say player remove weave

#Need to remove ALL with same weave_index
scoreboard players operation Temp reg_1 = @s player_id
$execute as @e[tag=target_point] if score @s player_id = Temp reg_1 if score @s player_weave_index matches $(index) run function magic:remove_cleanup

#TODO we should not force any remove cleanup if 1 no book 2 no tied off or held

#$say $(index)
$clear @s minecraft:carrot_on_a_stick[custom_data~{Player_weave_index:$(index)}]