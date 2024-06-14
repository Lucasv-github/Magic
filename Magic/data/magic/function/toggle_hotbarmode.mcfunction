execute as @s[tag=barmode] run tag @s add barmode_changed
execute as @s[tag=barmode] run scoreboard players set @s use_items 0
execute as @s[tag=barmode] run function magic:unset_hotbarmode

execute as @s[tag=!barmode,tag=!barmode_changed] run function magic:set_hotbarmode
execute as @s[tag=!barmode,tag=!barmode_changed] run scoreboard players set @s use_items 1

tag @s remove barmode_changed
