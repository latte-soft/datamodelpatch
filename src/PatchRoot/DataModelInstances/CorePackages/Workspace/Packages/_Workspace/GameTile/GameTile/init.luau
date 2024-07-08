local _ = require(script.GameTileTypes);
local v1 = game:DefineFastFlag("LuaAppGameTileOTA2", false);
local v2 = game:DefineFastFlag("DisableDiscoveryOtaPackages", false);
if not v1 or not game:GetEngineFeature("RegisterPatchFix") then
    return require(script.starter);
else
    local l_requirePackage_0 = require(script.Parent.DiscoveryOtaPatch).requirePackage;
    if not v2 then
        return l_requirePackage_0("GameTile", script.starter, script.otaValidator, "gameTileOtaValidator");
    else
        return require(script.starter);
    end;
end;
