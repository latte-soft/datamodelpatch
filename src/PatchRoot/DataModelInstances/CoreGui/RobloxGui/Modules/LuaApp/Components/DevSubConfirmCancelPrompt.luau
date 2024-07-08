local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.LuaApp.FlagSettings);
local v6 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_Modules_0.LuaApp.Thunks.PatchDevSub);
local v9 = require(l_Modules_0.LuaApp.Actions.SetDevSub);
local v10 = require(l_CorePackages_0.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v13 = v1.PureComponent:extend("DevSubConfirmCancelPrompt");
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v2.Style.withStyle;
v13.render = function(v16)
    local l_containerWidth_0 = v16.props.containerWidth;
    local l_onConfirm_0 = v16.props.onConfirm;
    local l_onBack_0 = v16.props.onBack;
    local l_networking_0 = v16.props.networking;
    local l_devSub_0 = v16.props.devSub;
    return v14({
        titleText = "Feature.DevSubs.Action.CancelSubscription", 
        messageText = "Feature.DevSubs.Message.ConfirmCancellation", 
        confirmButtonText = "CommonUI.Controls.Action.Confirm", 
        cancelButtonText = "CommonUI.Controls.Action.Back"
    })(function(v22)
        return l_withStyle_0(function(v23)
            return v1.createElement(v6, {
                containerWidth = l_containerWidth_0, 
                titleText = v22.titleText, 
                titleFont = v23.Font.Title.Font, 
                titleTextSize = 22, 
                messageText = v22.messageText, 
                messageFont = v23.Font.Body.Font, 
                buttonFont = v23.Font.Header1.Font, 
                confirmButtonText = v22.confirmButtonText, 
                onConfirm = function()
                    l_onConfirm_0(l_networking_0, l_devSub_0);
                end, 
                hasCancelButton = true, 
                cancelButtonText = v22.cancelButtonText, 
                onCancel = l_onBack_0
            });
        end);
    end);
end;
return l_RoactServices_0.connect({
    networking = v12
})((v3.connect(nil, function(v24)
    return {
        onBack = function()
            v24(v7());
        end, 
        onConfirm = function(v25, v26)
            v24(v7());
            v24(v8.Patch(v25, v26.id, false));
            v24(v9(v10.Dictionary.join(v26, {
                isAutoRenewing = false
            })));
        end
    };
end)(v13)));
