# stores orientation/gap of the wall just drawn into this region's tree node
execute store result storage maze:tn2 idx int 1 run scoreboard players get #node md_dummy
execute store result storage maze:tn2 o int 1 run scoreboard players get #o md_dummy
execute store result storage maze:tn2 k int 1 run scoreboard players get #k md_dummy
execute store result storage maze:tn2 g int 1 run scoreboard players get #g md_dummy
function mazegen:tree_set with storage maze:tn2
