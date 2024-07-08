local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Analytics.open3DFullView);
local v2 = require(l_Modules_0.AvatarExperience.Common.Analytics.close3DFullView);
local v3 = require(l_Modules_0.AvatarExperience.Common.Analytics.openUIFullView);
local v4 = require(l_Modules_0.AvatarExperience.Common.Analytics.closeUIFullView);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v6 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounter);
local v7 = {};
local v8 = game:DefineFastFlag("EnableAXCameraCounter", false);
v7.get = function(v9)
    local v10 = v5.get(v9);
    return {
        open3DFullView = function(v11)
            v1(v10.EventStream, v11);
        end, 
        close3DFullView = function(v12)
            v2(v10.EventStream, v12);
        end, 
        openUIFullView = function(v13)
            v3(v10.EventStream, v13);
        end, 
        closeUIFullView = function(v14)
            v4(v10.EventStream, v14);
        end, 
        toggleCameraInEditorAndShop = function(v15, v16)
            v10.EventStream:sendEventDeferred("CameraInEditorAndCatalogButton", "CameraInEditorAndCatalogButton_Toggle", {
                actionName = not v15 and "Button Disabled" or "Button Enabled", 
                pageName = v16
            });
            if v8 then
                v6(v10, not v15 and "AXCameraDisabled" or "AXCameraEnabled");
            end;
        end
    };
end;
return v7;
