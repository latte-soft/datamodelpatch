local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = nil;
local v12 = nil;
if l_GuiService_0:IsTenFootInterface() then
    v11 = require(l_Modules_0.Shell.Utility);
    v12 = require(l_Modules_0.Shell.UserData);
end;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GrantAsset);
local v14 = require(l_Modules_0.LuaApp.Actions.SetUserRobux);
local v15 = v4.PureComponent:extend("AXPlatformServiceListener");
v15.init = function(v16)
    v16.consumePurchasedCallback = function(v17, v18)
        local l_networking_0 = v16.props.networking;
        local l_analytics_0 = v16.props.analytics;
        local l_grantAsset_0 = v16.props.grantAsset;
        local l_setUserRobux_0 = v16.props.setUserRobux;
        if v17 == 3 then
            for _, v24 in v18, nil, nil do
                if v24 and v24.Type == "Asset" then
                    l_grantAsset_0(v24.AssetTypeId, v24.AssetId, l_networking_0, l_analytics_0);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                local l_localUserId_0 = v16.props.localUserId;
                if typeof(l_localUserId_0) == "string" and l_localUserId_0 ~= "" then
                    local l_robux_0 = v16.props.robux;
                    v11.ExponentialRepeat(function()
                        return v16.isMounted;
                    end, function()
                        local v27 = v12.GetTotalUserBalanceAsync();
                        if (not (not v27 or not v16.isMounted) and v27 ~= l_robux_0) and v27 ~= nil then
                            l_setUserRobux_0(l_localUserId_0, v27);
                            return true;
                        else
                            return false;
                        end;
                    end);
                end;
            end;
        end;
    end;
end;
v15.didMount = function(v28)
    v28.isMounted = true;
end;
v15.willUnmount = function(v29)
    v29.isMounted = false;
end;
v15.render = function(v30)
    if v3 then
        return v4.createElement(l_ExternalEventConnection_0, {
            event = v3.ConsumePurchased, 
            callback = v30.consumePurchasedCallback
        });
    else
        return nil;
    end;
end;
return v5.connect(function(v31)
    return {
        localUserId = v31.LocalUserId, 
        robux = v31.UserRobux[v31.LocalUserId]
    };
end, function(v32)
    return {
        setUserRobux = function(v33, v34)
            return v32(v14(v33, v34));
        end, 
        grantAsset = function(v35, v36, v37, v38)
            return v32(v13(v35, v36, v37, v38));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v10, 
    analytics = v8
})(v15)));
