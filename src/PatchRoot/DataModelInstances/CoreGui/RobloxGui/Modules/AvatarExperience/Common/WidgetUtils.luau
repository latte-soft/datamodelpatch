local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
return {
    getEntryButtonWidgetActivationFunc = function(v3, v4, v5)
        if v3 == v2.Types.ProfilePictureEditorWidget then
            return function()
                v4.navigate(v1.ProfilePictureEditorEmotes, {
                    prevNavPage = v1.Catalog, 
                    prevNavHistory = v5
                });
            end;
        else
            return nil;
        end;
    end
};
