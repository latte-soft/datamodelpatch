local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v4 = require(l_Modules_0.LuaApp.Actions.Games.SetGameDetailsPeekViewState);
return function(v5, v6)
    v5 = v5 or {
        viewState = l_PeekViewState_0.Closed
    };
    if v6.type == v4.name then
        v5 = v2.Dictionary.join(v5, {
            viewState = v6.viewState
        });
    end;
    return v5;
end;
