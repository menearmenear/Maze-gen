# glowstone floor under a horizontal wall's gap (cw x wt at wall row k*p+oz)
scoreboard players operation #bz0 md_dummy = #k md_dummy
scoreboard players operation #bz0 md_dummy *= #p md_dummy
scoreboard players operation #bz0 md_dummy += #oz md_dummy
scoreboard players operation #bz1 md_dummy = #bz0 md_dummy
scoreboard players operation #bz1 md_dummy += #wt md_dummy
scoreboard players remove #bz1 md_dummy 1
scoreboard players operation #bx0 md_dummy = #g md_dummy
scoreboard players operation #bx0 md_dummy *= #p md_dummy
scoreboard players operation #bx0 md_dummy += #ox md_dummy
scoreboard players operation #bx0 md_dummy += #wt md_dummy
scoreboard players operation #bx1 md_dummy = #bx0 md_dummy
scoreboard players operation #bx1 md_dummy += #cw md_dummy
scoreboard players remove #bx1 md_dummy 1
execute store result storage maze:fill x0 int 1 run scoreboard players get #bx0 md_dummy
execute store result storage maze:fill x1 int 1 run scoreboard players get #bx1 md_dummy
execute store result storage maze:fill z0 int 1 run scoreboard players get #bz0 md_dummy
execute store result storage maze:fill z1 int 1 run scoreboard players get #bz1 md_dummy
function mazegen:fill_green with storage maze:fill
