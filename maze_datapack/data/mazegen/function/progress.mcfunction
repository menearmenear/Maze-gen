# actionbar progress while a build/solution is running (phase 0 = walls, 1 = path)
scoreboard players set #pct md_dummy 0
execute if score #phase md_dummy matches 0 if score #qsize md_dummy matches 1.. run scoreboard players operation #pct md_dummy = #qi md_dummy
execute if score #phase md_dummy matches 0 if score #qsize md_dummy matches 1.. run scoreboard players operation #pct md_dummy *= #hundred md_dummy
execute if score #phase md_dummy matches 0 if score #qsize md_dummy matches 1.. run scoreboard players operation #pct md_dummy /= #qsize md_dummy
execute if score #phase md_dummy matches 1 if score #ssize md_dummy matches 1.. run scoreboard players operation #pct md_dummy = #si md_dummy
execute if score #phase md_dummy matches 1 if score #ssize md_dummy matches 1.. run scoreboard players operation #pct md_dummy *= #hundred md_dummy
execute if score #phase md_dummy matches 1 if score #ssize md_dummy matches 1.. run scoreboard players operation #pct md_dummy /= #ssize md_dummy
execute if score #phase md_dummy matches 0 run title @a actionbar ["",{"text":"[Maze Gen] ","color":"gold"},{"text":"Building walls... ","color":"yellow"},{"score":{"name":"#pct","objective":"md_dummy"},"color":"white"},{"text":"%","color":"gray"}]
execute if score #phase md_dummy matches 1 run title @a actionbar ["",{"text":"[Maze Gen] ","color":"gold"},{"text":"Drawing solution... ","color":"green"},{"score":{"name":"#pct","objective":"md_dummy"},"color":"white"},{"text":"%","color":"gray"}]
