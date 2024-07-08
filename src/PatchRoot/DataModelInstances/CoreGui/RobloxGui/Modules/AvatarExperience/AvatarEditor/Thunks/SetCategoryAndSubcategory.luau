local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
return function(v5, v6, v7)
    return function(v8)
        v8:dispatch(v1(v5, v6));
        local l_category_0 = v8:getState().AvatarExperience.AvatarEditor.Categories.category;
        v7.clickNavigationTab(l_category_0, v8:getState().AvatarExperience.AvatarEditor.Categories.subcategory);
        if v5 then
            local v10 = v4.getUserId(v8:getState());
            if v2()[l_category_0].Name == v3.AssetCategories.Emotes then
                v7.openedEmotesPage(v10);
            end;
        end;
    end;
end;
