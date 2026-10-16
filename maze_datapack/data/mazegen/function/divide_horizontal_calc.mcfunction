# wall line k = z + 1 + rand % (h-1)
execute store result score #r md_dummy run random value 0..32767
scoreboard players operation #r md_dummy %= #hm1 md_dummy
scoreboard players operation #k md_dummy = #z md_dummy
scoreboard players operation #k md_dummy += #r md_dummy
scoreboard players add #k md_dummy 1
# gap cell g = x + rand % gr
execute store result score #r md_dummy run random value 0..32767
scoreboard players operation #r md_dummy %= #gr md_dummy
scoreboard players operation #g md_dummy = #x md_dummy
scoreboard players operation #g md_dummy += #r md_dummy
# block coords: wall rows wz..wz+t-1 = oz + k*p ; wall spans x0 .. x1 + thickness
scoreboard players operation #wz md_dummy = #k md_dummy
scoreboard players operation #wz md_dummy *= #p md_dummy
scoreboard players operation #wz md_dummy += #oz md_dummy
scoreboard players operation #wz1 md_dummy = #wz md_dummy
scoreboard players operation #wz1 md_dummy += #wtm1 md_dummy
scoreboard players operation #x0 md_dummy = #x md_dummy
scoreboard players operation #x0 md_dummy *= #p md_dummy
scoreboard players operation #x0 md_dummy += #ox md_dummy
scoreboard players operation #x1 md_dummy = #w md_dummy
scoreboard players operation #x1 md_dummy *= #p md_dummy
scoreboard players operation #x1 md_dummy += #x0 md_dummy
scoreboard players operation #x1 md_dummy += #wtm1 md_dummy
# gap block range gs .. ge (corridor-wide, offset by the wall thickness)
scoreboard players operation #gs md_dummy = #g md_dummy
scoreboard players operation #gs md_dummy *= #p md_dummy
scoreboard players operation #gs md_dummy += #ox md_dummy
scoreboard players operation #gs md_dummy += #wt md_dummy
scoreboard players operation #ge md_dummy = #gs md_dummy
scoreboard players operation #ge md_dummy += #cw md_dummy
scoreboard players remove #ge md_dummy 1
# child 1: x, z, w, k-z
scoreboard players operation #c1h md_dummy = #k md_dummy
scoreboard players operation #c1h md_dummy -= #z md_dummy
# child 2: x, k, w, z+h-k
scoreboard players operation #c2h md_dummy = #z md_dummy
scoreboard players operation #c2h md_dummy += #h md_dummy
scoreboard players operation #c2h md_dummy -= #k md_dummy
# --- store EVERYTHING before recursing ---
execute store result storage maze:div fx0 int 1 run scoreboard players get #x0 md_dummy
execute store result storage maze:div fz0 int 1 run scoreboard players get #wz md_dummy
execute store result storage maze:div fx1 int 1 run scoreboard players get #x1 md_dummy
execute store result storage maze:div fz1 int 1 run scoreboard players get #wz1 md_dummy
execute store result storage maze:div gx0 int 1 run scoreboard players get #gs md_dummy
execute store result storage maze:div gz0 int 1 run scoreboard players get #wz md_dummy
execute store result storage maze:div gx1 int 1 run scoreboard players get #ge md_dummy
execute store result storage maze:div gz1 int 1 run scoreboard players get #wz1 md_dummy
execute store result storage maze:div c1x int 1 run scoreboard players get #x md_dummy
execute store result storage maze:div c1z int 1 run scoreboard players get #z md_dummy
execute store result storage maze:div c1w int 1 run scoreboard players get #w md_dummy
execute store result storage maze:div c1h int 1 run scoreboard players get #c1h md_dummy
execute store result storage maze:div c2x int 1 run scoreboard players get #x md_dummy
execute store result storage maze:div c2z int 1 run scoreboard players get #k md_dummy
execute store result storage maze:div c2w int 1 run scoreboard players get #w md_dummy
execute store result storage maze:div c2h int 1 run scoreboard players get #c2h md_dummy
function mazegen:divide_go with storage maze:div
