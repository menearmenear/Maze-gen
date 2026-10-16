# right -> left across the gap: child2 ends at (k, g), child1 starts at (k-1, g)
function mazegen:green_cross_v
scoreboard players operation #pn md_dummy = #c2 md_dummy
scoreboard players operation #tx md_dummy = #k md_dummy
scoreboard players operation #tz md_dummy = #g md_dummy
function mazegen:push_item
scoreboard players operation #pn md_dummy = #c1 md_dummy
scoreboard players operation #fx md_dummy = #k md_dummy
scoreboard players remove #fx md_dummy 1
scoreboard players operation #fz md_dummy = #g md_dummy
scoreboard players operation #tx md_dummy = #stx md_dummy
scoreboard players operation #tz md_dummy = #stz md_dummy
function mazegen:push_item
