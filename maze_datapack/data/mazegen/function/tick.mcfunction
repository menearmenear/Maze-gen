# /trigger polling (custom values typed in chat)
execute as @a[scores={mz_custom_size=1..}] run function mazegen:apply_custom_size
execute as @a[scores={mz_custom_height=1..}] run function mazegen:apply_custom_height
execute as @a[scores={mz_custom_width=1..}] run function mazegen:apply_custom_width
execute as @a[scores={mz_custom_wallh=1..}] run function mazegen:apply_custom_wallh
execute as @a[scores={mz_custom_wallt=1..}] run function mazegen:apply_custom_wallt
# progress first, so the bar always reflects the real state
execute if score #busy md_dummy matches 1 run function mazegen:progress
# build driver: one batch of work every tick while a build or solution is running
execute if score #busy md_dummy matches 1 if score #phase md_dummy matches 0 run function mazegen:build_pos with storage maze:base
execute if score #busy md_dummy matches 1 if score #phase md_dummy matches 0 if score #qi md_dummy >= #qsize md_dummy run function mazegen:finalize_pos with storage maze:base
execute if score #busy md_dummy matches 1 if score #phase md_dummy matches 1 run function mazegen:solve_pos with storage maze:base
execute if score #busy md_dummy matches 1 if score #phase md_dummy matches 1 if score #si md_dummy >= #ssize md_dummy run function mazegen:build_done
