# processes one build-queue item: idx comes from storage maze:cur
$function mazegen:item_load with storage maze:q items[$(idx)]
scoreboard players add #qi md_dummy 1
