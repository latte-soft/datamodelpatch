local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Utils);
return function(v4)
    return function(v5)
        local v6 = nil;
        local v7 = nil;
        local l_EntryPage_0 = v5:getState().AvatarExperience.LayeredClothingSort.EntryPage;
        if l_EntryPage_0 == v1.AvatarEditor then
            v6 = v5:getState().AvatarExperience.AvatarEditor.Categories.category;
            v7 = "avatarEditor";
        elseif not (l_EntryPage_0 ~= v1.Catalog) or l_EntryPage_0 == v1.CatalogSearch then
            v6 = v5:getState().AvatarExperience.Catalog.Categories.category;
            v7 = v2.AnalyticsContext.AvatarShop;
        else
            return ;
        end;
        v4(v7, v3.getUserId(v5:getState()), v6);
    end;
end;
