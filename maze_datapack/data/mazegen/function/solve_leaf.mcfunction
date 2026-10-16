# macro args = leaf node fields: straight strip from (fx,fz) to (tx,tz)
$scoreboard players set #w md_dummy $(w)
$scoreboard players set #lx md_dummy $(x)
$scoreboard players set #lz md_dummy $(z)
execute if score #w md_dummy matches 1 run function mazegen:leaf_v
execute if score #w md_dummy matches 2.. run function mazegen:leaf_h
