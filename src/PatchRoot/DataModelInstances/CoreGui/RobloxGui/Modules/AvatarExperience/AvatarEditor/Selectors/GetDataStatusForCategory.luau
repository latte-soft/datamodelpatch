local l_CoreGui_0 = game:GetService("CoreGui");
local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v8)
    local v9 = v6.getAvatarEditorCategoryInfoFromState(v8).RenderOutfitItemTiles == true;
    local v10 = v3.selectAssetTypeKey(v8);
    local l_Failed_0 = v5.Failed;
    if v10 then
        if not v9 then
            l_Failed_0 = l_PerformFetch_0.GetStatus(v8, v4.UserInventoryKey .. v10);
        else
            return (l_PerformFetch_0.GetStatus(v8, v4.OutfitsKey .. v10));
        end;
    end;
    return l_Failed_0;
end;
