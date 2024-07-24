execute as @a[tag=can_use] run function magic:check_tap_block
execute as @a[tag=stilled] run function magic:check_tap_block

tag @a[tag=!using,tag=next_sever] remove can_use
tag @a[tag=!using,tag=next_sever] remove next_sever
tag @a[tag=!can_use] remove holding_run_blocked
tag @a[tag=can_use,tag=!using] remove built
tag @a[tag=!can_use] remove active
tag @a[tag=!can_use] remove using
tag @a[tag=!can_use] remove built
tag @a remove to_be_banned
tag @a remove to_be_kicked
tag @a[tag=using] remove can_break_free

execute as @a[tag=can_use] if score @s use_items matches 0 run function magic:unset_hotbarmode
execute as @a[tag=can_use,tag=!barmode,tag=using] unless score @s use_items matches 0 run function magic:set_hotbarmode

execute as @a[scores={magic_debug_state=1..}] run scoreboard players operation magic_settings magic_debug_state = @s magic_debug_state
execute as @a[scores={magic_debug_state=1..}] run scoreboard players set @s magic_debug_state 0

execute as @a[scores={magic_auto_ability_state=1..}] run scoreboard players operation magic_settings magic_auto_ability_state = @s magic_auto_ability_state
execute as @a[scores={magic_auto_ability_state=1..}] run scoreboard players set @s magic_auto_ability_state 0

execute as @a[scores={magic_balefire_ban=1..}] run scoreboard players operation magic_settings magic_balefire_ban = @s magic_balefire_ban
execute as @a[scores={magic_balefire_ban=1..}] run scoreboard players set @s magic_balefire_ban 0

execute as @a[scores={give_book=1..}] run function magic:give_cheat_book
execute as @a[scores={remove_ability=1..}] run function magic:remove_ability
execute as @a[scores={re_add_ability=1..}] run function magic:re_add_ability
execute as @a[scores={add_ability=1..}] run function magic:add_ability
execute as @a[scores={admin_panel=1..}] run function magic:admin

scoreboard players enable @a[tag=admin] select_player
scoreboard players enable @a[tag=admin] magic_debug_state
scoreboard players enable @a[tag=admin] magic_auto_ability_state
scoreboard players enable @a[tag=admin] magic_balefire_ban
scoreboard players enable @a[tag=admin] set_halve_hold
scoreboard players enable @a[tag=admin] set_regenerated

execute as @a[tag=using,tag=can_use,scores={current_held=1..}] run function magic:actionbar_display

#Reset halve if not in circle/angrealed/progressive shielded
execute as @a[tag=can_use,tag=!circle_owner,tag=!angrealed,scores={progressive_shielded=0}] run scoreboard players operation @s cumulative_halve_amount_hold = @s halve_amount_hold

#Join detect, also work first time when leave detect will be set to undef
execute as @a unless score @s leave_detect matches 0 run function magic:join

#Sneak
execute as @a[scores={sneak_time=1..}, tag=!using, tag=can_use,tag=!tap_blocked] store result score @s reg_1 run data get entity @s Rotation[1]
execute as @a[scores={sneak_time=..10, reg_1=-90}, tag=!using, tag=can_use,tag=!tap_blocked] run scoreboard players set @s sneak_time 0
execute as @a[scores={sneak_time=10}, tag=!using, tag=can_use,tag=!tap_blocked] at @s run playsound minecraft:block.vault.activate player @s
execute as @a[scores={sneak_time=10}, tag=!using, tag=can_use,tag=!tap_blocked] run tellraw @s {"text":"~~~~","color":"gold"}

#Sneak but stilled
execute as @a[scores={sneak_time=1..}, tag=!using, tag=stilled,tag=!tap_blocked] store result score @s reg_1 run data get entity @s Rotation[1]
execute as @a[scores={sneak_time=..10, reg_1=-90}, tag=!using, tag=stilled,tag=!tap_blocked] run scoreboard players set @s sneak_time 0
execute as @a[scores={sneak_time=10}, tag=!using, tag=stilled,tag=!tap_blocked] at @s run playsound minecraft:block.vault.activate player @s
execute as @a[scores={sneak_time=10}, tag=!using, tag=stilled,tag=!tap_blocked] run tellraw @s {"text":"~~~~","color":"gold"}

#Enable breaking out
execute as @a[scores={sneak_time=200.., reg_1=-90}, tag=!using, tag=can_use,tag=!tap_blocked] run function magic:try_break_tied

#Count to break free tied
#Disabled due to conflicts with open and to make P-shield a bit better
#execute as @a[scores={sneak_time=1.., reg_1=-90,regenerated_strength=1.., progressive_shielded=1..}, tag=!using, tag=can_use, tag=!circled,tag=!tap_blocked] run scoreboard players add @s click_counter 1
#execute as @a[scores={sneak_time=1.., reg_1=-90,regenerated_strength=1.., progressive_shielded=1..}, tag=!using, tag=can_use, tag=!circled,tag=!tap_blocked] run scoreboard players set @s sneak_time 0

execute as @a[scores={sneak_time=1.., reg_1=-90,regenerated_strength=1.., shilded=1..}, tag=!using, tag=can_use, tag=!circled,tag=!tap_blocked] run scoreboard players add @s click_counter 1
execute as @a[scores={sneak_time=1.., reg_1=-90,regenerated_strength=1.., shilded=1..}, tag=!using, tag=can_use, tag=!circled,tag=!tap_blocked] run scoreboard players set @s sneak_time 0

#Opening
execute as @a[scores={sneak_time=10..,reg_1=-90}, tag=!using, tag=can_use,tag=!circled,tag=!tap_blocked] run function magic:open

#Sneak reset
execute as @a[scores={sneak_time=1..,bound=0}] unless predicate magic:is_sneaking run scoreboard players set @s sneak_time 0


#Death detect
execute as @a[scores={death_detect=1..}] run function magic:death


execute as @a[tag=can_use,tag=using] unless entity @s[nbt={Inventory:[{id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:6}}}]}] run function magic:exit
execute as @a[tag=can_use,tag=using,tag=circle_owner] unless entity @s[nbt={Inventory:[{id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:9}}}]}] run function magic:exit
execute as @a[tag=using, scores={shilded=1..}] run function magic:exit

#Part of force in offhand: invite to circle
execute as @a[tag=using, tag=can_use ,nbt={SelectedItem:{id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:6}}}}] if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:6}}}]}] run function magic:invite_to_circle

#Force in offhand: toggle between hotbar mode
execute as @a[tag=can_use, tag=using] if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:6}}}]}] run function magic:toggle_hotbarmode
execute as @a[tag=can_use, tag=using] if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:6}}}]}] run item replace entity @s weapon.mainhand from entity @s weapon.offhand
execute as @a[tag=can_use, tag=using] if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:6}}}]}] run item replace entity @s weapon.offhand with minecraft:air


#Circle power in offhand while circled: Pass circle
execute as @a[tag=can_use, tag=using, tag=circle_owner] if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:9}}}]}] run function magic:pass_circle

#Only way to exit is via dropping the power, this allows for free offhand
#execute as @a[tag=can_use, tag=using, tag=circle_owner] unless entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:ender_eye"}]}] run function magic:exit

execute at @e[type=minecraft:eye_of_ender,nbt={Item:{components:{"minecraft:custom_data":{Force:6}}}}] as @a[tag=using,tag=can_use,sort=nearest, limit=1, distance=..2] run function magic:increase_periodic_draw
execute at @e[type=minecraft:eye_of_ender,nbt={Item:{components:{"minecraft:custom_data":{Force:9}}}}] as @a[tag=using,tag=can_use,sort=nearest, limit=1, distance=..2] run function magic:increase_periodic_draw_circle

#Target
#execute as @a[scores={click=1..}, tag=using, tag=can_use,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:7}}}}] at @s run function magic:new_ray

#Weave click
execute as @a[scores={click=1..}, tag=using, tag=can_use,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:8}}}}] at @s run function magic:new_ray_multi_blocked

#Enable triggers
scoreboard players enable @a[tag=can_use] use_items
scoreboard players enable @a[tag=can_use] a
scoreboard players enable @a[tag=can_use] e
scoreboard players enable @a[tag=can_use] f
scoreboard players enable @a[tag=can_use] w
scoreboard players enable @a[tag=can_use] s
scoreboard players enable @a[tag=can_use] state

scoreboard players enable @a[tag=can_use] destination
scoreboard players enable @a[tag=can_use] destination_x
scoreboard players enable @a[tag=can_use] destination_y
scoreboard players enable @a[tag=can_use] destination_z
scoreboard players enable @a[tag=can_use] build
scoreboard players enable @a[tag=can_use] slow_down
scoreboard players enable @a[tag=can_use] tie_strength

execute as @a[tag=can_use,tag=using,scores={use_items=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:1}}}]}] run trigger a set 1
execute as @a[tag=can_use,tag=using,scores={use_items=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:2}}}]}] run trigger e set 2
execute as @a[tag=can_use,tag=using,scores={use_items=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:3}}}]}] run trigger f set 3
execute as @a[tag=can_use,tag=using,scores={use_items=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:4}}}]}] run trigger w set 4
execute as @a[tag=can_use,tag=using,scores={use_items=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:5}}}]}] run trigger s set 5

execute as @a[scores={click=1..}, tag=using, tag=can_use,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:1}}}}] at @s run trigger a set 1
execute as @a[scores={click=1..}, tag=using, tag=can_use,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:2}}}}] at @s run trigger e set 2
execute as @a[scores={click=1..}, tag=using, tag=can_use,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:3}}}}] at @s run trigger f set 3
execute as @a[scores={click=1..}, tag=using, tag=can_use,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:4}}}}] at @s run trigger w set 4
execute as @a[scores={click=1..}, tag=using, tag=can_use,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:5}}}}] at @s run trigger s set 5

#Clear eye if holding when not having tag using
execute as @a[tag=can_use,tag=!using] if entity @s[nbt={Inventory:[{id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:6}}}]}] run clear @s ender_eye[custom_data={Force:6}]
execute as @a[tag=can_use,tag=!using] if entity @s[nbt={Inventory:[{id:"minecraft:ender_eye",components:{"minecraft:custom_data":{Force:9}}}]}] run clear @s ender_eye[custom_data={Force:9}]

#Detect when one starts
execute as @a[tag=using, tag=can_use, scores={a=1..}] run function magic:build
execute as @a[tag=using, tag=can_use, scores={e=1..}] run function magic:build
execute as @a[tag=using, tag=can_use, scores={f=1..}] run function magic:build
execute as @a[tag=using, tag=can_use, scores={w=1..}] run function magic:build
execute as @a[tag=using, tag=can_use, scores={s=1..}] run function magic:build

execute as @a[tag=using, tag=can_use, scores={build=1..}] run function magic:entire_weave

execute as @a[tag=using, tag=can_use, scores={slow_down=1..}] run function magic:tracked_force_slow

#Book slot selected: run weaves
execute as @a[tag=using] store result score @s reg_1 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
execute as @a[tag=using,scores={reg_1=1..}] unless score @s reg_1 = @s held_player_weave_index run function magic:holding_run
#If reg_1=0 we are unselecting, still need to set held_player_weave_index to 0
execute as @a[tag=using,scores={reg_1=0}] unless score @s reg_1 = @s held_player_weave_index run scoreboard players set @s held_player_weave_index 0

#TODO is this needed
tag @a[tag=can_use, tag=using, nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] add active

#Book in offhand with selection: tie off
execute as @a[tag=can_use, tag=using] if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{Force:8}}}]}] run function magic:holding_tie_off

#New if removed from build slot
execute as @a[tag=using,tag=can_use,tag=built] unless data entity @s Inventory[{Slot:8b}].components.minecraft:custom_data.Player_weave_index run function magic:new_weave

#Angreal
#coreboard players set @a reg_1 0
execute as @a[tag=using,tag=can_use] store result score @s reg_1 run data get entity @s Inventory[{Slot:-106b}].components.minecraft:custom_data.Amplification
execute as @a[tag=using,tag=can_use, scores={reg_1=1..},tag=!circled,tag=!circle_owner,tag=!angrealed] run tag @s add angrealed_held
execute as @a[tag=using,tag=can_use, scores={reg_1=1..},tag=!circled,tag=!circle_owner,tag=!angrealed] run function magic:enter_angreal

execute as @a[tag=using,tag=can_use, scores={reg_1=0},tag=!circled,tag=!circle_owner,tag=angrealed,tag=angrealed_held] run function magic:remove_angreal

#Pick up
execute as @a[tag=can_use, scores={state=1}, tag=using, tag=!circled, tag=!circle_owner] run function magic:pick_up

#Circle, do not remove tag=!using
execute as @a[tag=can_use, scores={state=10,shilded=0,progressive_shielded=0}, tag=!using, tag=!circled, tag=!circle_owner,tag=!tap_blocked] run function magic:enter_circle

execute as @a[tag=can_use, scores={state=20}, tag=using] run function magic:shield_active_responde
execute as @a[tag=can_use, scores={state=30}, tag=using] run function magic:sever_active_responde

kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:1}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:2}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:3}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:4}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:5}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:6}}}}]
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:8}}}}] run function magic:remove_cleanup_player_single
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:9}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:10}}}}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Force:20}}}}]

#Prevent put in container
clear @a[tag=!using] minecraft:golden_sword[custom_data={Force:20}]

#Clean old weaves
kill @e[type=minecraft:armor_stand,tag=target_point, scores={weave_despawn_time=0},tag=!actively_held]

#Doomed smite
execute at @a[scores={doomed=100..}] run summon lightning_bolt
execute at @a[scores={doomed=100..}] run summon minecraft:fireball ~ ~-1 ~ {ExplosionPower:10,Motion:[0.0,-5.0,0.0]}
scoreboard players remove @a[scores={doomed=100..}] doomed 100

execute as @a if score @s doomed matches ..100 unless score @s doomed matches 0 run kill @s
execute as @a if score @s doomed matches ..100 unless score @s doomed matches 0 run scoreboard players set @s doomed 0

#Sheild active success (to shield)
execute as @a[tag=using,tag=can_use,scores={shield_active_time=1}] run function magic:exit
execute as @a[tag=can_use,scores={shield_active_time=1}] run scoreboard players set @s shield_active_time 0

#Sever active success (to sever)
execute as @a[tag=using,tag=can_use,scores={sever_active_time=1}] run function magic:sever
execute as @a[scores={sever_active_time=1}] run scoreboard players set @s sever_active_time 0

#Break free
execute as @a[scores={progressive_shielded=1..,click_counter=7..}, tag=can_break_free] run function magic:break_tied
execute as @a[scores={shilded=1..,click_counter=7..}, tag=can_break_free] run function magic:break_tied

#Things like the bridge
execute as @e[tag=ray] run function magic:along_execute

#Check for legacy target hits. Throws should also not consume here
execute as @e[tag=ray,tag=!begin_throw] at @s unless entity @e[distance=..1, type=minecraft:snowball,tag=hit_ray_done] run function magic:landed

#Throw
execute as @e[tag=getting_thrown] at @s unless entity @e[limit=1,sort=nearest,type=minecraft:snowball,tag=ray,distance=..10] run tag @s remove getting_thrown
#execute as @e[tag=getting_thrown] at @s run ride @s mount @e[limit=1,sort=nearest,type=minecraft:snowball,tag=ray]
execute as @e[tag=getting_thrown] at @s at @e[limit=1,sort=nearest,type=minecraft:snowball,tag=ray,distance=..5] run tp @s ~ ~2 ~

#Bind
#Make opening possible while bound
execute as @e[scores={bound=2..}] unless predicate magic:has_vehicle run scoreboard players add @s sneak_time 1
execute as @e[scores={bound=2..}] at @s run ride @s mount @e[limit=1,sort=nearest,type=minecraft:armor_stand,tag=target_point,scores={t_1=1,t_2=1,t_3=1,t_4=1,t_5=0}]

#Unbind
execute as @e[scores={bound=1}] run ride @s dismount
scoreboard players set @e[scores={bound=1}] bound 0

#Handle destroyed
execute as @e[tag=target_point,tag=weave_damaged] run function magic:remove_weave
tag @e[tag=target_point,tag=weave_damaged] remove weave_damaged

#Remove signs
execute in minecraft:overworld positioned 0 0 0 run kill @e[type=minecraft:item,distance=..5]

scoreboard players add Temp tick_counter 1

execute if score Temp tick_counter matches 6 run function magic:fourth_sec
execute if score Temp tick_counter matches 11 run function magic:fourth_sec
execute if score Temp tick_counter matches 16 run function magic:fourth_sec
execute if score Temp tick_counter matches 21 run function magic:fourth_sec

execute if score Temp tick_counter matches 21.. run function magic:one_sec
execute if score Temp tick_counter matches 21.. run scoreboard players set Temp tick_counter 0