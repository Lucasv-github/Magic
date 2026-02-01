execute at @s as @a[limit=1,sort=nearest] run say I am very good at following instructions
execute at @s run summon villager ~ ~5 ~5 {VillagerData:{type:plains,profession:farmer,level:2},Invulnerable:1b,Tags:["magic_help_interactive_tutorial_villager"]}
execute as @e[type=witch,tag=magic_help_interactive_tutorial_villager] run kill @s