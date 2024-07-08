local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetConnectionState);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GrantAsset);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.RevokeAsset);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GrantOutfit);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.UpdateOutfit);
local v14 = v3.PureComponent:extend("EventReceiver");
v14.init = function(v15)
    local l_RobloxEventReceiver_0 = v15.props.RobloxEventReceiver;
    local l_networking_0 = v15.props.networking;
    local l_analytics_0 = v15.props.analytics;
    local l_grantAsset_0 = v15.props.grantAsset;
    local l_revokeAsset_0 = v15.props.revokeAsset;
    local l_grantOutfit_0 = v15.props.grantOutfit;
    local l_revokeCostume_0 = v15.props.revokeCostume;
    local l_updateOutfit_0 = v15.props.updateOutfit;
    local l_setConnectionState_0 = v15.props.setConnectionState;
    v15.tokens = {
        l_RobloxEventReceiver_0:observeEvent("AvatarAssetOwnershipNotifications", function(v25)
            if v25.Type == "Grant" then
                l_grantAsset_0(tostring(v25.AssetTypeId), tostring(v25.AssetId), l_networking_0, l_analytics_0, v15.props.opaquePage);
                return ;
            else
                if v25.Type == "Revoke" then
                    l_revokeAsset_0(v25.AssetTypeId, v25.AssetId);
                end;
                return ;
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("signalR", function(v26)
            l_setConnectionState_0(v26);
        end), 
        l_RobloxEventReceiver_0:observeEvent("AvatarOutfitOwnershipNotifications", function(v27)
            if v27.Type == "Grant" then
                l_grantOutfit_0(l_networking_0, v27.UserOutfitId, v15.props.opaquePage);
                return ;
            elseif v27.Type == "Revoke" then
                l_revokeCostume_0(v27.UserOutfitId);
                return ;
            else
                if v27.Type == "Update" then
                    l_updateOutfit_0(l_networking_0, v27.UserOutfitId);
                end;
                return ;
            end;
        end)
    };
end;
v14.render = function(_)
end;
v14.willUnmount = function(v29)
    for _, v31 in v29.tokens, nil, nil do
        v31:disconnect();
    end;
end;
return v4.connect(function(v32)
    local l_opaque_0 = v32.AvatarExperience.AvatarScene.AvatarRoute.opaque;
    return {
        opaquePage = not not l_opaque_0 and l_opaque_0.name or nil
    };
end, function(v34)
    return {
        grantAsset = function(v35, v36, v37, v38, v39)
            return v34(v10(v35, v36, v37, v38, v39));
        end, 
        revokeAsset = function(v40, v41)
            return v34(v11(v40, v41));
        end, 
        setConnectionState = function(v42)
            return v34(v8(v42));
        end, 
        grantOutfit = function(v43, v44, v45)
            return v34(v12(v43, tostring(v44), v45));
        end, 
        revokeCostume = function(v46)
            return v34(v9(v46));
        end, 
        updateOutfit = function(v47, v48)
            return v34(v13(v47, (tostring(v48))));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v7, 
    analytics = v5
})(v14)));
