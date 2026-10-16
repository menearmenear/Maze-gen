# horizontal wall: full thickness in z, chunked along x
data modify storage maze:bf x0 set from storage maze:div fx0
data modify storage maze:bf x1 set from storage maze:div fx1
data modify storage maze:bf z0 set from storage maze:div fz0
data modify storage maze:bf z1 set from storage maze:div fz1
data modify storage maze:bf y0 set value 0
execute store result storage maze:bf y1 int 1 run scoreboard players get #whm1 md_dummy
data modify storage maze:bf tag set value "minecraft:lime_wool"
scoreboard players set #qmode md_dummy 0
scoreboard players set #qbd md_dummy 28000
scoreboard players operation #qbd md_dummy /= #wt md_dummy
scoreboard players operation #qbd md_dummy /= #wh md_dummy
execute if score #qbd md_dummy matches ..0 run scoreboard players set #qbd md_dummy 1
execute store result score #qx1 md_dummy run data get storage maze:div fx1
execute store result score #qcx md_dummy run data get storage maze:div fx0
function mazegen:bfillx
