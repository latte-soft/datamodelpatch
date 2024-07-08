local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsPeekViewState);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetItemTryOnPeekViewState);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
return function(v7, v8)
    v7 = v7 or {
        viewState = l_PeekViewState_0.Closed, 
        tryOnViewState = l_PeekViewState_0.Closed, 
        tryOnManagerViewState = l_PeekViewState_0.Closed
    };
    if v8.type == v4.name then
        return (v2.Dictionary.join(v7, {
            viewState = v8.viewState
        }));
    elseif v8.type == v5.name then
        return (v2.Dictionary.join(v7, {
            tryOnViewState = v8.viewState
        }));
    else
        if v8.type == v6.name then
            v7 = v2.Dictionary.join(v7, {
                tryOnManagerViewState = v8.viewState
            });
        end;
        return v7;
    end;
end;
