# removes every block type the generator can place, big area chunked in z-bands
data modify storage maze:bf x0 set from storage maze:clear x0
data modify storage maze:bf z0 set from storage maze:clear z0
data modify storage maze:bf x1 set from storage maze:clear x1
data modify storage maze:bf z1 set from storage maze:clear z1
data modify storage maze:bf y0 set value -1
data modify storage maze:bf y1 set value 5
scoreboard players set #qmode md_dummy 1
execute store result score #qxt md_dummy run data get storage maze:clear x0
execute store result score #qxw md_dummy run data get storage maze:clear x1
scoreboard players operation #qxw md_dummy -= #qxt md_dummy
scoreboard players add #qxw md_dummy 1
scoreboard players set #qbd md_dummy 4000
scoreboard players operation #qbd md_dummy /= #qxw md_dummy
execute if score #qbd md_dummy matches ..0 run scoreboard players set #qbd md_dummy 1
execute store result score #qz1 md_dummy run data get storage maze:clear z1
data modify storage maze:clear list set value ["minecraft:red_wool","minecraft:yellow_wool","minecraft:lime_wool","minecraft:green_wool","minecraft:glowstone","minecraft:sand","minecraft:barrier"]
scoreboard players set #qci md_dummy 0
function mazegen:clear_pass
