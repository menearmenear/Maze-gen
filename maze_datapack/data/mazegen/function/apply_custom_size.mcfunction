execute if score @s mz_custom_size matches 1..7 run scoreboard players set @s mz_custom_size 8
execute if score @s mz_custom_size matches 100001.. run scoreboard players set @s mz_custom_size 100000
execute if score @s mz_custom_size matches 1.. run scoreboard players operation #global mz_size = @s mz_custom_size
execute if score @s mz_custom_size matches 1.. run scoreboard players set #global mz_level 0
execute if score @s mz_custom_size matches 1.. run tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"Maze width (X) set to ","color":"green"},{"score":{"name":"#global","objective":"mz_size"},"color":"aqua"},{"text":".","color":"gray"}]
scoreboard players set @s mz_custom_size 0
scoreboard players enable @s mz_custom_size
function mazegen:menu
