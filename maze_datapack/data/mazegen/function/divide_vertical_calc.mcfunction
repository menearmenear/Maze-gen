# wall line k = x + 1 + rand % (w-1)
execute store result score #r md_dummy run random value 0..32767
scoreboard players operation #r md_dummy %= #wm1 md_dummy
scoreboard players operation #k md_dummy = #x md_dummy
scoreboard players operation #k md_dummy += #r md_dummy
scoreboard players add #k md_dummy 1
# gap cell g = z + rand % gr
execute store result score #r md_dummy run random value 0..32767
scoreboard players operation #r md_dummy %= #gr md_dummy
scoreboard players operation #g md_dummy = #z md_dummy
scoreboard players operation #g md_dummy += #r md_dummy
# block coords: wall columns wx..wx+t-1 = ox + k*p ; wall spans z0 .. z1 + thickness
scoreboard players operation #wx md_dummy = #k md_dummy
scoreboard players operation #wx md_dummy *= #p md_dummy
scoreboard players operation #wx md_dummy += #ox md_dummy
scoreboard players operation #wx1 md_dummy = #wx md_dummy
scoreboard players operation #wx1 md_dummy += #wtm1 md_dummy
scoreboard players operation #z0 md_dummy = #z md_dummy
scoreboard players operation #z0 md_dummy *= #p md_dummy
scoreboard players operation #z0 md_dummy += #oz md_dummy
scoreboard players operation #z1 md_dummy = #h md_dummy
scoreboard players operation #z1 md_dummy *= #p md_dummy
scoreboard players operation #z1 md_dummy += #z0 md_dummy
scoreboard players operation #z1 md_dummy += #wtm1 md_dummy
# gap block range gs .. ge (corridor-wide, offset by the wall thickness)
scoreboard players operation #gs md_dummy = #g md_dummy
scoreboard players operation #gs md_dummy *= #p md_dummy
scoreboard players operation #gs md_dummy += #oz md_dummy
scoreboard players operation #gs md_dummy += #wt md_dummy
scoreboard players operation #ge md_dummy = #gs md_dummy
scoreboard players operation #ge md_dummy += #cw md_dummy
scoreboard players remove #ge md_dummy 1
# child 1: x, z, k-x, h
scoreboard players operation #c1w md_dummy = #k md_dummy
scoreboard players operation #c1w md_dummy -= #x md_dummy
# child 2: k, z, x+w-k, h
scoreboard players operation #c2w md_dummy = #x md_dummy
scoreboard players operation #c2w md_dummy += #w md_dummy
scoreboard players operation #c2w md_dummy -= #k md_dummy
# --- store EVERYTHING (wall, gap, both children) before recursing ---
execute store result storage maze:div fx0 int 1 run scoreboard players get #wx md_dummy
execute store result storage maze:div fz0 int 1 run scoreboard players get #z0 md_dummy
execute store result storage maze:div fx1 int 1 run scoreboard players get #wx1 md_dummy
execute store result storage maze:div fz1 int 1 run scoreboard players get #z1 md_dummy
execute store result storage maze:div gx0 int 1 run scoreboard players get #wx md_dummy
execute store result storage maze:div gz0 int 1 run scoreboard players get #gs md_dummy
execute store result storage maze:div gx1 int 1 run scoreboard players get #wx1 md_dummy
execute store result storage maze:div gz1 int 1 run scoreboard players get #ge md_dummy
execute store result storage maze:div c1x int 1 run scoreboard players get #x md_dummy
execute store result storage maze:div c1z int 1 run scoreboard players get #z md_dummy
execute store result storage maze:div c1w int 1 run scoreboard players get #c1w md_dummy
execute store result storage maze:div c1h int 1 run scoreboard players get #h md_dummy
execute store result storage maze:div c2x int 1 run scoreboard players get #k md_dummy
execute store result storage maze:div c2z int 1 run scoreboard players get #z md_dummy
execute store result storage maze:div c2w int 1 run scoreboard players get #c2w md_dummy
execute store result storage maze:div c2h int 1 run scoreboard players get #h md_dummy
function mazegen:divide_go with storage maze:div
