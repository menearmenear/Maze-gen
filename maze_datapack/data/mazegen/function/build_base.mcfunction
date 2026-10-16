# clears interior air, lays the red floor, draws the outer walls (thickness/height from the menu)
# big areas are chunked because a single fill command has a size limit
# --- air clear: y 0..wh+1 ---
execute store result storage maze:bf x0 int 1 run scoreboard players get #bx0 md_dummy
execute store result storage maze:bf x1 int 1 run scoreboard players get #bx1 md_dummy
execute store result storage maze:bf z0 int 1 run scoreboard players get #bz0 md_dummy
execute store result storage maze:bf z1 int 1 run scoreboard players get #bz1 md_dummy
data modify storage maze:bf y0 set value 0
scoreboard players operation #qy2 md_dummy = #wh md_dummy
scoreboard players add #qy2 md_dummy 1
execute store result storage maze:bf y1 int 1 run scoreboard players get #qy2 md_dummy
data modify storage maze:bf tag set value "minecraft:air"
scoreboard players set #qmode md_dummy 0
scoreboard players set #qbd md_dummy 28000
scoreboard players operation #qbd md_dummy /= #fpx md_dummy
scoreboard players operation #qbd md_dummy /= #qy2 md_dummy
execute if score #qbd md_dummy matches ..0 run scoreboard players set #qbd md_dummy 1
execute store result score #qz1 md_dummy run data get storage maze:bf z1
execute store result score #qcz md_dummy run data get storage maze:bf z0
function mazegen:bfill
# --- red floor: y -1 ---
data modify storage maze:bf y0 set value -1
data modify storage maze:bf y1 set value -1
data modify storage maze:bf tag set value "minecraft:red_wool"
scoreboard players set #qbd md_dummy 28000
scoreboard players operation #qbd md_dummy /= #fpx md_dummy
execute if score #qbd md_dummy matches ..0 run scoreboard players set #qbd md_dummy 1
execute store result score #qcz md_dummy run data get storage maze:bf z0
function mazegen:bfill
# --- outer walls: y 0..wh-1, thickness wt ---
data modify storage maze:bf y0 set value 0
scoreboard players operation #qy1 md_dummy = #wh md_dummy
scoreboard players remove #qy1 md_dummy 1
execute store result storage maze:bf y1 int 1 run scoreboard players get #qy1 md_dummy
data modify storage maze:bf tag set value "minecraft:lime_wool"
scoreboard players set #qbd md_dummy 28000
scoreboard players operation #qbd md_dummy /= #wt md_dummy
scoreboard players operation #qbd md_dummy /= #wh md_dummy
execute if score #qbd md_dummy matches ..0 run scoreboard players set #qbd md_dummy 1
# north strip: z0..z0+t-1, banded along x
scoreboard players operation #qz1 md_dummy = #bz0 md_dummy
scoreboard players operation #qz1 md_dummy += #wtm1 md_dummy
execute store result storage maze:bf z1 int 1 run scoreboard players get #qz1 md_dummy
scoreboard players operation #qcx md_dummy = #bx0 md_dummy
scoreboard players operation #qx1 md_dummy = #bx1 md_dummy
function mazegen:bfillx
# south strip: z1-t+1..z1, banded along x
scoreboard players operation #qce md_dummy = #bz1 md_dummy
scoreboard players operation #qce md_dummy -= #wtm1 md_dummy
execute store result storage maze:bf z0 int 1 run scoreboard players get #qce md_dummy
execute store result storage maze:bf z1 int 1 run scoreboard players get #bz1 md_dummy
function mazegen:bfillx
# west strip: x0..x0+t-1, banded along z
scoreboard players operation #qce md_dummy = #bx0 md_dummy
scoreboard players operation #qce md_dummy += #wtm1 md_dummy
execute store result storage maze:bf x1 int 1 run scoreboard players get #qce md_dummy
execute store result storage maze:bf x0 int 1 run scoreboard players get #bx0 md_dummy
execute store result storage maze:bf z0 int 1 run scoreboard players get #bz0 md_dummy
execute store result storage maze:bf z1 int 1 run scoreboard players get #bz1 md_dummy
scoreboard players operation #qz1 md_dummy = #bz1 md_dummy
scoreboard players operation #qcz md_dummy = #bz0 md_dummy
function mazegen:bfill
# east strip: x1-t+1..x1, banded along z
scoreboard players operation #qce md_dummy = #bx1 md_dummy
scoreboard players operation #qce md_dummy -= #wtm1 md_dummy
execute store result storage maze:bf x0 int 1 run scoreboard players get #qce md_dummy
execute store result storage maze:bf x1 int 1 run scoreboard players get #bx1 md_dummy
scoreboard players operation #qcz md_dummy = #bz0 md_dummy
function mazegen:bfill
