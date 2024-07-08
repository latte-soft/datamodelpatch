local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPage);
game:DefineFastFlag("LuaAppMobileMoreTilesPerRowIXP", false);
return {
    mobileShowMoreTilesPerRowIXPEnabled = function()
        return game:GetFastFlag("LuaAppMobileMoreTilesPerRowIXP");
    end, 
    shouldHideGameStats = function(v1, v2)
        if not (v1 and (not (v1 ~= v0.Home and v1 ~= v0.Games) or v1 == v0.GamesList)) or not v2 then
            return false;
        else
            return true;
        end;
    end
};
