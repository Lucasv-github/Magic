#If no slot free drop everything instead of calculation very complicated part to drop (delta would have to check for just this EXACT item)
#This needs to be above to prevent the first from filling and triggering the second
$execute unless predicate magic:is_slot_free run summon minecraft:item ~ ~ ~ {Item:{id:"$(id)",Count:$(count)}}

#Give directly
$execute if predicate magic:is_slot_free run loot give @s loot {"pools":[{"rolls":$(count),"entries":[{"type":"minecraft:item","name":"$(id)"}]}]}

