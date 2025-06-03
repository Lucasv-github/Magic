scoreboard players operation Temp reg_1 = @s player_id

execute store result score Temp reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
execute as @e[tag=target_point,tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add new_ray_multi_blocked_temp

#Non player bypass
execute if score Temp reg_2 matches 0 run scoreboard players operation Temp reg_2 = @s player_weave_index

execute store result storage magic:tag_different_elements index int 1 run scoreboard players get Temp reg_2

function magic:weave_handling/tag_different_elements with storage magic:tag_different_elements

execute as @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Air:1b}}}}] run tag @s add weave_air
execute as @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Earth:1b}}}}] run tag @s add weave_earth
execute as @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Fire:1b}}}}] run tag @s add weave_fire
execute as @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Water:1b}}}}] run tag @s add weave_water
execute as @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{Spirit:1b}}}}] run tag @s add weave_spirit

scoreboard players operation Ray_data reg_1 = @s player_id
scoreboard players operation Ray_data reg_4 = @s current_held
scoreboard players operation Ray_data reg_4 /= 10 reg_1
scoreboard players set Ray_data reg_2 1
scoreboard players set Ray_data reg_3 0

#Can't do this iteratively as that would burn lots of computational power
function magic:magic_support/calculate_distance

#Remove truly_see from all but self if inverted
scoreboard players operation Temp reg_1 = @s weave_owner_player_id
execute as @s[tag=inverted] as @a[tag=truly_see] unless score @s player_id = Temp reg_1 run tag @s remove truly_see

execute unless entity @e[tag=new_ray_multi_blocked_temp] run function magic:ray_iteration
execute unless entity @e[tag=new_ray_multi_blocked_temp] run playsound minecraft:entity.item.pickup player @s

tag @s remove weave_air
tag @s remove weave_earth
tag @s remove weave_fire
tag @s remove weave_water
tag @s remove weave_spirit

tag @e remove new_ray_multi_blocked_temp
scoreboard players set @s click 0