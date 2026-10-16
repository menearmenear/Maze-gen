# initialises the solution walker: division-tree root 0, from far corner of cells X to cells Z
scoreboard players set #phase md_dummy 1
scoreboard players set #si md_dummy 0
scoreboard players set #ssize md_dummy 0
execute store result storage maze:s v int 1 run scoreboard players get #zero md_dummy
data modify storage maze:s items set value []
scoreboard players operation #t md_dummy = #cells md_dummy
scoreboard players remove #t md_dummy 1
scoreboard players operation #t2 md_dummy = #cellz md_dummy
scoreboard players remove #t2 md_dummy 1
execute store result storage maze:tmp2 t int 1 run scoreboard players get #t md_dummy
execute store result storage maze:tmp2 tz int 1 run scoreboard players get #t2 md_dummy
function mazegen:push_root_solve with storage maze:tmp2
function mazegen:green_gates with storage maze:build
scoreboard players set #ssize md_dummy 1
