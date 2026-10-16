# 0 = vertical wall (splits the width), 1 = horizontal wall. Wider -> vertical, taller -> horizontal, square -> random.
execute store result score #o md_dummy run random value 0..1
execute if score #w md_dummy > #h md_dummy run scoreboard players set #o md_dummy 0
execute if score #h md_dummy > #w md_dummy run scoreboard players set #o md_dummy 1
# dispatch through storage so the choice survives recursion (scores are clobbered by children)
execute store result storage maze:dir o int 1 run scoreboard players get #o md_dummy
function mazegen:divide_dispatch with storage maze:dir
