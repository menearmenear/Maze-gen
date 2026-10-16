execute if score @s mz_custom_wallh matches 1 run scoreboard players set @s mz_custom_wallh 2
execute if score @s mz_custom_wallh matches 17.. run scoreboard players set @s mz_custom_wallh 16
execute if score @s mz_custom_wallh matches 1.. run scoreboard players operation #global mz_wallh = @s mz_custom_wallh
execute if score @s mz_custom_wallh matches 1.. run tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"Wall height set to ","color":"green"},{"score":{"name":"#global","objective":"mz_wallh"},"color":"aqua"},{"text":".","color":"gray"}]
scoreboard players set @s mz_custom_wallh 0
scoreboard players enable @s mz_custom_wallh
function mazegen:menu
