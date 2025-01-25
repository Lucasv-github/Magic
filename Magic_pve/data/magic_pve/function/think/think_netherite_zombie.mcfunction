#Start of boilerplate

tag @s add magic_pve_think_current_temp

tag @s add magic_pve_action_left


scoreboard players operation @s reg_1 = @s cumulative_halve_amount_hold
scoreboard players operation @s reg_1 /= 20 reg_1

execute as @s[tag=using] if score @s current_held < @s cumulative_halve_amount_hold run scoreboard players operation @s current_held += @s reg_1
execute as @s[tag=using] if score @s current_held > @s cumulative_halve_amount_hold run scoreboard players operation @s current_held = @s cumulative_halve_amount_hold

scoreboard players set @s reg_1 0
execute on target as @e[tag=magic_pve_think_current_temp] run scoreboard players set @s reg_1 1

execute as @s[scores={reg_1=1},tag=!using,tag=magic_pve_action_left] run tag @s add magic_pve_open
execute as @s[scores={reg_1=0},tag=using] run tag @s add magic_pve_exit

execute as @s[tag=magic_pve_open] run function magic:power_handling/open
tag @s[tag=magic_pve_open] remove magic_pve_action_left
tag @s remove magic_pve_open

execute as @s[tag=magic_pve_exit] run function magic:power_handling/exit
tag @s[tag=magic_pve_exit] remove magic_pve_action_left
tag @s remove magic_pve_exit

#End of boilerplate

#Launch on self
execute at @s[tag=magic_pve_self,tag=magic_pve_action_left] run function magic_pve:land_self

#Launch on enemy
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=magic_pve_opponent,tag=magic_pve_action_left] run function magic_pve:land_enemy

#Invurnability
tag @s[tag=using,tag=magic_pve_action_left,tag=!built] add magic_pve_need_resistance
execute as @s[nbt={active_effects:[{id:"minecraft:resistance",amplifier:4b}]}] run tag @s remove magic_pve_need_resistance
execute as @s[tag=magic_pve_need_resistance,tag=!magic_pve_build_resistance] run scoreboard players set @s magic_pve_spell_stage 0
tag @s[tag=magic_pve_need_resistance] add magic_pve_build_resistance

tag @s remove magic_pve_need_resistance

execute as @s[scores={magic_pve_spell_stage=0},tag=magic_pve_build_resistance,tag=magic_pve_action_left] run scoreboard players set @s build 22226
execute as @s[scores={magic_pve_spell_stage=0},tag=magic_pve_build_resistance,tag=magic_pve_action_left] run tag @s remove magic_pve_action_left

execute as @s[scores={magic_pve_spell_stage=1},tag=magic_pve_build_resistance,tag=magic_pve_action_left] run scoreboard players set @s build 33336
execute as @s[scores={magic_pve_spell_stage=1},tag=magic_pve_build_resistance,tag=magic_pve_action_left] run tag @s remove magic_pve_action_left

execute as @s[scores={magic_pve_spell_stage=2},tag=magic_pve_build_resistance,tag=magic_pve_action_left] run scoreboard players set @s build 1111
execute as @s[scores={magic_pve_spell_stage=2},tag=magic_pve_build_resistance,tag=magic_pve_action_left] run tag @s add magic_pve_self
execute as @s[scores={magic_pve_spell_stage=2},tag=magic_pve_build_resistance,tag=magic_pve_action_left] run tag @s remove magic_pve_action_left

execute as @s[scores={magic_pve_spell_stage=3},tag=magic_pve_build_resistance] run tag @s remove magic_pve_build_resistance

#TODO might be possible to branch out this
#TODO 4 needed right now as self launch takes one step
#execute as @s[scores={magic_pve_spell_stage=4},tag=magic_pve_build_resistance,tag=magic_pve_action_left] run function magic_pve:resistance_done


#Cut self bind
execute as @s on vehicle on passengers run tag @s add magic_pve_need_cut_self
execute as @s[tag=magic_pve_need_cut_self,tag=magic_pve_action_left] run scoreboard players set @s build 532
execute as @s[tag=magic_pve_need_cut_self,tag=magic_pve_action_left] run tag @s add magic_pve_self
execute as @s[tag=magic_pve_need_cut_self,tag=magic_pve_action_left] run tag @s remove magic_pve_action_left

tag @s remove magic_pve_need_cut_self

#Shield
scoreboard players set Temp reg_1 0
execute on target run scoreboard players operation Temp reg_1 = @s entity_id
scoreboard players operation Temp reg_2 = @s entity_id

tag @s add magic_pve_need_shield
execute as @e[tag=target_point,tag=weave_shield,tag=actively_held] if score @s weave_owner_entity_id = Temp reg_2 if score @s weave_locked_entity_id = Temp reg_1 run tag @e remove magic_pve_need_shield
execute as @s[tag=magic_pve_need_shield,tag=!built,tag=magic_pve_action_left] run scoreboard players set @s build 5556565
execute as @s[tag=magic_pve_need_shield,tag=!built,tag=magic_pve_action_left] run tag @s add magic_pve_opponent
execute as @s[tag=magic_pve_need_shield,tag=!built,tag=magic_pve_action_left] run tag @s remove magic_pve_action_left

tag @s remove magic_pve_need_shield


#Bind
scoreboard players set Temp reg_1 1
#execute on target at @s if entity @e[tag=magic_pve_think_current_temp,distance=5..] run scoreboard players set Temp reg_1 0
execute on target on vehicle run scoreboard players set Temp reg_1 0
execute on target as @s[tag=!using] run scoreboard players set Temp reg_1 0
execute as @s[tag=!built,tag=magic_pve_action_left] if score Temp reg_1 matches 1 run scoreboard players set @s build 1111161
execute as @s[tag=!built,tag=magic_pve_action_left] if score Temp reg_1 matches 1 run tag @s add magic_pve_opponent
execute as @s[tag=!built,tag=magic_pve_action_left] if score Temp reg_1 matches 1 run tag @s remove magic_pve_action_left


#Lightning
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=5..] run scoreboard players set @s build 3131
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=5..] run tag @s add magic_pve_opponent
execute on target at @s as @e[tag=magic_pve_think_current_temp,tag=!built,tag=magic_pve_action_left,distance=5..] run tag @s remove magic_pve_action_left

#Remove bind
scoreboard players operation Temp reg_2 = @s entity_id
execute on target as @s[tag=!using] as @e[tag=weave_bind,tag=actively_held] if score @s weave_owner_entity_id = Temp reg_2 run function magic:weave_handling/remove_weave

#Stun
scoreboard players set Temp reg_1 1
execute on target as @s[tag=!using] run scoreboard players set Temp reg_1 0
scoreboard players operation Temp reg_2 = @s entity_id
execute as @e[tag=weave_stun,tag=actively_held] if score @s weave_owner_entity_id = Temp reg_2 run scoreboard players set Temp reg_1 0
execute if score Temp reg_1 matches 1 run tag @s add magic_pve_need_stun
execute as @s[tag=magic_pve_need_stun,tag=magic_pve_action_left] run scoreboard players set @s build 556535353
execute as @s[tag=magic_pve_need_stun,tag=magic_pve_action_left] run tag @s add magic_pve_opponent
execute as @s[tag=magic_pve_need_stun,tag=magic_pve_action_left] run tag @s remove magic_pve_action_left

tag @s remove magic_pve_need_stun

#Slap
scoreboard players set Temp reg_1 0
execute on target as @s[tag=!using] run scoreboard players set Temp reg_1 1

scoreboard players operation Temp reg_2 = @s entity_id
execute as @e[tag=target_point,tag=weave_slap,tag=actively_held] if score @s weave_owner_entity_id = Temp reg_2 run scoreboard players set Temp reg_1 0

execute as @s[tag=!built,tag=magic_pve_action_left] if score Temp reg_1 matches 1 run scoreboard players set @s build 116111111
execute as @s[tag=!built,tag=magic_pve_action_left] if score Temp reg_1 matches 1 run tag @s add magic_pve_opponent
execute as @s[tag=!built,tag=magic_pve_action_left] if score Temp reg_1 matches 1 run tag @s remove magic_pve_action_left


scoreboard players add @s magic_pve_spell_stage 1

tag @s remove magic_pve_action_left
tag @s remove magic_pve_think_current_temp