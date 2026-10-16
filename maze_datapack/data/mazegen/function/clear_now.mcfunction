# clears maze blocks inside the width x height area
scoreboard players operation #cx1 md_dummy = #ox md_dummy
scoreboard players operation #cx1 md_dummy += #global mz_size
scoreboard players remove #cx1 md_dummy 1
scoreboard players operation #cz1 md_dummy = #oz md_dummy
scoreboard players operation #cz1 md_dummy += #global mz_height
scoreboard players remove #cz1 md_dummy 1
execute store result storage maze:clear x0 int 1 run scoreboard players get #ox md_dummy
execute store result storage maze:clear z0 int 1 run scoreboard players get #oz md_dummy
execute store result storage maze:clear x1 int 1 run scoreboard players get #cx1 md_dummy
execute store result storage maze:clear z1 int 1 run scoreboard players get #cz1 md_dummy
function mazegen:clear_area
tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"Area cleared.","color":"green"}]
