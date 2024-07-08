local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.Cryo);
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v11 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v12 = require(l_Modules_0.LuaApp.Thunks.PatchDevSub);
local v13 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v14 = require(l_Modules_0.LuaApp.Actions.SetDevSub);
local v15 = require(l_Modules_0.LuaApp.Components.ListPicker);
local v16 = require(l_Modules_0.LuaApp.Components.FormBasedContextualMenu);
local v17 = require(l_Modules_0.LuaApp.Enum.DevSubStatus);
local v18 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v19 = v2.PureComponent:extend("DevSubMoreMenu");
local l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 = v8.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH;
v19.render = function(v21)
    local l_localization_0 = v21.props.localization;
    local l_screenSize_0 = v21.props.screenSize;
    local l_formFactor_0 = v21.props.formFactor;
    local l_onCancelSubscription_0 = v21.props.onCancelSubscription;
    local l_onRenewSubscription_0 = v21.props.onRenewSubscription;
    local l_devSub_0 = v21.props.devSub;
    local l_anchorSpaceSize_0 = v21.props.anchorSpaceSize;
    local l_anchorSpacePosition_0 = v21.props.anchorSpacePosition;
    local v30 = not not (l_formFactor_0 == l_FormFactor_0.COMPACT) and l_screenSize_0.X or l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0;
    local l_networking_0 = v21.props.networking;
    local v32 = {};
    if l_devSub_0.isAutoRenewing then
        table.insert(v32, {
            text = l_localization_0:Format("Feature.DevSubs.Action.CancelSubscription"), 
            onSelect = function()
                l_onCancelSubscription_0(l_devSub_0);
            end
        });
    end;
    if not l_devSub_0.isAutoRenewing and l_devSub_0.status == v17.Active then
        table.insert(v32, {
            text = l_localization_0:Format("Feature.DevSubs.Action.RenewSubscription"), 
            onSelect = function()
                l_onRenewSubscription_0(l_networking_0, l_devSub_0);
            end
        });
    end;
    return v2.createElement(v16, {
        anchorSpaceSize = l_anchorSpaceSize_0, 
        anchorSpacePosition = l_anchorSpacePosition_0, 
        itemWidth = v30, 
        enablePopUpCancelButton = false
    }, {
        Content = v2.createElement(v9.FitFrame, {
            BackgroundTransparency = 1, 
            fitAxis = v9.FitAxis.Height, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ListPicker = v2.createElement(v15, {
                formFactor = l_formFactor_0, 
                items = v32, 
                layoutOrder = 1, 
                width = v30, 
                maxHeight = 162
            })
        })
    });
end;
return (l_RoactServices_0.connect({
    localization = v5, 
    networking = v6
})((v3.connect(function(v33, _)
    return {
        formFactor = v33.FormFactor, 
        screenSize = v33.ScreenSize
    };
end, function(v35)
    return {
        onCancelSubscription = function(v36)
            v35(v11());
            v35(v13(v18.DevSubConfirmCancel, {
                devSub = v36
            }));
        end, 
        onRenewSubscription = function(v37, v38)
            v35(v11());
            v35(v12.Patch(v37, v38.id, true));
            v35(v14(v7.Dictionary.join(v38, {
                isAutoRenewing = true
            })));
        end
    };
end)(v19))));
