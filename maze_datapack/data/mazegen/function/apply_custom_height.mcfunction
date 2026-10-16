execute if score @s mz_custom_height matches 1..7 run scoreboard players set @s mz_custom_height 8
execute if score @s mz_custom_height matches 100001.. run scoreboard players set @s mz_custom_height 100000
execute if score @s mz_custom_height matches 1.. run scoreboard players operation #global mz_height = @s mz_custom_height
execute if score @s mz_custom_height matches 1.. run tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"Custom maze height (Z) set to ","color":"green"},{"score":{"name":"#global","objective":"mz_height"},"color":"aqua"},{"text":".","color":"gray"}]
scoreboard players set @s mz_custom_height 0
scoreboard players enable @s mz_custom_height
function mazegen:menu
