package dummy

import (
	"android/soong/android"
)

type dummyProperties struct {
        Interfaces []string
}

type dummy struct {
	android.ModuleBase

	properties dummyProperties
}

func init() {
	android.RegisterModuleType("prebuilt_hidl_interfaces", dummyFactory)
}

func dummyFactory() android.Module {
	g := &dummy{}
	g.AddProperties(&g.properties)
	android.InitAndroidModule(g)
	return g
}

func (g *dummy) GenerateAndroidBuildActions(ctx android.ModuleContext) {
	return
}
