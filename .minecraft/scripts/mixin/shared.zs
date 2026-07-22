#loader mixin
#priority 1024

import native.vazkii.botania.api.subtile.SubTileGenerating;

zenClass Op {
    static trackMana as function(string,int,SubTileGenerating)void = null;
}