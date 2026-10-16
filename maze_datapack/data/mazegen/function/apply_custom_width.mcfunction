execute if score @s mz_custom_width matches 100001.. run scoreboard players set @s mz_custom_width 100000
execute if score @s mz_custom_width matches 1.. run scoreboard players operation #global mz_width = @s mz_custom_width
execute if score @s mz_custom_width matches 1.. run tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"Custom corridor width set to ","color":"green"},{"score":{"name":"#global","objective":"mz_width"},"color":"aqua"},{"text":".","color":"gray"}]
scoreboard players set @s mz_custom_width 0
scoreboard players enable @s mz_custom_width
function mazegen:menu
