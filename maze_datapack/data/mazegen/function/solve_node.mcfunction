# macro args = tree node fields (i = this node's index)
$scoreboard players set #c1 md_dummy $(c1)
$execute if score #c1 md_dummy matches -1 run function mazegen:solve_leaf with storage maze:tree nodes[$(i)]
$execute if score #c1 md_dummy matches 0.. run function mazegen:solve_mid with storage maze:tree nodes[$(i)]
