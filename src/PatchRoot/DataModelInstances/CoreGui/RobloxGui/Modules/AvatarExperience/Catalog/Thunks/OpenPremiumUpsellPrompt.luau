local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendPremiumUpsellCancelledAnalytics);
local v7 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v8 = require(l_Modules_0.LuaApp.Components.PremiumUpsell.Enum.PremiumUpsellTriggerContext);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
return function(_, v13, v14, v15, v16, v17, v18)
    v1.isTypeOrNil(v17, "string", "OpenPremiumUpsellPrompt expects itemId");
    v1.isTypeOrNil(v18, "string", "OpenPremiumUpsellPrompt expects itemType");
    return function(v19)
        local v20 = v19:getState();
        local v21 = nil;
        local v22 = nil;
        if not v16 then
            if not v11 then
                v21 = v4(v20.AvatarExperience.Common, v17, v18).id;
                v22 = v18 == v5.ItemType.Bundle;
            else
                v21 = v17;
                v22 = v18 == v5.ItemType.Bundle;
            end;
        else
            v21 = v16.assetId;
            v22 = v16.isBundle;
        end;
        v19:dispatch(v7(function()
            v15.navigate(v3.PremiumUpsellPrompt, {
                onCancel = function()
                    v19:dispatch(v6(v13.premiumUpsellCancelled, v21, v22));
                end, 
                onOverlayClosed = v14, 
                triggerContext = v8.UACatalog
            });
        end));
    end;
end;
