scoreboard objectives add magic_debug_state trigger
scoreboard objectives add magic_auto_ability_state trigger
scoreboard objectives add magic_balefire_ban trigger

scoreboard objectives add magic_max_strength dummy
scoreboard objectives add magic_min_strength dummy
scoreboard objectives add magic_debug_state trigger
scoreboard objectives add magic_debug_weave_state trigger

scoreboard objectives add normal_distributed dummy
function magic:create_normal_distributed

execute unless score magic_settings magic_debug_state matches -2147483647.. run scoreboard players set magic_settings magic_debug_state 1
execute unless score magic_settings magic_debug_weave_state matches -2147483647.. run scoreboard players set magic_settings magic_debug_weave_state 1
execute unless score magic_settings magic_auto_ability_state matches -2147483647.. run scoreboard players set magic_settings magic_auto_ability_state 2
execute unless score magic_settings magic_balefire_ban matches -2147483647.. run scoreboard players set magic_settings magic_balefire_ban 2

gamerule commandModificationBlockLimit 1000000000

scoreboard objectives add tick_counter dummy
scoreboard objectives add second_counter dummy

scoreboard objectives add shields_blocked dummy

scoreboard objectives add admin_panel trigger
scoreboard objectives add give_book trigger
scoreboard objectives add remove_ability trigger
scoreboard objectives add re_add_ability trigger
scoreboard objectives add add_ability trigger
scoreboard objectives add select_player trigger
scoreboard objectives add set_halve_hold trigger
scoreboard objectives add set_regenerated trigger

scoreboard objectives add projectile_shielded dummy

scoreboard objectives add click_counter dummy

scoreboard objectives add current_held dummy

scoreboard objectives add angreal_level dummy

scoreboard objectives add total_draw_amount dummy
scoreboard objectives add my_draw_amount dummy
scoreboard objectives add halve_amount_hold dummy
scoreboard objectives add cumulative_halve_amount_hold dummy
scoreboard objectives add max_regenerated_strength dummy
scoreboard objectives add regenerated_strength dummy

#Won't be used on player, but instead on weave
scoreboard objectives add current_strength dummy

scoreboard objectives add shield_lower_amount dummy

scoreboard objectives add finder_owner_id dummy
scoreboard objectives add finder_time dummy
scoreboard objectives add finder_index dummy

scoreboard objectives add tar_survival trigger
scoreboard objectives add tar_creative trigger

scoreboard objectives add use_items trigger
scoreboard objectives add doomed dummy
scoreboard objectives add disguise dummy
scoreboard objectives add weave_remaining_time dummy
scoreboard objectives add weave_despawn_time dummy

#For use in calculations but idealy not between different files as that easily creates conflicts
scoreboard objectives add reg_1 dummy
scoreboard objectives add reg_2 dummy
scoreboard objectives add reg_3 dummy
scoreboard objectives add reg_4 dummy
scoreboard objectives add reg_5 dummy

scoreboard objectives add destination_x trigger
scoreboard objectives add destination_y trigger
scoreboard objectives add destination_z trigger

scoreboard objectives add return_x dummy
scoreboard objectives add return_y dummy
scoreboard objectives add return_z dummy

scoreboard objectives add tar_current_chunk_x dummy
scoreboard objectives add tar_current_chunk_y dummy

scoreboard objectives add position_x dummy
scoreboard objectives add position_y dummy
scoreboard objectives add position_z dummy

scoreboard objectives add a trigger
scoreboard objectives add e trigger
scoreboard objectives add f trigger
scoreboard objectives add w trigger
scoreboard objectives add s trigger
scoreboard objectives add line trigger
scoreboard objectives add build trigger
scoreboard objectives add count trigger

scoreboard objectives add player_weave_index dummy
scoreboard objectives add held_player_weave_index dummy

scoreboard objectives add state trigger
scoreboard objectives add weave_length dummy

#Tie off strength
scoreboard objectives add tie_strength trigger

#Track slow down
scoreboard objectives add slow_down trigger

scoreboard objectives add weave_air_count dummy
scoreboard objectives add weave_air_count_1 dummy
scoreboard objectives add weave_air_count_n dummy

scoreboard objectives add weave_earth_count dummy
scoreboard objectives add weave_earth_count_1 dummy
scoreboard objectives add weave_earth_count_n dummy

scoreboard objectives add weave_fire_count dummy
scoreboard objectives add weave_fire_count_1 dummy
scoreboard objectives add weave_fire_count_n dummy

scoreboard objectives add weave_water_count dummy
scoreboard objectives add weave_water_count_1 dummy
scoreboard objectives add weave_water_count_n dummy

scoreboard objectives add weave_spirit_count dummy
scoreboard objectives add weave_spirit_count_1 dummy
scoreboard objectives add weave_spirit_count_n dummy

scoreboard objectives add weave_explosion_count dummy
scoreboard objectives add weave_lightning_count dummy
scoreboard objectives add weave_cut_count dummy
scoreboard objectives add weave_ice_count dummy
scoreboard objectives add weave_extinguish_count dummy
scoreboard objectives add weave_dry_count dummy
scoreboard objectives add weave_heal_count dummy
scoreboard objectives add weave_bridge_count dummy
scoreboard objectives add weave_fire_ray_count dummy
scoreboard objectives add weave_balefire_ray_count dummy
scoreboard objectives add weave_lava_count dummy
scoreboard objectives add weave_light_count dummy

#Click
scoreboard objectives add click minecraft.used:minecraft.carrot_on_a_stick

scoreboard objectives add weave_locked_player_id dummy
scoreboard objectives add weave_locked_entity_id dummy
scoreboard objectives add weave_execute_random_number dummy
scoreboard objectives add circled_owner_id dummy
scoreboard objectives add weave_read_index dummy

#Sneak detect
scoreboard objectives add sneak_time minecraft.custom:minecraft.sneak_time

#Leave/join detect
scoreboard objectives add leave_detect minecraft.custom:minecraft.leave_game

#Death detect
scoreboard objectives add death_detect deathCount

scoreboard players set -1 reg_1 -1
scoreboard players set 0 reg_1 0
scoreboard players set 1 reg_1 1
scoreboard players set 2 reg_1 2
scoreboard players set 3 reg_1 3
scoreboard players set 4 reg_1 4
scoreboard players set 5 reg_1 5
scoreboard players set 6 reg_1 6
scoreboard players set 8 reg_1 8
scoreboard players set 9 reg_1 8
scoreboard players set 10 reg_1 10
scoreboard players set 16 reg_1 16
scoreboard players set 30 reg_1 30
scoreboard players set 20 reg_1 20
scoreboard players set 26 reg_1 26
scoreboard players set 60 reg_1 60
scoreboard players set 100 reg_1 100
scoreboard players set 1000 reg_1 1000
scoreboard players set 10000 reg_1 10000
scoreboard players set 100000 reg_1 100000
scoreboard players set 1000000 reg_1 1000000
scoreboard players set 10000000 reg_1 10000000
scoreboard players set 100000000 reg_1 100000000
scoreboard players set 1000000000 reg_1 1000000000
scoreboard players set 50 reg_1 50

#Keep player hotbar copies loaded
execute in minecraft:overworld run forceload add 0 0

#To allow console log on servers
setblock 0 -1 0 repeating_command_block{auto:1b,conditional:1b,Command:"kill @e[type=minecraft:armor_stand,tag=console_writer,limit=1]"} destroy

#Fire sword
data merge storage magic:match_weave_1 {Elements:[1,1,3,1,1,-1,1,1,3,1,1,-1,1,1,3,1,1,-1,1,3,3,3,1,-1,1,1,3,1,1]}

scoreboard players set Temp reg_1 0
function magic:detect_permission
execute if score Temp reg_1 matches 0 run tellraw @a {"text":"This server doesn't have the adequate function permission level","bold":true,"color":"dark_red"}

scoreboard players set Detect_command_blocks reg_1 0
setblock 0 -2 0 command_block{auto:1b,conditional:1b,Command:"scoreboard players set Detect_command_blocks reg_1 1"} destroy

scoreboard players set magic_settings magic_min_strength 100
scoreboard players set magic_settings magic_max_strength 2000

schedule function magic:debug/command_block_message 2s replace

tellraw @a {"text":"Magic 1.5.1 loaded","bold":true,"color":"gold"}