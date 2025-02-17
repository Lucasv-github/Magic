scoreboard objectives add deaths deathCount

scoreboard objectives add player_id dummy
scoreboard objectives add entity_id dummy
scoreboard objectives add store_id dummy

#Might be needed in this pack if loaded before magic, thus add these here as well
scoreboard objectives add reg_1 dummy
scoreboard objectives add reg_2 dummy
scoreboard objectives add reg_3 dummy
scoreboard objectives add reg_4 dummy
scoreboard objectives add reg_5 dummy
scoreboard objectives add reg_6 dummy

#Set to 0 as undefined breaks calculations
#Can't reset as that wreaks havoc
scoreboard players add #random_id player_id 0

#Set id after player
scoreboard objectives setdisplay list player_id

#Keep player hotbar copies loaded
execute in minecraft:overworld run forceload add 0 0

#To allow console log on servers
setblock 0 -1 0 repeating_command_block{auto:1b,conditional:1b,Command:"kill @e[type=minecraft:armor_stand,tag=console_writer,limit=1]"} destroy

scoreboard players set Temp reg_1 0
function magic:detections/detect_permission
execute if score Temp reg_1 matches 0 run tellraw @a {"text":"This server doesn't have the adequate function permission level","bold":true,"color":"dark_red"}

scoreboard players set Detect_command_blocks reg_1 0
#For some reason we need to give this a bit of a time
schedule function magic_commons:command_block_check 2s replace
schedule function magic_commons:command_block_message 4s replace

tellraw @a {"text":"Magic commons 1.21.4-2 loaded","bold":true,"color":"gold"}
