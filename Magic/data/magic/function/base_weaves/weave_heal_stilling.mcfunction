function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_spirit_count matches 1 run tag @s add weave_heal_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_fire_count = @s reg_1 run tag @s remove weave_heal_temp_works

function magic:weave_processing/advance_read_index

scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single

execute as @s unless score @s weave_fire_count = @s reg_1 run tag @s remove weave_heal_temp_works

function magic:weave_processing/advance_read_index

scoreboard players operation Temp reg_1 = @s weave_locked_entity_id

execute as @s[tag=weave_heal_temp_works] as @e if score @s entity_id = Temp reg_1 run tag @s add heal_me

#Prevent self
execute if score @a[tag=heal_me,limit=1] player_id = @s weave_owner_player_id run tag @e remove heal_me

#Need to be near player
scoreboard players operation Temp reg_1 = @s weave_owner_player_id
execute at @a[tag=can_use,tag=using] if score @s player_id = Temp reg_1 unless entity @e[tag=heal_me,distance=..5] run tag @e remove heal_me

#Need to be near weave
execute at @s unless entity @e[tag=heal_me,distance=..5] run tag @e remove heal_me

#Remove if not strong enough
scoreboard players operation Temp reg_1 = @e[tag=heal_me] halve_amount_hold
scoreboard players operation Temp reg_1 /= 10 reg_1
$execute unless score Temp reg_1 matches $(size).. run tag @e remove heal_me

tag @e[tag=heal_me] remove stilled
tag @e[tag=heal_me] add can_use

tag @e remove heal_me
tag @s remove weave_heal_temp_works