#priority 20000
#loader preinit

import scripts.grassUtils.scriptLoaderMessageHandler.Preinit;

static modpackVersion as int = 0;

Preinit.send(0, modpackVersion);