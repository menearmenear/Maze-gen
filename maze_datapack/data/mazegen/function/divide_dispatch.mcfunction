# macro arg: o. Compares constants against the baked-in value, so child recursion cannot change which branch runs.
execute store result storage maze:div o int 1 run scoreboard players get #o md_dummy
$execute if score #zero md_dummy matches $(o) run function mazegen:divide_vertical
$execute if score #one md_dummy matches $(o) run function mazegen:divide_horizontal
