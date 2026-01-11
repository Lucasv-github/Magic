execute as @e[tag=awaiting_fill] run function magic:actions/check_awaiting_fill

#Start of settings

#Force in offhand: toggle between hotbar mode
execute as @a[tag=can_use, tag=using] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run function magic:magic_actions/holding_toggle_hotbarmode

execute as @a[tag=can_use,tag=using,scores={use_items=0}] unless score @s use_items_current matches 0 run function magic:magic_actions/set_mode_empty
execute as @a[tag=can_use,tag=using,scores={use_items=1}] unless score @s use_items_current matches 1 run function magic:magic_actions/set_mode_items
execute as @a[tag=can_use,tag=using,scores={use_items=2}] unless score @s use_items_current matches 2 run function magic:magic_actions/set_mode_auto

execute as @a[scores={magic_debug_state=1..}] run scoreboard players operation magic_settings magic_debug_state = @s magic_debug_state
execute as @a[scores={magic_debug_state=1..}] run scoreboard players set @s magic_debug_state 0

execute as @a[scores={magic_debug_weave_state=1..}] run scoreboard players operation magic_settings magic_debug_weave_state = @s magic_debug_weave_state
execute as @a[scores={magic_debug_weave_state=1..}] run scoreboard players set @s magic_debug_weave_state 0

execute as @a[scores={magic_auto_ability_state=1..}] run scoreboard players operation magic_settings magic_auto_ability_state = @s magic_auto_ability_state
execute as @a[scores={magic_auto_ability_state=1..}] run scoreboard players set @s magic_auto_ability_state 0

execute as @a[scores={magic_balefire_ban=1..}] run scoreboard players operation magic_settings magic_balefire_ban = @s magic_balefire_ban
execute as @a[scores={magic_balefire_ban=1..}] run scoreboard players set @s magic_balefire_ban 0

execute as @a[scores={give_book=1..}] run function magic:admin_actions/give_cheat_book
execute as @a[scores={remove_ability=1..}] run function magic:admin_actions/remove_ability
execute as @a[scores={re_add_ability=1..}] run function magic:admin_actions/re_add_ability
execute as @a[scores={add_ability=1..}] run function magic:admin_actions/add_ability
execute as @a[scores={admin_panel=1..}] run function magic:admin_actions/admin

scoreboard players enable @a[tag=admin] select_player
scoreboard players enable @a[tag=admin] magic_debug_state
scoreboard players enable @a[tag=admin] magic_debug_weave_state
scoreboard players enable @a[tag=admin] magic_auto_ability_state
scoreboard players enable @a[tag=admin] magic_balefire_ban
scoreboard players enable @a[tag=admin] set_halve_hold
scoreboard players enable @a[tag=admin] set_regenerated

#End of settings

execute as @a[tag=can_use] run function magic:power_handling/check_tap_block_pre
execute as @a[tag=stilled] run function magic:power_handling/check_tap_block_pre

#Join detect, also work first time when leave detect will be set to undef
execute as @a unless score @s leave_detect matches 0 run function magic:events/join

#Sneak
execute as @a[scores={sneak_time=1..,tap_block_percentage=0}, tag=!using, tag=can_use,tag=!tap_blocked] store result score @s reg_1 run data get entity @s Rotation[1]
execute as @a[scores={sneak_time=..10, reg_1=-90,tap_block_percentage=0}, tag=!using, tag=can_use,tag=!tap_blocked] run scoreboard players set @s sneak_time 0
execute as @a[scores={sneak_time=10,tap_block_percentage=0}, tag=!using, tag=can_use,tag=!tap_blocked] at @s run playsound minecraft:block.vault.activate player @s
execute as @a[scores={sneak_time=10,tap_block_percentage=0}, tag=!using, tag=can_use,tag=!tap_blocked] run tellraw @s {"text":"~~~~","color":"gold"}
execute as @a[scores={sneak_time=10,tap_block_percentage=0}, tag=!using, tag=can_use,tag=!tap_blocked] run scoreboard players add @s sneak_time 1

#Sneak but stilled
execute as @a[scores={sneak_time=1..,tap_block_percentage=0}, tag=!using, tag=stilled,tag=!tap_blocked] store result score @s reg_1 run data get entity @s Rotation[1]
execute as @a[scores={sneak_time=..10, reg_1=-90,tap_block_percentage=0}, tag=!using, tag=stilled,tag=!tap_blocked] run scoreboard players set @s sneak_time 0
execute as @a[scores={sneak_time=10,tap_block_percentage=0}, tag=!using, tag=stilled,tag=!tap_blocked] at @s run playsound minecraft:block.vault.activate player @s
execute as @a[scores={sneak_time=10,tap_block_percentage=0}, tag=!using, tag=stilled,tag=!tap_blocked] run tellraw @s {"text":"~~~~","color":"gold"}
execute as @a[scores={sneak_time=10,tap_block_percentage=0}, tag=!using, tag=stilled,tag=!tap_blocked] run scoreboard players add @s sneak_time 1

#Opening
execute as @a[scores={sneak_time=10..,reg_1=-90,tap_block_percentage=0}, tag=!using, tag=can_use,tag=!circled,tag=!tap_blocked] run function magic:power_handling/open

#Throw
execute as @e[tag=weave_thrower] run function magic:weave_actions/throw_lock

#Bind
execute as @e[tag=weave_bind] run function magic:weave_actions/bind_lock

#Sneak reset expect when riding (need to be below Throw, Bind...)
execute as @a[scores={sneak_time=1..}] unless predicate magic:is_sneaking unless data entity @s RootVehicle run scoreboard players set @s sneak_time 0

#Death detect
execute as @a[scores={death_detect=1..}] run function magic:events/death

#Exit without eyes
execute as @a[tag=can_use,tag=using] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:6}}}]}] run function magic:power_handling/exit
execute as @a[tag=can_use,tag=using,tag=circle_owner] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:9}}}]}] run function magic:power_handling/exit

#Part of force in offhand: invite to circle
execute as @a[tag=using, tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run function magic:power_handling/invite_to_circle

#Need to be above element detect
#Book in offhand with selection: add empty / tie off
execute as @a[tag=can_use, tag=using] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] run tag @s add tick_offhand_temp
execute as @a[tag=tick_offhand_temp] run function magic:detections/verify_weave_placed

execute as @a[tag=tick_offhand_temp] if score @s reg_1 matches 0 run function magic:weave_handling/holding_add_line
execute as @a[tag=tick_offhand_temp] if score @s reg_1 matches 1 run function magic:magic_actions/holding_tie_off

tag @a remove tick_offhand_temp

#Circle power in offhand while circled: Pass circle
#Observe that this pass_circle is not the power handling pass_circle
execute as @a[tag=can_use, tag=using, tag=circle_owner] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:9}] run function magic:magic_actions/pass_circle

#Only way to exit is via dropping the power, this allows for free offhand
#execute as @a[tag=can_use, tag=using, tag=circle_owner] unless items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run function magic:power_handling/exit

#Book slot selected: run weaves
execute as @a[tag=using] store result score @s reg_1 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
execute as @a[tag=using,scores={reg_1=1..}] unless score @s reg_1 = @s held_player_weave_index run function magic:magic_actions/holding_run
#If reg_1=0 we are unselecting, still need to set held_player_weave_index to 0
execute as @a[tag=using,scores={reg_1=0}] unless score @s reg_1 = @s held_player_weave_index run scoreboard players set @s held_player_weave_index 0

execute as @a[tag=using,tag=can_use] store result score @s reg_1 run data get entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index
execute as @a[tag=using,tag=can_use] unless score @s reg_1 matches 0 unless score @s reg_1 = @s player_weave_index run function magic:weave_handling/build_changed

#Weave click
execute as @a[scores={click=1..}, tag=using, tag=can_use,] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:8}] at @s anchored eyes positioned ^ ^ ^3 run function magic:new_ray_multi_blocked

#Enable triggers
scoreboard players enable @a[tag=can_use] use_items
scoreboard players enable @a[tag=can_use] a
scoreboard players enable @a[tag=can_use] e
scoreboard players enable @a[tag=can_use] f
scoreboard players enable @a[tag=can_use] w
scoreboard players enable @a[tag=can_use] s
scoreboard players enable @a[tag=can_use] line
scoreboard players enable @a[tag=can_use] state

scoreboard players enable @a[tag=can_use] build
scoreboard players enable @a[tag=can_use] count 
scoreboard players enable @a[tag=can_use] slow_down
scoreboard players enable @a[tag=can_use] tie_strength

#Element slot detection
execute as @a[tag=can_use,tag=using,scores={use_items=2}] store result score @s reg_1 run data get entity @s SelectedItemSlot
execute as @a[tag=can_use,tag=using,scores={use_items=2}] unless score @s reg_1 = @s hotbar_current run function magic:magic_actions/selection_changed

#Element offhand detection
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:1}] run function magic:weave_handling/holding_add_line
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:2}] run function magic:weave_handling/holding_add_line
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:3}] run function magic:weave_handling/holding_add_line
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:4}] run function magic:weave_handling/holding_add_line
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:5}] run function magic:weave_handling/holding_add_line

#Clear eye if holding when not having tag using
execute as @a[tag=can_use,tag=!using] if entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:6}}}]}] run clear @s carrot_on_a_stick[custom_data={Magic:6}]
execute as @a[tag=can_use,tag=!using] if entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:9}}}]}] run clear @s carrot_on_a_stick[custom_data={Magic:9}]

#Click detection
execute as @a[scores={click=1..}, tag=using, tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:6}] run function magic:power_handling/increase_periodic_draw
execute as @a[scores={click=1..}, tag=using, tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:9}] run function magic:power_handling/increase_periodic_draw_circle

execute as @a[scores={click=1..}, tag=using, tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:1}] run trigger a set 1
execute as @a[scores={click=1..}, tag=using, tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:2}] run trigger e set 2
execute as @a[scores={click=1..}, tag=using, tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:3}] run trigger f set 3
execute as @a[scores={click=1..}, tag=using, tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:4}] run trigger w set 4
execute as @a[scores={click=1..}, tag=using, tag=can_use] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{Magic:5}] run trigger s set 5

#Drop detection
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:1}}}]}] run trigger a set 1
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:2}}}]}] run trigger e set 1
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:3}}}]}] run trigger f set 1
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:4}}}]}] run trigger w set 1
execute as @a[tag=can_use,tag=using,scores={use_items=1..2}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Magic:5}}}]}] run trigger s set 1

#Detect when one starts
execute as @a[tag=using, tag=can_use, scores={a=1..}] run function magic:weave_handling/add_element_pre
execute as @a[tag=using, tag=can_use, scores={e=1..}] run function magic:weave_handling/add_element_pre
execute as @a[tag=using, tag=can_use, scores={f=1..}] run function magic:weave_handling/add_element_pre
execute as @a[tag=using, tag=can_use, scores={w=1..}] run function magic:weave_handling/add_element_pre
execute as @a[tag=using, tag=can_use, scores={s=1..}] run function magic:weave_handling/add_element_pre

execute as @a[tag=need_weave_flush,tag=using] run function magic:weave_handling/give_current_weave
tag @a remove need_weave_flush

#Needs to be below flush
execute as @a[tag=using,tag=can_use,tag=built] unless data entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index run function magic:weave_handling/new_weave

execute as @a[tag=using, tag=can_use, scores={line=1..}] run function magic:weave_handling/add_line

execute as @e[tag=using, tag=can_use, scores={build=1..}] run function magic:weave_handling/entire_weave

execute as @a[tag=using, tag=can_use, scores={slow_down=1..}] run function magic:tracked_force_slow


#Angreal
#coreboard players set @a reg_1 0
execute as @a[tag=using,tag=can_use] store result score @s reg_1 run data get entity @s equipment.offhand.components.minecraft:custom_data.Amplification
execute as @a[tag=using,tag=can_use] store result score @s reg_2 run data get entity @s equipment.offhand.components.minecraft:custom_data.Angreal_flawed
execute as @a[tag=using,tag=can_use, scores={reg_1=1..},tag=!circled,tag=!circle_owner,tag=!angrealed] run tag @s add angrealed_held
execute as @a[tag=using,tag=can_use, scores={reg_1=1..},tag=!circled,tag=!circle_owner,tag=!angrealed] run function magic:power_handling/enter_angreal

execute as @a[tag=using,tag=can_use, scores={reg_1=0},tag=!circled,tag=!circle_owner,tag=angrealed,tag=angrealed_held] run function magic:power_handling/remove_angreal

#Pick up
execute as @a[tag=can_use, scores={state=1}, tag=using, tag=!circled, tag=!circle_owner] run function magic:weave_handling/pick_up

#Circle, do not remove tag=!using
#Observe that this enter_circle is not the power handling enter_circle
execute as @a[tag=can_use, scores={state=10}, tag=!using, tag=!circled, tag=!circle_owner,tag=!tap_blocked] run function magic:magic_actions/enter_circle

#Remove old
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Magic:8}}}}] run function magic:cleanup/remove_cleanup_player_single
execute as @e[type=item] if data entity @s Item.components.minecraft:custom_data.Magic run kill @s

#Prevent put in container
clear @a[tag=!using] minecraft:golden_sword[custom_data={Magic:30}]
clear @a[tag=!using] minecraft:golden_axe[custom_data={Magic:31}]
clear @a[tag=!using] minecraft:golden_pickaxe[custom_data={Magic:32}]

#Clean old weaves
kill @e[type=minecraft:armor_stand,tag=target_point, scores={weave_despawn_time=0},tag=!actively_held]

#Doomed smite
execute at @a[scores={doomed=100..}] run summon lightning_bolt
execute at @a[scores={doomed=100..}] run summon minecraft:fireball ~ ~-1 ~ {ExplosionPower:10,Motion:[0.0,-5.0,0.0]}
scoreboard players remove @a[scores={doomed=100..}] doomed 100

execute as @a if score @s doomed matches ..100 unless score @s doomed matches 0 run kill @s
execute as @a if score @s doomed matches ..100 unless score @s doomed matches 0 run scoreboard players set @s doomed 0

#Handle destroyed
execute as @e[type=armor_stand,tag=target_point,tag=weave_lapsed,tag=weave_damaged] run function magic:weave_handling/remove_weave
tag @e[type=armor_stand,tag=target_point,tag=weave_lapsed] remove weave_damaged

execute as @e[type=armor_stand,tag=target_point,tag=weave_throw_damaged] run function magic:cleanup/throw_remove

execute as @a[tag=can_use,tag=using,scores={current_held=..0}] run function magic:power_handling/exit

scoreboard players set @a[tag=can_use] line 0
scoreboard players set @a[tag=can_use] state 0

scoreboard players add Temp tick_counter 1
scoreboard players add Temp total_ticks 1

#Needs to be after join
execute as @a run scoreboard players operation @s total_ticks = Temp total_ticks

scoreboard players operation Temp reg_1 = Temp tick_counter
scoreboard players operation Temp reg_1 %= 5 reg_1
execute if score Temp reg_1 matches 0 run function magic:events/fourth_sec

execute if score Temp tick_counter matches 21.. run function magic:events/second
execute if score Temp tick_counter matches 21.. run scoreboard players set Temp tick_counter 0