#Player need to be near water
scoreboard players operation Temp reg_1 = @s weave_owner_player_id
execute as @a[tag=using,tag=can_use] if score @s player_id = Temp reg_1 at @s store success score Temp reg_2 run clone ~5 ~5 ~5 ~-5 ~-5 ~-5 ~-5 ~-5 ~-5 filtered minecraft:water force

$execute if score Temp reg_2 matches 1.. at @s positioned ~ ~1 ~ run function magic:actions/fill_if_allowed {x_s:-$(size),y_s:-$(size),z_s:-$(size),x_e:$(size),y_e:$(size),z_e:$(size),argument:"water replace air"}