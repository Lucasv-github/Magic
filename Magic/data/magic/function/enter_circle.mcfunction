#Work with angreal
execute at @s run scoreboard players operation @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=using, tag=circle_owner] cumulative_halve_amount_hold += @s cumulative_halve_amount_hold

#Execute at prevents this from working if no one nerby is a circle owner anymore

#Person can't do anything if not owner of circle
execute at @s if entity @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=using, tag=circle_owner] run function magic:exit
execute at @s if entity @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=using, tag=circle_owner] run tag @s add circled
execute at @s run scoreboard players set @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=using, tag=circle_owner] circle_timer 0

#Get id of owner
execute at @s run scoreboard players operation @s circled_owner_id = @a[limit=1, sort=nearest, distance=..10, tag=can_use, tag=using, tag=circle_owner] player_id

scoreboard players set @s state 0
scoreboard players set @s my_draw_amount 0