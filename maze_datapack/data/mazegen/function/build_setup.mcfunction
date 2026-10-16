# context: execute as @s at @s anchored feet
tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"Building maze...","color":"gray"}]
# wall options (height / thickness)
scoreboard players operation #wh md_dummy = #global mz_wallh
scoreboard players operation #wt md_dummy = #global mz_wallt
scoreboard players operation #whm1 md_dummy = #wh md_dummy
scoreboard players remove #whm1 md_dummy 1
scoreboard players operation #wtm1 md_dummy = #wt md_dummy
scoreboard players remove #wtm1 md_dummy 1
# derived geometry: pitch p = corridor width + wall thickness
scoreboard players operation #cw md_dummy = #global mz_width
scoreboard players operation #p md_dummy = #cw md_dummy
scoreboard players operation #p md_dummy += #wt md_dummy
# cells X = (size X - t) / p ; cells Z = (size Z - t) / p
scoreboard players operation #cells md_dummy = #global mz_size
scoreboard players operation #cells md_dummy -= #wt md_dummy
scoreboard players operation #cells md_dummy /= #p md_dummy
execute if score #cells md_dummy matches ..0 run scoreboard players set #cells md_dummy 1
scoreboard players operation #cellz md_dummy = #global mz_height
scoreboard players operation #cellz md_dummy -= #wt md_dummy
scoreboard players operation #cellz md_dummy /= #p md_dummy
execute if score #cellz md_dummy matches ..0 run scoreboard players set #cellz md_dummy 1
# footprints in blocks: fp = cells*p + t
scoreboard players operation #fpx md_dummy = #cells md_dummy
scoreboard players operation #fpx md_dummy *= #p md_dummy
scoreboard players operation #fpx md_dummy += #wt md_dummy
scoreboard players operation #fpz md_dummy = #cellz md_dummy
scoreboard players operation #fpz md_dummy *= #p md_dummy
scoreboard players operation #fpz md_dummy += #wt md_dummy
# lock solution behaviour for the whole build
scoreboard players operation #solvemode md_dummy = #global mz_solution
# mark busy right away so the tick driver + menu reflect this run no matter what
scoreboard players set #busy md_dummy 1
scoreboard players set #phase md_dummy 0
# counters + queue state
scoreboard players set #divs md_dummy 0
scoreboard players set #fails md_dummy 0
scoreboard players set #nodes md_dummy 0
scoreboard players set #qi md_dummy 0
scoreboard players set #qsize md_dummy 0
scoreboard players set #si md_dummy 0
scoreboard players set #ssize md_dummy 0
# block bounds (relative to feet): x0/z0 = origin offset, x1/z1 = far corner
scoreboard players operation #bx0 md_dummy = #ox md_dummy
scoreboard players operation #bz0 md_dummy = #oz md_dummy
scoreboard players operation #bx1 md_dummy = #bx0 md_dummy
scoreboard players operation #bx1 md_dummy += #fpx md_dummy
scoreboard players remove #bx1 md_dummy 1
scoreboard players operation #bz1 md_dummy = #bz0 md_dummy
scoreboard players operation #bz1 md_dummy += #fpz md_dummy
scoreboard players remove #bz1 md_dummy 1
# start cell interior (x0+t .. x0+t+cw-1)
scoreboard players operation #bsx0 md_dummy = #bx0 md_dummy
scoreboard players operation #bsx0 md_dummy += #wt md_dummy
scoreboard players operation #bsx1 md_dummy = #bsx0 md_dummy
scoreboard players operation #bsx1 md_dummy += #cw md_dummy
scoreboard players remove #bsx1 md_dummy 1
scoreboard players operation #bsz0 md_dummy = #bz0 md_dummy
scoreboard players operation #bsz0 md_dummy += #wt md_dummy
scoreboard players operation #bsz1 md_dummy = #bsz0 md_dummy
scoreboard players operation #bsz1 md_dummy += #cw md_dummy
scoreboard players remove #bsz1 md_dummy 1
# end cell interior (x1-t-cw+1 .. x1-t)
scoreboard players operation #bex1 md_dummy = #bx1 md_dummy
scoreboard players operation #bex1 md_dummy -= #wt md_dummy
scoreboard players operation #bex0 md_dummy = #bex1 md_dummy
scoreboard players operation #bex0 md_dummy -= #cw md_dummy
scoreboard players add #bex0 md_dummy 1
scoreboard players operation #bez1 md_dummy = #bz1 md_dummy
scoreboard players operation #bez1 md_dummy -= #wt md_dummy
scoreboard players operation #bez0 md_dummy = #bez1 md_dummy
scoreboard players operation #bez0 md_dummy -= #cw md_dummy
scoreboard players add #bez0 md_dummy 1
# store for macro functions
execute store result storage maze:build x0 int 1 run scoreboard players get #bx0 md_dummy
execute store result storage maze:build z0 int 1 run scoreboard players get #bz0 md_dummy
execute store result storage maze:build x1 int 1 run scoreboard players get #bx1 md_dummy
execute store result storage maze:build z1 int 1 run scoreboard players get #bz1 md_dummy
execute store result storage maze:build sx0 int 1 run scoreboard players get #bsx0 md_dummy
execute store result storage maze:build sx1 int 1 run scoreboard players get #bsx1 md_dummy
execute store result storage maze:build sz0 int 1 run scoreboard players get #bsz0 md_dummy
execute store result storage maze:build sz1 int 1 run scoreboard players get #bsz1 md_dummy
execute store result storage maze:build ex0 int 1 run scoreboard players get #bex0 md_dummy
execute store result storage maze:build ex1 int 1 run scoreboard players get #bex1 md_dummy
execute store result storage maze:build ez0 int 1 run scoreboard players get #bez0 md_dummy
execute store result storage maze:build ez1 int 1 run scoreboard players get #bez1 md_dummy
# doorway edges span the full wall thickness; whm1 lets the wall macros reach the wall top
scoreboard players operation #qce md_dummy = #bx0 md_dummy
scoreboard players operation #qce md_dummy += #wtm1 md_dummy
execute store result storage maze:build x0w int 1 run scoreboard players get #qce md_dummy
scoreboard players operation #qce md_dummy = #bx1 md_dummy
scoreboard players operation #qce md_dummy -= #wtm1 md_dummy
execute store result storage maze:build x1w int 1 run scoreboard players get #qce md_dummy
execute store result storage maze:build whm1 int 1 run scoreboard players get #whm1 md_dummy
execute store result storage maze:div whm1 int 1 run scoreboard players get #whm1 md_dummy
# absolute origin + dimension so tick-spread work can rebuild the execution context
tag @a remove mz_builder
tag @s add mz_builder
execute store result storage maze:base bx double 1 run data get entity @s Pos[0]
execute store result storage maze:base by double 1 run data get entity @s Pos[1]
execute store result storage maze:base bz double 1 run data get entity @s Pos[2]
data modify storage maze:base dim set value "minecraft:overworld"
execute if dimension minecraft:the_nether run data modify storage maze:base dim set value "minecraft:the_nether"
execute if dimension minecraft:the_end run data modify storage maze:base dim set value "minecraft:the_end"
# volume: air clear + red floor + outer walls (chunked inside build_base)
function mazegen:build_base
# work queue: root region in cell units
execute store result storage maze:q v int 1 run scoreboard players get #zero md_dummy
execute store result storage maze:tree v int 1 run scoreboard players get #zero md_dummy
execute store result storage maze:s v int 1 run scoreboard players get #zero md_dummy
data modify storage maze:q items set value []
data modify storage maze:tree nodes set value []
data modify storage maze:s items set value []
execute store result storage maze:tmp c int 1 run scoreboard players get #cells md_dummy
execute store result storage maze:tmp cz int 1 run scoreboard players get #cellz md_dummy
function mazegen:push_root with storage maze:tmp
scoreboard players set #qsize md_dummy 1
# mazegen:tick chews the queue - one batch every tick while #busy is 1
