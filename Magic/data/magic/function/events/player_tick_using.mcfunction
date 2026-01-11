################################################################################
#Purpose: Run all ticked player logic for when using the power
#Runner: All players using the power one at a time every tick, run via events/player_tick.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Force in offhand: toggle between hotbar mode, need to be before exit as offhand slot is not counted
execute as @a[tag=can_use, tag=using] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run function magic:magic_actions/holding_toggle_hotbarmode
execute as @s[scores={use_items=0..}] run function magic:magic_actions/set_mode_appropriate

#Exit without eyes
execute unless items entity @s container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run function magic:power_handling/exit
execute unless items entity @s[tag=circle_owner] container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:9}] run function magic:power_handling/exit
execute as @s[tag=!using] run return 0

#Part of force in offhand: invite to circle
execute if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run function magic:power_handling/invite_to_circle

#TODO branch out + own function
#Need to be above element detect
#Book in offhand with selection: add empty / tie off
execute if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run tag @s add tick_offhand_temp
execute as @s[tag=tick_offhand_temp] run function magic:detections/verify_weave_placed

execute as @s[tag=tick_offhand_temp] if score @s reg_1 matches 0 run function magic:weave_handling/holding_add_line
execute as @s[tag=tick_offhand_temp] if score @s reg_1 matches 1 run function magic:magic_actions/holding_tie_off

tag @s remove tick_offhand_temp

#Circle power in offhand while circled: Pass circle
#Observe that this pass_circle is not the power handling pass_circle
execute if items entity @s[tag=circle_owner] weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:9}] run function magic:power_handling/pass_circle_closest

#Book slot selected: run weaves
execute store result score @s reg_1 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
execute as @s[scores={reg_1=1..}] unless score @s reg_1 = @s held_player_weave_index run function magic:magic_actions/holding_run
#If reg_1=0 we are unselecting, still need to set held_player_weave_index to 0
execute as @s[scores={reg_1=0}] unless score @s reg_1 = @s held_player_weave_index run scoreboard players set @s held_player_weave_index 0

execute store result score @s reg_1 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index
execute unless score @s reg_1 matches 0 unless score @s reg_1 = @s player_weave_index run function magic:weave_handling/build_changed

#Weave click
execute as @s[scores={click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] at @s anchored eyes positioned ^ ^ ^3 run function magic:new_ray_multi_blocked

#Element slot detection
execute as @s[scores={use_items_current=2}] store result score @s reg_1 run data get entity @s SelectedItemSlot
execute as @s[scores={use_items_current=2}] unless score @s reg_1 = @s hotbar_current run function magic:magic_actions/selection_changed

#Element offhand detection
execute if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:1}] run function magic:weave_handling/holding_add_line
execute if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:2}] run function magic:weave_handling/holding_add_line
execute if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:3}] run function magic:weave_handling/holding_add_line
execute if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:4}] run function magic:weave_handling/holding_add_line
execute if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:5}] run function magic:weave_handling/holding_add_line


#Click detection
execute as @s[scores={click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run function magic:power_handling/increase_periodic_draw
execute as @s[scores={click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:9}] run function magic:power_handling/increase_periodic_draw_circle

execute as @s[scores={click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:1}] run trigger a set 1
execute as @s[scores={click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:2}] run trigger e set 2
execute as @s[scores={click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:3}] run trigger f set 3
execute as @s[scores={click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:4}] run trigger w set 4
execute as @s[scores={click=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:5}] run trigger s set 5

#Drop detection
execute unless items entity @s[scores={use_items_current=1..2}] container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:1}] run trigger a set 1
execute unless items entity @s[scores={use_items_current=1..2}] container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:2}] run trigger e set 1
execute unless items entity @s[scores={use_items_current=1..2}] container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:3}] run trigger f set 1
execute unless items entity @s[scores={use_items_current=1..2}] container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:4}] run trigger w set 1
execute unless items entity @s[scores={use_items_current=1..2}] container.* minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:5}] run trigger s set 1

#Detect when one starts
execute as @s[scores={a=1..}] run function magic:weave_handling/add_element_pre
execute as @s[scores={e=1..}] run function magic:weave_handling/add_element_pre
execute as @s[scores={f=1..}] run function magic:weave_handling/add_element_pre
execute as @s[scores={w=1..}] run function magic:weave_handling/add_element_pre
execute as @s[scores={s=1..}] run function magic:weave_handling/add_element_pre
execute as @s[tag=!using] run return 0

execute as @s[tag=need_weave_flush] run function magic:weave_handling/give_current_weave
tag @s remove need_weave_flush
scoreboard players set @s state 0

#Needs to be below flush
execute as @s[tag=built] unless data entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index run function magic:weave_handling/new_weave

#Angreal
execute store result score @s reg_1 run data get entity @s equipment.offhand.components.minecraft:custom_data.Amplification
execute store result score @s reg_2 run data get entity @s equipment.offhand.components.minecraft:custom_data.Angreal_flawed
execute as @s[scores={reg_1=1..}, tag=!circled,tag=!circle_owner,tag=!angrealed] run tag @s add angrealed_held
execute as @s[scores={reg_1=1..}, tag=!circled,tag=!circle_owner,tag=!angrealed] run function magic:power_handling/enter_angreal

execute as @s[scores={reg_1=0}, tag=!circled,tag=!circle_owner,tag=angrealed,tag=angrealed_held] run function magic:power_handling/remove_angreal

#Pick up weave
execute as @s[scores={state=1}, tag=!circled] run function magic:weave_handling/pick_up