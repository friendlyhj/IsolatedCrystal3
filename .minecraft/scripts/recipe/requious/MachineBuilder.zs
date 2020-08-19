#priority 200
#norun
import mods.requious.ComponentFace;
import mods.requious.SlotVisual;
import mods.requious.Assembly;

static chlorinizer as Assembly = <assembly:chlorinizer>;
static arrowRight as SlotVisual = SlotVisual.createSimple("requious:textures/gui/assembly_gauges.png", 0, 8);

chlorinizer.setItemSlot(2, 2, ComponentFace.up(), 64).setAccess(true, false).setGroup("input");
chlorinizer.setFluidSlot(3, 2, ComponentFace.side(), 3000).setAccess(true, false).setGroup("cl");
chlorinizer.setEnergySlot(0, 2, ComponentFace.all(), 100000).setAccess(true, false).setGroup("energy");
chlorinizer.setFluidSlot(5, 2, ComponentFace.all(), 3000).setAccess(false, true).setGroup("output").pushFluid(200);
chlorinizer.setJEIItemSlot(2, 2, "input");
chlorinizer.setJEIEnergySlot(0, 2, "energy");
chlorinizer.setJEIFluidSlot(5, 2, "output");
chlorinizer.setJEIFluidSlot(3, 2, "cl");
chlorinizer.setJEIDurationSlot(4, 2, "time", arrowRight);
chlorinizer.setDurationSlot(4, 2).setGroup("time").setVisual(arrowRight);