# macro args = internal node fields (i = this node's index)
$scoreboard players set #o md_dummy $(o)
$scoreboard players set #k md_dummy $(k)
$scoreboard players set #g md_dummy $(g)
$scoreboard players set #c1 md_dummy $(c1)
$scoreboard players set #c2 md_dummy $(c2)
execute if score #o md_dummy matches 0 run function mazegen:solve_mid_v
execute if score #o md_dummy matches 1 run function mazegen:solve_mid_h
