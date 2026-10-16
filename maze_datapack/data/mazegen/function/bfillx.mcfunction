# same as bfill but bands along x (for long thin strips like walls)
# expects: #qcx = x cursor start, #qx1 = x end, #qbd = band length
scoreboard players operation #qce md_dummy = #qcx md_dummy
scoreboard players operation #qce md_dummy += #qbd md_dummy
scoreboard players remove #qce md_dummy 1
execute if score #qce md_dummy > #qx1 md_dummy run scoreboard players operation #qce md_dummy = #qx1 md_dummy
execute store result storage maze:bf x0a int 1 run scoreboard players get #qcx md_dummy
execute store result storage maze:bf x1a int 1 run scoreboard players get #qce md_dummy
function mazegen:bfill_band_x with storage maze:bf
scoreboard players operation #qcx md_dummy = #qce md_dummy
scoreboard players add #qcx md_dummy 1
execute if score #qcx md_dummy <= #qx1 md_dummy run function mazegen:bfillx
