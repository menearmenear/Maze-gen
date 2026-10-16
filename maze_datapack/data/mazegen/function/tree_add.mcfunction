# records this region as a node of the division tree (only used by solution mode)
execute store result storage maze:tn x int 1 run scoreboard players get #x md_dummy
execute store result storage maze:tn z int 1 run scoreboard players get #z md_dummy
execute store result storage maze:tn w int 1 run scoreboard players get #w md_dummy
execute store result storage maze:tn h int 1 run scoreboard players get #h md_dummy
execute store result storage maze:tn par int 1 run scoreboard players get #par md_dummy
execute store result storage maze:tn n int 1 run scoreboard players get #nodes md_dummy
function mazegen:tree_append with storage maze:tn
execute if score #par md_dummy matches 0.. if score #slot md_dummy matches 1 run function mazegen:tree_link1 with storage maze:tn
execute if score #par md_dummy matches 0.. if score #slot md_dummy matches 2 run function mazegen:tree_link2 with storage maze:tn
scoreboard players add #nodes md_dummy 1
