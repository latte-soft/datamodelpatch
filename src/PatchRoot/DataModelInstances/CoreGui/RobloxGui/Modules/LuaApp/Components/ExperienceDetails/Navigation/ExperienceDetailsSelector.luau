local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Dash);
local l_useDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceType;
local l_DeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceType;
local v6 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsPeekView);
local v7 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsContainer);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local function v10(v9)
    return v2.createElement(v6, v9);
end;
local function v12(v11)
    return v2.createElement(v7, v11);
end;
return function(v13)
    v13 = v3.join(v13, (l_useNavigationProps_0(function(v14, v15)
        if v14 ~= nil then
            return {
                universeId = v14, 
                source = v15.source, 
                index = v15.index, 
                onClose = v15.onClose, 
                mountAsFullView = v15.mountAsFullView, 
                mountAnimation = v15.mountAnimation, 
                referralSource = v15.referralSource, 
                onPeekViewClosed = v15.onPeekViewClosed, 
                showBackButton = v15.showBackButton
            };
        else
            return nil;
        end;
    end)));
    local v16 = if not v13.deviceType then l_useDeviceType_0() else v13.deviceType;
    if v16 == l_DeviceType_0.Phone then
        return v10(v13);
    else
        return v12((v3.join(v13, {
            deviceType = v16
        })));
    end;
end;
