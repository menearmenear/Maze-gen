# horizontal wall at cell row #k, gap cell column #g; child1 = top, child2 = bottom
scoreboard players operation #stx md_dummy = #tx md_dummy
scoreboard players operation #stz md_dummy = #tz md_dummy
execute if score #fz md_dummy < #k md_dummy if score #tz md_dummy < #k md_dummy run function mazegen:same_c1
execute if score #fz md_dummy >= #k md_dummy if score #tz md_dummy >= #k md_dummy run function mazegen:same_c2
execute if score #fz md_dummy < #k md_dummy if score #tz md_dummy >= #k md_dummy run function mazegen:split_lr_h
execute if score #fz md_dummy >= #k md_dummy if score #tz md_dummy < #k md_dummy run function mazegen:split_rl_h
