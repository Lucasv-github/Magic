#say player remove weave

#Need to remove ALL with same weave_index
scoreboard players operation Temp reg_1 = @s entity_id
$execute as @e[tag=target_point] if score @s weave_owner_entity_id = Temp reg_1 if score @s player_weave_index matches $(index) run function magic:cleanup/remove_cleanup

#TODO we should not force any remove cleanup if 1 no book 2 no tied off or held

#$say $(index)
$clear @s minecraft:carrot_on_a_stick[custom_data~{Player_weave_index:$(index)}]

#To make it work on entities as well
$execute if score @s player_weave_index matches $(index) run tag @s remove built
$execute if score @s player_weave_index matches $(index) run function magic:weave_handling/new_weave


