# picks tag #qci from maze:clear list, runs one chunked clearing pass, then advances
execute store result storage maze:ci i int 1 run scoreboard players get #qci md_dummy
function mazegen:clear_pick with storage maze:ci
execute store result score #qcz md_dummy run data get storage maze:clear z0
function mazegen:bfill
scoreboard players add #qci md_dummy 1
execute if score #qci md_dummy matches ..6 run function mazegen:clear_pass
