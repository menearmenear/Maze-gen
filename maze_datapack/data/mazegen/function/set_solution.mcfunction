# toggle 0/1 without branching: (v+1) % 2
scoreboard players add #global mz_solution 1
scoreboard players operation #global mz_solution %= #c2 md_dummy
tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"Solved mode toggled.","color":"green"}]
function mazegen:menu
