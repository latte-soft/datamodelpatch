local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.RoactRodux);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.UIBlox);
local v12 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v13 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v14 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v19 = require(l_Modules_0.AvatarExperience.Common.Context.wrapWithSceneInteractionCallbacks);
local l_CursorKind_0 = v11.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v11.App.SelectionImage.withSelectionCursorProvider;
local v22 = {
    vertical = {
        key = "Feature.Avatar.Action.Zoom"
    }, 
    horizontal = {
        key = "Feature.Avatar.Action.Rotate"
    }
};
local v23 = v4.PureComponent:extend("SceneGamepadHandler");
v23.validateProps = v10.interface({
    [v4.Children] = v10.optional(v10.table), 
    panByDistance = v10.callback, 
    rotateByRadians = v10.callback, 
    zoomStraight = v10.callback, 
    focusController = v10.table, 
    defaultChild = v10.optional(v10.table), 
    NextSelectionLeft = v10.optional(v10.table), 
    NextSelectionRight = v10.optional(v10.table), 
    NextSelectionUp = v10.optional(v10.table), 
    NextSelectionDown = v10.optional(v10.table), 
    isSceneFullView = v10.boolean
});
v23.init = function(v24)
    v24.mainRef = v4.createRef();
    v24.isolateRef = v4.createRef();
    v24.rotateAndZoom = function(v25, v26)
        l_GamepadUtils_0.rotateAndZoom(v25, v26, v24.props.setAngularVelocityByPixels, v24.props.rotateByRadians, v24.props.zoomStraight);
    end;
    v24.pan = function(v27, v28)
        local v29 = l_GamepadUtils_0.normalizeStickByDeadzone(v27.Position);
        if v29 == Vector2.new(0, 0) then
            return ;
        else
            v24.props.panByDistance((v28 * v29) * 5);
            return ;
        end;
    end;
    v24.toggleFullView = function()
        local l_name_0 = v24.props.avatarRoute.opaque.name;
        local v31 = true;
        if l_name_0 ~= v15.AvatarEditor then
            v31 = true;
            if l_name_0 ~= v15.Catalog then
                v31 = true;
                if l_name_0 ~= v15.CatalogSearch then
                    v31 = l_name_0 == v15.ProfilePictureEditorEmotes;
                end;
            end;
        end;
        if v31 then
            if not v24.props.isSceneFullView then
                v24.oldFocus = v24.props.focusController.getCurrentFocus();
                v24.props.focusController.moveFocusTo(v24.isolateRef);
            else
                v24.props.focusController.moveFocusTo(v24.oldFocus);
                v24.oldFocus = nil;
            end;
            local l_setFullView_0 = v24.props.setFullView;
            local l_isSceneFullView_0 = v24.props.isSceneFullView;
            local _ = nil;
            l_setFullView_0(v24.props.analytics, v24.props.avatarRoute.opaque.name, if not l_isSceneFullView_0 then v14.SceneFullView else v14.None);
            return ;
        else
            return ;
        end;
    end;
    v24.renderWithCursorCallback = function(...)
        return v24:renderWithCursor(...);
    end;
end;
v23.renderWithCursor = function(v35, v36)
    local l_isSceneFullView_1 = v35.props.isSceneFullView;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        inputBindings = {
            RotateAndZoom = v5.Input.onStep(Enum.KeyCode.Thumbstick2, v35.rotateAndZoom, {
                tag = v16.SceneGamepad.FullViewIndicatorTag, 
                axes = not not l_isSceneFullView_1 and v22 or nil
            }), 
            Pan = not not l_isSceneFullView_1 and v5.Input.onStep(Enum.KeyCode.Thumbstick1, v35.pan, {
                key = "Feature.Avatar.Action.Pan"
            }) or nil, 
            ToggleFullView = v5.Input.onBegin(Enum.KeyCode.ButtonR3, v35.toggleFullView, {
                tag = v16.SceneGamepad.FullViewIndicatorTag, 
                key = if not l_isSceneFullView_1 then nil else "Feature.Avatar.Action.DefaultView"
            }), 
            ExitFullView = if not l_isSceneFullView_1 then nil else v5.Input.onBegin(Enum.KeyCode.ButtonB, v35.toggleFullView)
        }, 
        NextSelectionLeft = v35.props.NextSelectionLeft, 
        NextSelectionRight = v35.props.NextSelectionRight, 
        NextSelectionUp = v35.props.NextSelectionUp, 
        NextSelectionDown = v35.props.NextSelectionDown, 
        defaultChild = v35.props.defaultChild, 
        [v4.Ref] = v35.mainRef
    }, v3.Dictionary.join(v35.props[v4.Children], {
        FocusIsolate = v4.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            SelectionImageObject = v36(l_CursorKind_0.Invisible), 
            [v4.Ref] = v35.isolateRef
        })
    }));
end;
v23.render = function(v38)
    return l_withSelectionCursorProvider_0(v38.renderWithCursorCallback);
end;
v23 = l_RoactServices_0.connect({
    analytics = v12
})((v7.connect(function(v39, v40)
    return {
        isSceneFullView = v17.getIsSceneFullViewFromState(v39, v40.avatarRoute)
    };
end, function(v41)
    return {
        setFullView = function(v42, v43, v44)
            v41(v13(v42, v43, v44));
        end
    };
end)(v23)));
return (v18((v19(function(v45)
    return v5.withFocusController(function(v46)
        return v4.createElement(v23, v3.Dictionary.join(v45, {
            focusController = v46
        }));
    end);
end))));
