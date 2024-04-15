scoreboard objectives add magic_debug_state trigger
execute unless score magic_settings magic_debug_state matches -2147483647.. run scoreboard players set magic_settings magic_debug_state 1

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

scoreboard objectives add halve_amount_hold dummy
scoreboard objectives add cumulative_halve_amount_hold dummy
scoreboard objectives add max_regenerated_strenght dummy
scoreboard objectives add regenerated_strenght dummy

#Won't be used on player, but instead on weave
scoreboard objectives add current_strenght dummy

scoreboard objectives add progressive_shielded dummy
scoreboard objectives add progressive_shield_current dummy
scoreboard objectives add shield_active_amount dummy
scoreboard objectives add shield_active_time dummy
scoreboard objectives add sever_active_amount dummy
scoreboard objectives add sever_active_time dummy

scoreboard objectives add finder_owner_id dummy
scoreboard objectives add finder_time dummy
scoreboard objectives add finder_index dummy

scoreboard objectives add tar_survival trigger
scoreboard objectives add tar_creative trigger

scoreboard objectives add use_items trigger
scoreboard objectives add doomed dummy
scoreboard objectives add invert dummy
scoreboard objectives add disguise dummy
scoreboard objectives add bridge dummy
scoreboard objectives add bound dummy
scoreboard objectives add shilded dummy
scoreboard objectives add weave_remaining_time dummy
scoreboard objectives add weave_despawn_time dummy

scoreboard objectives add reg_1 dummy
scoreboard objectives add reg_2 dummy
scoreboard objectives add reg_3 dummy
scoreboard objectives add reg_4 dummy

scoreboard objectives add destination trigger

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
scoreboard objectives add build trigger


scoreboard objectives add player_weave_index dummy
scoreboard objectives add player_weave_index_current dummy

scoreboard objectives add state trigger


#Open trigger
scoreboard objectives add open trigger

#Tie off strenght
scoreboard objectives add tie_strenght trigger

#Break tied off
scoreboard objectives add break_tied trigger

#Track slow down
scoreboard objectives add slow_down trigger

scoreboard objectives add t_1 dummy
scoreboard objectives add t_2 dummy
scoreboard objectives add t_3 dummy
scoreboard objectives add t_4 dummy
scoreboard objectives add t_5 dummy
scoreboard objectives add t_6 dummy
scoreboard objectives add t_7 dummy
scoreboard objectives add t_8 dummy
scoreboard objectives add t_9 dummy
scoreboard objectives add t_10 dummy
scoreboard objectives add t_11 dummy
scoreboard objectives add t_12 dummy
scoreboard objectives add t_13 dummy
scoreboard objectives add t_14 dummy
scoreboard objectives add t_15 dummy
scoreboard objectives add t_16 dummy
scoreboard objectives add t_17 dummy
scoreboard objectives add t_18 dummy
scoreboard objectives add t_19 dummy
scoreboard objectives add t_20 dummy

scoreboard objectives add stage dummy


#Click
scoreboard objectives add click minecraft.used:minecraft.carrot_on_a_stick

scoreboard objectives add weave_execute_id dummy
scoreboard objectives add weave_execute_random_number dummy
scoreboard objectives add player_id dummy
scoreboard objectives add circled_owner_id dummy
scoreboard objectives add circle_timer dummy

#Set to 0 as undefined breaks calculations
#Can't reset as that wreaks havoc
scoreboard players add #random_id player_id 0

#Set id after player
scoreboard objectives setdisplay list player_id

#Sneak detect
scoreboard objectives add sneak_time minecraft.custom:minecraft.sneak_time

#Leave/join detect
scoreboard objectives add leave_detect minecraft.custom:minecraft.leave_game

#Death detect
scoreboard objectives add death_detect deathCount

scoreboard players set 2 reg_1 2
scoreboard players set 3 reg_1 3
scoreboard players set 5 reg_1 5
scoreboard players set 10 reg_1 10
scoreboard players set 16 reg_1 16
scoreboard players set 4 reg_1 4
scoreboard players set 20 reg_1 20
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

tellraw @a {"text":"Magic 0.5.3 loaded","bold":true,"color":"gold"}

scoreboard players set Temp reg_1 0
function magic:detect_permission
execute if score Temp reg_1 matches 0 run tellraw @a {"text":"This server doesn't have the adequate function permission level","bold":true,"color":"dark_red"}

setblock 0 -2 0 command_block{auto:1b,conditional:1b,Command:"scoreboard players set Temp reg_1 1"} destroy

schedule function magic:command_block_message 2s replace