# macro (args = maze:div): draws the wall (thickness/height aware, chunked) + gap, then enqueues both children
execute store result score #qo md_dummy run data get storage maze:div o
execute if score #qo md_dummy matches 0 run function mazegen:divide_wall_v
execute if score #qo md_dummy matches 1 run function mazegen:divide_wall_h
$fill ~$(gx0) ~ ~$(gz0) ~$(gx1) ~$(whm1) ~$(gz1) minecraft:air
scoreboard players add #divs md_dummy 1
# this region's node id = #nodes - 1 (tree_add ran when the item was loaded)
scoreboard players operation #node md_dummy = #nodes md_dummy
scoreboard players remove #node md_dummy 1
execute if score #solvemode md_dummy matches 1 run function mazegen:tree_set_node
execute store result storage maze:div n int 1 run scoreboard players get #node md_dummy
function mazegen:queue_children with storage maze:div
