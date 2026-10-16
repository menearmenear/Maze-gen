# bottom -> top across the gap: child2 ends at (g, k), child1 starts at (g, k-1)
function mazegen:green_cross_h
scoreboard players operation #pn md_dummy = #c2 md_dummy
scoreboard players operation #tz md_dummy = #k md_dummy
scoreboard players operation #tx md_dummy = #g md_dummy
function mazegen:push_item
scoreboard players operation #pn md_dummy = #c1 md_dummy
scoreboard players operation #fz md_dummy = #k md_dummy
scoreboard players remove #fz md_dummy 1
scoreboard players operation #fx md_dummy = #g md_dummy
scoreboard players operation #tz md_dummy = #stz md_dummy
scoreboard players operation #tx md_dummy = #stx md_dummy
function mazegen:push_item
