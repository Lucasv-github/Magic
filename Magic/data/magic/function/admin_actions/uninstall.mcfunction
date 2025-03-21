tellraw @a {"text":"Uninstalling magic, observe that this will leave tags on unloaded entities","bold":true,"color":"dark_red"}

execute as @a[tag=using] run function magic:power_handling/exit

datapack disable "file/Magic"

scoreboard objectives remove death_detect
scoreboard objectives remove leave_detect
scoreboard objectives remove sneak_time
scoreboard objectives remove weave_read_index
scoreboard objectives remove circled_owner_id
scoreboard objectives remove weave_execute_random_number
scoreboard objectives remove weave_owner_entity_id
scoreboard objectives remove weave_owner_player_id
scoreboard objectives remove weave_locked_entity_id
scoreboard objectives remove weave_locked_player_id
scoreboard objectives remove click
scoreboard objectives remove weave_light_count
scoreboard objectives remove weave_lava_count
scoreboard objectives remove weave_balefire_ray_count
scoreboard objectives remove weave_fire_ray_count
scoreboard objectives remove weave_bridge_count
scoreboard objectives remove weave_heal_count
scoreboard objectives remove weave_dry_count
scoreboard objectives remove weave_extinguish_count
scoreboard objectives remove weave_ice_count
scoreboard objectives remove weave_cut_count
scoreboard objectives remove weave_lightning_count
scoreboard objectives remove weave_explosion_count
scoreboard objectives remove weave_spirit_count_n
scoreboard objectives remove weave_spirit_count_1
scoreboard objectives remove weave_spirit_count
scoreboard objectives remove weave_water_count_n
scoreboard objectives remove weave_water_count_1
scoreboard objectives remove weave_water_count
scoreboard objectives remove weave_fire_count_n
scoreboard objectives remove weave_fire_count_1
scoreboard objectives remove weave_fire_count
scoreboard objectives remove weave_earth_count_n
scoreboard objectives remove weave_earth_count_1
scoreboard objectives remove weave_earth_count
scoreboard objectives remove weave_air_count_n
scoreboard objectives remove weave_air_count_1
scoreboard objectives remove weave_air_count
scoreboard objectives remove slow_down
scoreboard objectives remove tie_strength
scoreboard objectives remove weave_length
scoreboard objectives remove state
scoreboard objectives remove held_player_weave_index
scoreboard objectives remove player_weave_index
scoreboard objectives remove count
scoreboard objectives remove build
scoreboard objectives remove line
scoreboard objectives remove s
scoreboard objectives remove w
scoreboard objectives remove f
scoreboard objectives remove e
scoreboard objectives remove a
scoreboard objectives remove position_z
scoreboard objectives remove position_y
scoreboard objectives remove position_x
scoreboard objectives remove tar_current_chunk_y
scoreboard objectives remove tar_current_chunk_x
scoreboard objectives remove return_z
scoreboard objectives remove return_y
scoreboard objectives remove return_x
scoreboard objectives remove destination_z
scoreboard objectives remove destination_y
scoreboard objectives remove destination_x
scoreboard objectives remove reg_6
scoreboard objectives remove reg_5
scoreboard objectives remove reg_4
scoreboard objectives remove reg_3
scoreboard objectives remove reg_2
scoreboard objectives remove reg_1
scoreboard objectives remove weave_despawn_time
scoreboard objectives remove weave_remaining_time
scoreboard objectives remove disguise
scoreboard objectives remove doomed
scoreboard objectives remove use_items
scoreboard objectives remove use_items_current
scoreboard objectives remove hotbar_current
scoreboard objectives remove tar_creative
scoreboard objectives remove tar_survival
scoreboard objectives remove finder_index
scoreboard objectives remove finder_time
scoreboard objectives remove finder_owner_id
scoreboard objectives remove shield_lower_amount
scoreboard objectives remove tap_block_range
scoreboard objectives remove tap_block_percentage
scoreboard objectives remove current_strength
scoreboard objectives remove regenerated_strength
scoreboard objectives remove max_regenerated_strength
scoreboard objectives remove cumulative_halve_amount_hold
scoreboard objectives remove halve_amount_hold
scoreboard objectives remove my_draw_amount
scoreboard objectives remove total_draw_amount
scoreboard objectives remove well_slot
scoreboard objectives remove well_amount
scoreboard objectives remove angreal_level
scoreboard objectives remove current_held
scoreboard objectives remove click_counter
scoreboard objectives remove projectile_shielded
scoreboard objectives remove set_regenerated
scoreboard objectives remove set_halve_hold
scoreboard objectives remove select_player
scoreboard objectives remove add_ability
scoreboard objectives remove re_add_ability
scoreboard objectives remove remove_ability
scoreboard objectives remove give_book
scoreboard objectives remove admin_panel
scoreboard objectives remove shields_blocked
scoreboard objectives remove second_counter
scoreboard objectives remove total_ticks
scoreboard objectives remove tick_counter
scoreboard objectives remove normal_distributed
scoreboard objectives remove magic_debug_weave_state
scoreboard objectives remove magic_min_strength
scoreboard objectives remove magic_max_strength
scoreboard objectives remove magic_balefire_ban
scoreboard objectives remove magic_auto_ability_state
scoreboard objectives remove magic_debug_state


tag @e remove weave_lapsed
tag @e remove remove_weave_temp_worked
tag @e remove player_remove_weave_exists_temp
tag @e remove pick_up_picking_temp
tag @e remove pick_up_me_temp
tag @e remove pick_up_within_range_temp
tag @e remove temp_weave_name
tag @e remove move_slot_8
tag @e remove give_current_weave
tag @e remove throw_lock_temp_to_throw
tag @e remove throw_lock_temp_thrower
tag @e remove target_point
tag @e remove getting_cut
tag @e remove cut
tag @e remove gateway_end_temp
tag @e remove travel_owner
tag @e remove bridge
tag @e remove bind_lock_temp_to_bind
tag @e remove bind_lock_temp_binder
tag @e remove balefire_ray_not_me
tag @e remove tap_power_shielded_temp
tag @e remove stilled
tag @e remove temp_remove_circle
tag @e remove opening
tag @e remove force_circle_owner_temp
tag @e remove previous_bridge
tag @e remove welled
tag @e remove angrealed
tag @e remove angreal_flawed
tag @e remove create_circle_member_temp
tag @e remove circle_owner
tag @e remove create_angreal_top_temp
tag @e remove create_angreal_base_temp
tag @e remove tap_blocked
tag @e remove trying_to_break_free
tag @e remove barmode_changed
tag @e remove tied_shield_unknot_tell_temp
tag @e remove tied_shield_unknot_temp
tag @e remove weave_sink_power_well_temp
tag @e remove weave_sink_power_angreal_temp
tag @e remove tap_power_temp_shielded
tag @e remove shield_handling_reduce_temp
tag @e remove set_well_amount_storage
tag @e remove barmode
tag @e remove to_be_circle_owner_temp
tag @e remove temp_target_point
tag @e remove holding_run_temp
tag @e remove held_overpower_temp
tag @e remove circle_owner_temp
tag @e remove swap_hands_storage
tag @e remove current_storage
tag @e remove current_withdraw
tag @e remove remove_cleanup_temp
tag @e remove circled
tag @e remove tell_shielders_temp
tag @e remove shield_counter_selected
tag @e remove shield_counter_selected_old
tag @e remove display_shelds_change_temp
tag @e remove display_shelds_send_temp
tag @e remove display_shelds_tell_temp
tag @e remove current_circle_info
tag @e remove op_detected
tag @e remove test_op
tag @e remove can_unload_self_temp
tag @e remove can_unload_temp
tag @e remove can_unload_blocker_temp
tag @e remove console_writer
tag @e remove console_writer_new
tag @e remove console_write_composition_temp
tag @e remove console_writer_current_weave_locked
tag @e remove current_player_for_log
tag @e remove console_writer_current_weave
tag @e remove throw_remove_exists_temp
tag @e remove remove_no_owner_exists_temp
tag @e remove remove_cleanup_player_single_temp
tag @e remove holds_travel
tag @e remove actively_held
tag @e remove tied_off
tag @e remove gateway_end
tag @e remove weave_travel_temp_works
tag @e remove weave_throw_damaged
tag @e remove weave_throw
tag @e remove weave_thrower
tag @e remove weave_throw_exists_temp
tag @e remove weave_slap
tag @e remove slapper
tag @e remove weave_shield
tag @e remove weave_server_temp_works
tag @e remove weave_resistance
tag @e remove weave_mask_ability_temp_works
tag @e remove weave_levitate
tag @e remove weave_thrower_temp
tag @e remove launched_throw
tag @e remove launched_fireball
tag @e remove weave_invisibility_temp_works
tag @e remove inverted
tag @e remove weave_invert_ability_temp_works
tag @e remove heal_me
tag @e remove weave_fire_ray_temp_works
tag @e remove temp_explosion
tag @e remove weave_bridge
tag @e remove bridge_start
tag @e remove weave_bridge_need_armor_stand_temp
tag @e remove weave_bridge_temp_works
tag @e remove weave_bind
tag @e remove weave_balefire_ray_temp_works
tag @e remove weave_angreal_start_temp
tag @e remove weave_air_box
tag @e remove weave_air_box_temp_works
tag @e remove weave_fire_sword
tag @e remove weave_fire_pickaxe
tag @e remove weave_fire_axe
tag @e remove weave_ward
tag @e remove admin
tag @e remove can_see
tag @e remove teleport_target
tag @e remove truly_see
tag @e remove weave_damaged
tag @e remove angrealed_held
tag @e remove need_weave_flush
tag @e remove tick_offhand_temp
tag @e remove can_break_free
tag @e remove to_be_kicked
tag @e remove to_be_banned
tag @e remove using
tag @e remove next_sever
tag @e remove can_use
tag @e remove built
tag @e remove current_weave
tag @e remove weave_run_yet
tag @e remove periodic_draw_circle_temp
tag @e remove new_ray_multi_blocked_temp


data remove storage magic:advance_read_index_iteration i
data remove storage magic:air_box size
data remove storage magic:air_box size_1

data remove storage magic:count_weave_double_iteration index
data remove storage magic:count_weave_double_iteration i
data remove storage magic:count_weave_double_iteration i_1

data remove storage magic:count_weave_quadruple_iteration index
data remove storage magic:count_weave_quadruple_iteration i
data remove storage magic:count_weave_quadruple_iteration i_1
data remove storage magic:count_weave_quadruple_iteration i_2
data remove storage magic:count_weave_quadruple_iteration i_3

data remove storage magic:count_weave_single_iteration index
data remove storage magic:count_weave_single_iteration i

data remove storage magic:count_weave_tripple_iteration index
data remove storage magic:count_weave_tripple_iteration i
data remove storage magic:count_weave_tripple_iteration i_1
data remove storage magic:count_weave_tripple_iteration i_2

data remove storage magic:damage amount
data remove storage magic:display_player_glow count
data remove storage magic:explosion_radius size
data remove storage magic:get_normal_distributed_index index
data remove storage magic:get_weave_length index
data remove storage magic:give_current_weave i
data remove storage magic:give_current_weave_build text

data remove storage magic:give_current_weave_iteration index
data remove storage magic:give_current_weave_iteration i

data remove storage magic:levitate amount

data remove storage magic:lightning amount
data remove storage magic:lightning radius

data remove storage magic:match_weave match_index
data remove storage magic:match_weave index
data remove storage magic:match_weave i

data remove storage magic:match_weave_1 Elements
data remove storage magic:match_weave_2 Elements
data remove storage magic:match_weave_3 Elements
data remove storage magic:match_weave_4 Elements
data remove storage magic:match_weave_5 Elements

data remove storage magic:match_weave_iteration match_index
data remove storage magic:match_weave_iteration index
data remove storage magic:match_weave_iteration i
data remove storage magic:match_weave_iteration j


data remove storage magic:math/get_strength index
data remove storage magic:print_weave_composition_build text

data remove storage magic:print_weave_composition_iteration x
data remove storage magic:print_weave_composition_iteration index
data remove storage magic:print_weave_composition_iteration i
data remove storage magic:print_weave_composition_iteration y

data remove storage magic:remove_air_box size
data remove storage magic:remove_bridge size
data remove storage magic:remove_cleanup_player_all_iteration index
data remove storage magic:remove_weave_data index
data remove storage magic:remove_weave_index index

data remove storage magic:strength_table Data
data remove storage magic:strength_table Elements

data remove storage magic:stun stun_amount


forceload remove 0 0