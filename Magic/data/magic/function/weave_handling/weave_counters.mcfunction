################################################################################
#Purpose: Count up all elements and all distinct element combinations in weave
#Runner: An armorstand holding a weave, run via pre_weaves.mcfunction->weaves.mcfunction->weave_counters.mcfunction
#Return values:
#Authors: Lprogrammer
################################################################################

#Air
scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_air_count = @s reg_1

#Earth
scoreboard players set Temp reg_1 2
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_earth_count = @s reg_1

#Fire
scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_fire_count = @s reg_1

#Water
scoreboard players set Temp reg_1 4
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_water_count = @s reg_1

#Spirit
scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_spirit_count = @s reg_1

#Adjust according to other

#Explosion
scoreboard players set Temp reg_1 2
scoreboard players set Temp reg_2 3
function magic:weave_processing/count_weave_double
scoreboard players operation @s weave_explosion_count = @s reg_1

scoreboard players operation @s weave_earth_count -= @s weave_explosion_count
scoreboard players operation @s weave_fire_count -= @s weave_explosion_count

#Lightning
scoreboard players set Temp reg_1 3
scoreboard players set Temp reg_2 1
function magic:weave_processing/count_weave_double
scoreboard players operation @s weave_lightning_count = @s reg_1

scoreboard players operation @s weave_fire_count -= @s weave_lightning_count
scoreboard players operation @s weave_air_count -= @s weave_lightning_count

#Ice
scoreboard players set Temp reg_1 3
scoreboard players set Temp reg_2 4
function magic:weave_processing/count_weave_double
scoreboard players operation @s weave_ice_count = @s reg_1

scoreboard players operation @s weave_fire_count -= @s weave_ice_count
scoreboard players operation @s weave_water_count -= @s weave_ice_count


#Extinguish
scoreboard players set Temp reg_1 1
scoreboard players set Temp reg_2 4
function magic:weave_processing/count_weave_double
scoreboard players operation @s weave_extinguish_count = @s reg_1

scoreboard players operation @s weave_air_count -= @s weave_extinguish_count
scoreboard players operation @s weave_water_count -= @s weave_extinguish_count

#Dry
scoreboard players set Temp reg_1 3
scoreboard players set Temp reg_2 3
scoreboard players set Temp reg_3 4
function magic:weave_processing/count_weave_tripple
scoreboard players operation @s weave_dry_count = @s reg_1

scoreboard players operation @s weave_fire_count -= @s weave_dry_count
scoreboard players operation @s weave_fire_count -= @s weave_dry_count
scoreboard players operation @s weave_water_count -= @s weave_dry_count

scoreboard players operation @s weave_ice_count -= @s weave_dry_count

#Cutting
scoreboard players set Temp reg_1 5
scoreboard players set Temp reg_2 3
scoreboard players set Temp reg_3 2
function magic:weave_processing/count_weave_tripple
scoreboard players operation @s weave_cut_count = @s reg_1

scoreboard players operation @s weave_spirit_count -= @s weave_cut_count
scoreboard players operation @s weave_fire_count -= @s weave_cut_count
scoreboard players operation @s weave_earth_count -= @s weave_cut_count

#Delving
scoreboard players set Temp reg_1 5
scoreboard players set Temp reg_2 4
scoreboard players set Temp reg_3 1
function magic:weave_processing/count_weave_tripple
scoreboard players operation @s weave_delve_count = @s reg_1

scoreboard players operation @s weave_air_count -= @s weave_delve_count
scoreboard players operation @s weave_spirit_count -= @s weave_delve_count
scoreboard players operation @s weave_water_count -= @s weave_delve_count


#Lava
scoreboard players set Temp reg_1 2
scoreboard players set Temp reg_2 3
scoreboard players set Temp reg_3 3
function magic:weave_processing/count_weave_tripple
scoreboard players operation @s weave_lava_count = @s reg_1

scoreboard players operation @s weave_explosion_count -= @s weave_lava_count
scoreboard players operation @s weave_fire_count -= @s weave_lava_count


#Light
scoreboard players set Temp reg_1 1
scoreboard players set Temp reg_2 3
scoreboard players set Temp reg_3 3
scoreboard players set Temp reg_4 1
function magic:weave_processing/count_weave_quadruple
scoreboard players operation @s weave_light_count = @s reg_1

scoreboard players operation @s weave_lightning_count -= @s weave_light_count
scoreboard players operation @s weave_air_count -= @s weave_light_count
scoreboard players operation @s weave_fire_count -= @s weave_light_count


#Needs to be below all primary detections
function magic:weave_processing/advance_read_index


#Secondary detection
scoreboard players set @s weave_air_count_1 0
scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_air_count_1 = @s reg_1

scoreboard players set @s weave_earth_count_1 0
scoreboard players set Temp reg_1 2
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_earth_count_1 = @s reg_1

scoreboard players set @s weave_fire_count_1 0
scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_fire_count_1 = @s reg_1

scoreboard players set @s weave_water_count_1 0
scoreboard players set Temp reg_1 4
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_water_count_1 = @s reg_1

scoreboard players set @s weave_spirit_count_1 0
scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_spirit_count_1 = @s reg_1