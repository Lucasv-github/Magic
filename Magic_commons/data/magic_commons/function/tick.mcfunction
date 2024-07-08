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
