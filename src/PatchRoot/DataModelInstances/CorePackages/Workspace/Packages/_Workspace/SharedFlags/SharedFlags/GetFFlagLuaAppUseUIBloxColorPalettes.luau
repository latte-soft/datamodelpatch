local v0 = require(script.Parent.GetEnableDesignSystemExperiment);
game:DefineFastFlag("LuaAppUseUIBloxColorPalettes1", false);
return function()
    return game:GetFastFlag("LuaAppUseUIBloxColorPalettes1") or v0();
end;
