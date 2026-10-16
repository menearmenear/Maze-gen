# macro args: n fx fz tx tz (one pending sub-path through the division tree)
$scoreboard players set #n md_dummy $(n)
$scoreboard players set #fx md_dummy $(fx)
$scoreboard players set #fz md_dummy $(fz)
$scoreboard players set #tx md_dummy $(tx)
$scoreboard players set #tz md_dummy $(tz)
$function mazegen:solve_node with storage maze:tree nodes[$(n)]
