# roof layer at y = wall height: lime wool (mode 1) or invisible barrier (mode 2); chunked
execute store result storage maze:bf x0 int 1 run scoreboard players get #bx0 md_dummy
execute store result storage maze:bf x1 int 1 run scoreboard players get #bx1 md_dummy
execute store result storage maze:bf z0 int 1 run scoreboard players get #bz0 md_dummy
execute store result storage maze:bf z1 int 1 run scoreboard players get #bz1 md_dummy
execute store result storage maze:bf y0 int 1 run scoreboard players get #wh md_dummy
execute store result storage maze:bf y1 int 1 run scoreboard players get #wh md_dummy
data modify storage maze:bf tag set value "minecraft:lime_wool"
execute if score #global mz_roof matches 2 run data modify storage maze:bf tag set value "minecraft:barrier"
scoreboard players set #qmode md_dummy 0
scoreboard players set #qbd md_dummy 28000
scoreboard players operation #qbd md_dummy /= #fpx md_dummy
execute if score #qbd md_dummy matches ..0 run scoreboard players set #qbd md_dummy 1
execute store result score #qz1 md_dummy run data get storage maze:bf z1
execute store result score #qcz md_dummy run data get storage maze:bf z0
function mazegen:bfill
