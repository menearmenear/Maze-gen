# Scoreboards
scoreboard objectives add mz_size dummy
scoreboard objectives add mz_height dummy
scoreboard objectives add mz_level dummy
scoreboard objectives add mz_width dummy
scoreboard objectives add mz_roof dummy
scoreboard objectives add mz_solution dummy
scoreboard objectives add mz_wallh dummy
scoreboard objectives add mz_wallt dummy
scoreboard objectives add mz_custom_size trigger
scoreboard objectives add mz_custom_height trigger
scoreboard objectives add mz_custom_width trigger
scoreboard objectives add mz_custom_wallh trigger
scoreboard objectives add mz_custom_wallt trigger
scoreboard objectives add md_dummy dummy
# Defaults (kept across /reload)
execute unless score #global mz_size matches 8..100000 run scoreboard players set #global mz_size 32
execute unless score #global mz_height matches 8..100000 run scoreboard players set #global mz_height 32
execute unless score #global mz_level matches 0..3 run scoreboard players set #global mz_level 2
execute unless score #global mz_width matches 1..100000 run scoreboard players set #global mz_width 1
execute unless score #global mz_roof matches 0..2 run scoreboard players set #global mz_roof 1
execute unless score #global mz_solution matches 0..1 run scoreboard players set #global mz_solution 1
execute unless score #global mz_wallh matches 1..16 run scoreboard players set #global mz_wallh 3
execute unless score #global mz_wallt matches 1..4 run scoreboard players set #global mz_wallt 1
# Constants (never modified at runtime)
scoreboard players set #zero md_dummy 0
scoreboard players set #one md_dummy 1
scoreboard players set #c2 md_dummy 2
scoreboard players set #min md_dummy 2
scoreboard players set #hundred md_dummy 100
scoreboard players set #ox md_dummy 2
scoreboard players set #oz md_dummy 2
# Counters / build state
scoreboard players set #divs md_dummy 0
scoreboard players set #fails md_dummy 0
scoreboard players set #nodes md_dummy 0
scoreboard players set #qi md_dummy 0
scoreboard players set #qsize md_dummy 0
scoreboard players set #si md_dummy 0
scoreboard players set #ssize md_dummy 0
scoreboard players set #busy md_dummy 0
scoreboard players set #solvemode md_dummy 0
scoreboard players set #phase md_dummy 0
scoreboard players set #pct md_dummy 0
# let everyone use the /trigger interface straight away
scoreboard players enable @a mz_custom_size
scoreboard players enable @a mz_custom_height
scoreboard players enable @a mz_custom_width
scoreboard players enable @a mz_custom_wallh
scoreboard players enable @a mz_custom_wallt
tellraw @a ["",{"text":"[Maze Gen] ","color":"gold","bold":true},{"text":"v3.1","color":"light_purple"},{"text":" by ","color":"dark_gray"},{"text":"Near","color":"light_purple"},{"text":" — loaded. ","color":"aqua"},{"text":"Type ","color":"gray"},{"text":"/function mazegen","color":"green"},{"text":" or ","color":"gray"},{"text":"[OPEN MENU]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function mazegen:menu"},"hover_event":{"action":"show_text","value":"Open the maze menu"}}]
