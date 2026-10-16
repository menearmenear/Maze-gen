# queue drained: gates, roof, then solution (or straight to done)
function mazegen:build_gates with storage maze:build
execute if score #global mz_roof matches 1.. run function mazegen:build_roof with storage maze:build
execute if score #solvemode md_dummy matches 1 run function mazegen:solve_start
execute if score #solvemode md_dummy matches 0 run function mazegen:build_done
