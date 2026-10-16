# left -> right across the gap: child1 ends at (k-1, g), child2 starts at (k, g)
function mazegen:green_cross_v
scoreboard players operation #pn md_dummy = #c1 md_dummy
scoreboard players operation #tx md_dummy = #k md_dummy
scoreboard players remove #tx md_dummy 1
scoreboard players operation #tz md_dummy = #g md_dummy
function mazegen:push_item
scoreboard players operation #pn md_dummy = #c2 md_dummy
scoreboard players operation #fx md_dummy = #k md_dummy
scoreboard players operation #fz md_dummy = #g md_dummy
scoreboard players operation #tx md_dummy = #stx md_dummy
scoreboard players operation #tz md_dummy = #stz md_dummy
function mazegen:push_item
