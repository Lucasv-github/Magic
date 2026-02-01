function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single

execute as @s if score @s weave_spirit_count = @s reg_1 run tag @s add weave_travel_temp_works


function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 4
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_spirit_count = @s reg_1 run tag @s remove weave_travel_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_spirit_count = @s reg_1 run tag @s remove weave_travel_temp_works

function magic:weave_processing/advance_read_index

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id

execute as @s[tag=weave_travel_temp_works] as @e if score @s entity_id = Temp reg_1 run tag @s add heal_me

#Prevent self
execute if score @a[tag=heal_me,limit=1] player_id = @s weave_owner_player_id run tag @e remove heal_me

#Only if not max health
execute at @s store result score Temp reg_1 run attribute @e[tag=heal_me,distance=..5,limit=1] minecraft:max_health get
execute at @s store result score Temp reg_2 run data get entity @e[tag=heal_me,distance=..5,limit=1] Health
execute if score Temp reg_1 = Temp reg_2 run tag @e remove heal_me


#Need to be near player
scoreboard players operation Temp reg_1 = @s weave_owner_player_id
execute at @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 unless entity @e[tag=heal_me,distance=..5] run tag @e remove heal_me

#Need to be near weave
execute at @s unless entity @e[tag=heal_me,distance=..5] run tag @e remove heal_me

$effect give @e[tag=heal_me] minecraft:regeneration $(size) 2
$effect give @e[tag=heal_me,tag=!using] minecraft:hunger 1 $(size)
execute as @e[tag=heal_me,limit=1] at @s run damage @s 0.01 minecraft:freeze

scoreboard players operation Remove_force reg_1 = @a[tag=heal_me,tag=using,tag=can_use,limit=1] halve_amount_hold
scoreboard players operation Remove_force reg_1 /= 10 reg_1
$scoreboard players add Remove_force reg_1 $(size)

execute as @a[tag=heal_me,tag=using,tag=can_use] run function magic:power_handling/remove_force_amount

tag @e remove heal_me
tag @s remove weave_travel_temp_works