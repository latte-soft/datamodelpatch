local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_EventHub_0 = require(l_Modules_0:FindFirstChild("Shell"):FindFirstChild("EventHub"));
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseComplete);
local v8 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v9 = v3.PureComponent:extend("AvatarExperiencePurchaseEventListener");
v9.init = function(v10)
    v10.handleNativePurchase = function(v11, v12)
        v10.props.nativePurchaseComplete(v10.props.networking, v12, if v11 == 0 then v8.Success else v8.Failed);
    end;
end;
v9.didMount = function(v13)
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.RobuxCatalogPurchaseInitiated, "robuxPurchaseListener", v13.handleNativePurchase);
end;
v9.willUnmount = function(_)
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.RobuxCatalogPurchaseInitiated, "robuxPurchaseListener");
end;
v9.render = function(_)
    return v3.createFragment({});
end;
return (l_RoactServices_0.connect({
    networking = v6
})((v4.connect(function(_, _)
    return {};
end, function(v18)
    return {
        nativePurchaseComplete = function(v19, v20, v21)
            return v18(v7(v19, v20, v21));
        end
    };
end)(v9))));
