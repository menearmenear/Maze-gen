# horizontal wall: needs h>=2 (wall positions = h-1) and a gap range gr = w cells
scoreboard players operation #wm1 md_dummy = #w md_dummy
scoreboard players remove #wm1 md_dummy 1
scoreboard players operation #hm1 md_dummy = #h md_dummy
scoreboard players remove #hm1 md_dummy 1
scoreboard players operation #gr md_dummy = #w md_dummy
execute if score #hm1 md_dummy matches ..0 run function mazegen:divide_fail
execute if score #gr md_dummy matches ..0 run function mazegen:divide_fail
execute if score #hm1 md_dummy matches 1.. if score #gr md_dummy matches 1.. run function mazegen:divide_horizontal_calc
