scoreboard players remove Correct_regenerate_strength reg_1 1

function magic:magic_actions/regenerate_strength_once

execute if score Correct_regenerate_strength reg_1 matches 1..19 run function magic:magic_actions/correct_regenerated_strength_iteration
