execute if score @s mz_custom_wallt matches 5.. run scoreboard players set @s mz_custom_wallt 4
execute if score @s mz_custom_wallt matches 1.. run scoreboard players operation #global mz_wallt = @s mz_custom_wallt
execute if score @s mz_custom_wallt matches 1.. run tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"Wall thickness set to ","color":"green"},{"score":{"name":"#global","objective":"mz_wallt"},"color":"aqua"},{"text":".","color":"gray"}]
scoreboard players set @s mz_custom_wallt 0
scoreboard players enable @s mz_custom_wallt
function mazegen:menu
