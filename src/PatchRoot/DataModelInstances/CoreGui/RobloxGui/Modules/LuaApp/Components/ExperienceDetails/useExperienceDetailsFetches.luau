local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Games.FetchGameDetailsPageData);
return function()
    local v4 = l_useDispatch_0();
    return (v2.useMemo(function()
        return {
            fetchGameDetailsPageData = function(v5, v6, v7)
                return v4(v3(v5, v6, v7));
            end
        };
    end, {
        v4
    }));
end;
