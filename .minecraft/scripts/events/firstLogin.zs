#reloadable

import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.util.Position3f;
import crafttweaker.entity.AttributeModifier;
import mods.zenutils.DataUpdateOperation.MERGE;

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    val player = event.player;
    if (!player.data.deepGetBool("PlayerPersisted.FirstLogin")) {
        player.update(player.data.deepUpdate({PlayerPersisted: {FirstLogin: true}}, MERGE));
        val created = player.world.getCustomWorldData() has "Created";
        player.world.setCustomWorldData(player.world.getCustomWorldData().deepUpdate({Created: true}, MERGE));
        val builder = player.world.catenation()
            .then(function(w, ctx) {
                server.commandManager.executeCommandSilent(server, `/thaumcraft research ${player.name} all`);
                server.commandManager.executeCommandSilent(server, `/astralsorcery research ${player.name} all`);
            })
            .sleep(5)
            .then(function(w, ctx) {
                player.warpNormal = 0;
                player.warpPermanent = 0;
                player.warpTemporary = 0;
                for i in 0 .. 36 {
                    player.replaceItemInInventory(i, null);
                }
                server.commandManager.executeCommandSilent(server, `/tp ${player.name} -138 68 -130`);
                server.commandManager.executeCommandSilent(server, `/spawnpoint ${player.name} -138 68 -130`);
            })
            .then(function(w, ctx) {
                player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(1000000, 1));
                player.getAttribute("generic.maxHealth").applyModifier(AttributeModifier.createModifier("NoHealth", -18.0, 0, "299b5fd4-7f4f-456e-bbd6-a3db8da075e0"));
            });
        if (created) {
            builder.then(function(w, ctx) {
                player.give(<contenttweaker:red_fruit>);
            });
        }
        builder.start();
    }
});