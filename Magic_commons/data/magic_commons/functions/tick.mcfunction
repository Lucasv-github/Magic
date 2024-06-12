scoreboard players enable @a[nbt={Dimension:"magic:tar"}] tar_survival
scoreboard players enable @a[nbt={Dimension:"magic:tar"}] tar_creative

execute as @a[scores={tar_survival=1..},nbt={Dimension:"magic:tar"}] run function magic:tar_survival
execute as @a[scores={tar_creative=1..},nbt={Dimension:"magic:tar"}] run function magic:tar_creative

execute as @a[nbt={Dimension:"magic:tar"}] run function magic:tar_chunk_change
execute as @e[tag=tar_chunk_loaded_not_copied] at @s run function magic:copy_to_tar
execute as @a[tag=died_in_tar] at @s unless dimension magic:tar run function magic:tar_death
execute as @a[tag=in_tar] at @s unless dimension magic:tar run function magic:exit_tar