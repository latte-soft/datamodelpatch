local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v3 = require(l_ShareGame_0.Actions.SetGameInfoCreated);
return function(v4, v5)
    v4 = v4 or {
        Created = nil
    };
    if v5.type == v3.name then
        v4 = l_Immutable_0.Set(v4, "Created", v5.Created);
    end;
    return v4;
end;
