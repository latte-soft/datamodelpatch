local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v7 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseComplete);
local v8 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseCompleteDEP);
local v9 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = v4.PureComponent:extend("MarketplaceServiceEventReciever");
v12.render = function(v13)
    if not game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
        return v4.createElement(v6, {
            event = l_MarketplaceService_0.NativePurchaseFinished, 
            callback = function(v14, v15, v16)
                v13.props.nativePurchaseFinishedWithNetwork(v13.props.networking, v14, v15, v16);
            end
        });
    else
        return v4.createFragment({
            v4.createElement(v6, {
                event = l_MarketplaceService_0.NativePurchaseFinishedWithLocalPlayer, 
                callback = function(v17, v18)
                    v13.props.nativePurchaseFinishedWithLocalPlayer(v13.props.networking, v17, v18);
                end
            }), 
            v4.createElement(v6, {
                event = l_MarketplaceService_0.NativePurchaseFinished, 
                callback = function(v19, v20, v21)
                    v13.props.nativePurchaseFinishedWithNetwork(v13.props.networking, v19, v20, v21);
                end
            })
        });
    end;
end;
return v5.connect(nil, function(v22)
    return {
        nativePurchaseFinished = function(_, v24, v25)
            return v22(v8(v24, v25));
        end, 
        nativePurchaseFinishedWithNetwork = function(v26, _, v28, v29)
            return v22(v7(v26, v28, if not v29 then v9.Failed else v9.Success));
        end, 
        nativePurchaseFinishedWithLocalPlayer = function(v30, v31, v32)
            return v22(v7(v30, v31, if not v32 then v9.Failed else v9.Success));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v10
})(v12)));
