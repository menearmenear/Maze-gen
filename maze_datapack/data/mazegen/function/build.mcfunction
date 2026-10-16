# entry point: refuses to start while another build is still running
execute if score #busy md_dummy matches 1 run tellraw @s [{"text":"[Maze Gen] ","color":"gold"},{"text":"A build is already running - wait for it to finish.","color":"red"}]
execute if score #busy md_dummy matches 0 run function mazegen:build_setup
