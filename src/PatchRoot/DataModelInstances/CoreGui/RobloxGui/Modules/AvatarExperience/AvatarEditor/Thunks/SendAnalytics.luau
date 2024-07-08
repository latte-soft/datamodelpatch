local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Utils);
return function(v1, v2, v3)
    return function(v4)
        v1(v2, v4:getState().AvatarExperience.AvatarEditor.Categories.category, v4:getState().AvatarExperience.AvatarEditor.Categories.subcategory, v3, v0.getUserId(v4:getState()), v4:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId);
    end;
end;
