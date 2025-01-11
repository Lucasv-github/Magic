scoreboard objectives add deaths deathCount

scoreboard objectives add player_id dummy
scoreboard objectives add entity_id dummy

#Set to 0 as undefined breaks calculations
#Can't reset as that wreaks havoc
scoreboard players add #random_id player_id 0

#Set id after player
scoreboard objectives setdisplay list player_id

tellraw @a {"text":"Magic commons 1.21.4-0 loaded","bold":true,"color":"gold"}
