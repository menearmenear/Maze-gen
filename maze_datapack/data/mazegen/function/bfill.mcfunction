# generic big-fill driver: fills maze:bf {x0,y0,z0,x1,y1,z1,tag} in z-bands of #qbd blocks
# expects: #qcz = z cursor start, #qz1 = z end, #qbd = band depth, #qmode 0=fill / 1=air-replace
scoreboard players operation #qce md_dummy = #qcz md_dummy
scoreboard players operation #qce md_dummy += #qbd md_dummy
scoreboard players remove #qce md_dummy 1
execute if score #qce md_dummy > #qz1 md_dummy run scoreboard players operation #qce md_dummy = #qz1 md_dummy
execute store result storage maze:bf z0a int 1 run scoreboard players get #qcz md_dummy
execute store result storage maze:bf z1a int 1 run scoreboard players get #qce md_dummy
execute if score #qmode md_dummy matches 0 run function mazegen:bfill_band with storage maze:bf
execute if score #qmode md_dummy matches 1 run function mazegen:bfill_band_r with storage maze:bf
scoreboard players operation #qcz md_dummy = #qce md_dummy
scoreboard players add #qcz md_dummy 1
execute if score #qcz md_dummy <= #qz1 md_dummy run function mazegen:bfill
