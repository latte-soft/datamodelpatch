local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateOutfit);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v6, v7)
    v4.isType(v7, "string", "GrantOutfit thunk expects networkImpl to be a function");
    return function(v8)
        local v9 = v8:getState().AvatarExperience.AvatarEditor.OutfitInfos[v7];
        local v10 = (not not v9 and v9.updateCounter or 0) + 1;
        v8:dispatch(v2(v7));
        v8:dispatch(v3(v6, v7, v10));
    end;
end;
