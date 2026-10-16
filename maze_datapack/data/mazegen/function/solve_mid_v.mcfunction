# vertical wall at cell column #k, gap cell row #g; child1 = left, child2 = right
scoreboard players operation #stx md_dummy = #tx md_dummy
scoreboard players operation #stz md_dummy = #tz md_dummy
execute if score #fx md_dummy < #k md_dummy if score #tx md_dummy < #k md_dummy run function mazegen:same_c1
execute if score #fx md_dummy >= #k md_dummy if score #tx md_dummy >= #k md_dummy run function mazegen:same_c2
execute if score #fx md_dummy < #k md_dummy if score #tx md_dummy >= #k md_dummy run function mazegen:split_lr_v
execute if score #fx md_dummy >= #k md_dummy if score #tx md_dummy < #k md_dummy run function mazegen:split_rl_v
