# macro args: x z w h par slot (one region in CELL units)
$scoreboard players set #x md_dummy $(x)
$scoreboard players set #z md_dummy $(z)
$scoreboard players set #w md_dummy $(w)
$scoreboard players set #h md_dummy $(h)
$scoreboard players set #par md_dummy $(par)
$scoreboard players set #slot md_dummy $(slot)
execute if score #solvemode md_dummy matches 1 run function mazegen:tree_add
execute if score #w md_dummy >= #min md_dummy if score #h md_dummy >= #min md_dummy run function mazegen:divide_do
