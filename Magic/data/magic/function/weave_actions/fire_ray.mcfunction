$function magic:actions/fill_if_allowed {x_s:-$(size),y_s:-$(size),z_s:-$(size),x_e:$(size),y_e:$(size),z_e:$(size),argument:"fire replace #magic:fireable"}

$execute as @e[distance=..$(size)] at @s run damage @s $(size) minecraft:on_fire

scoreboard players remove Fire_ray reg_1 1
$execute if score Fire_ray reg_1 matches 1.. if entity @s[distance=$(size)..] facing entity @s eyes positioned ^ ^ ^$(size) run function magic:weave_actions/fire_ray with storage magic:weave_size