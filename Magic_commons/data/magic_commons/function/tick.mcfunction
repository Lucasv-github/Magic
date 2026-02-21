execute as @a run function magic_commons:actionbar_display

#Player id
scoreboard players add @a player_id 0
execute as @p[scores={player_id=0}] run scoreboard players add #next_id player_id 1
scoreboard players operation @p[scores={player_id=0}] player_id = #next_id player_id

#Entity id
#We can live with this collision risk (don't want an id of zero)
execute as @e unless score @s entity_id matches 1.. store result score @s entity_id run random value 1..2147483646

#Death detect
execute as @a[scores={deaths=1..}] run function magic_commons:death

scoreboard players enable @a[nbt={Dimension:"magic_commons:tar"}] tar_survival
scoreboard players enable @a[nbt={Dimension:"magic_commons:tar"}] tar_creative

execute as @a[scores={tar_survival=1..},nbt={Dimension:"magic_commons:tar"}] run function magic_commons:tar_survival
execute as @a[scores={tar_creative=1..},nbt={Dimension:"magic_commons:tar"}] run function magic_commons:tar_creative

execute as @a[nbt={Dimension:"magic_commons:tar"}] run function magic_commons:tar_chunk_change
execute as @e[tag=tar_chunk_loaded_not_copied] at @s run function magic_commons:copy_to_tar
execute as @a[tag=died_in_tar] at @s unless dimension magic_commons:tar run function magic_commons:tar_death
execute as @a[tag=in_tar] at @s unless dimension magic_commons:tar run function magic_commons:exit_tar

execute as @a[tag=!join_ability_add] if score magic_settings magic_auto_ability_state matches 2 run function magic:magic_support/add_ability
execute as @a[tag=!join_ability_add] if score magic_settings magic_auto_ability_state matches 2 run tag @s add join_ability_add
