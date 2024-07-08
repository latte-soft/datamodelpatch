local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Otter);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.UIBlox);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils();
local l_Images_0 = v8.App.ImageSet.Images;
local l_withStyle_0 = v8.Style.withStyle;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v21 = l_Images_0["icons/actions/zoomIn"];
local v22 = Vector2.new(36, 36);
local v23 = l_Images_0["icons/controls/keys/xboxRS"];
local v24 = Vector2.new(36, 36);
local v25 = l_Images_0["component_assets/circle_49"];
local v26 = Vector2.new(49 + v24.X, (math.max(49, v24.Y)));
local v27 = {
    dampingRatio = 1, 
    frequency = 4
};
local function _(v28)
    return l_isGamepadInput_0(v28.UserInputType);
end;
local function _(v30, v31)
    local v32 = v31[v30];
    local v33 = false;
    if typeof(v32) == "table" then
        v33 = v32.tag == v15.SceneGamepad.FullViewIndicatorTag;
    end;
    return v33;
end;
local function _(v35)
    if not v35 then
        return 1;
    else
        return 0;
    end;
end;
local v37 = v5.PureComponent:extend("FullViewIndicator");
v37.validateProps = v7.strictInterface({
    AnchorPoint = v7.Vector2, 
    Position = v7.UDim2, 
    LayoutOrder = v7.optional(v7.number), 
    boundInputs = v7.table, 
    isSceneFullView = v7.boolean, 
    avatarRoute = v20.Interface
});
v37.getDerivedStateFromProps = function(v38, v39)
    local l_boundInputs_0 = v38.boundInputs;
    local l_lastGamepadKeyCode_0 = v39.lastGamepadKeyCode;
    local v42 = l_boundInputs_0[Enum.KeyCode.Thumbstick2];
    local v43 = false;
    if typeof(v42) == "table" then
        v43 = v42.tag == v15.SceneGamepad.FullViewIndicatorTag;
    end;
    local v44 = not v43;
    local v45 = l_boundInputs_0[Enum.KeyCode.ButtonR3];
    local v46 = false;
    if typeof(v45) == "table" then
        v46 = v45.tag == v15.SceneGamepad.FullViewIndicatorTag;
    end;
    v43 = not v46;
    v46 = nil;
    v46 = if not v38.isSceneFullView then not v44 and l_lastGamepadKeyCode_0 == Enum.KeyCode.Thumbstick2 or not v43 and l_lastGamepadKeyCode_0 == Enum.KeyCode.ButtonR3 else false;
    if v46 ~= v39.isVisible then
        return {
            isVisible = v46
        };
    else
        return nil;
    end;
end;
v37.setStateIfChanged = function(v47, v48)
    local v49 = {};
    for v50, v51 in v48, nil, nil do
        if v47.state[v50] ~= v51 then
            v49[v50] = v51;
        end;
    end;
    if next(v49) then
        v47:setState(v49);
    end;
end;
v37.init = function(v52)
    v52:setState({
        lastGamepadKeyCode = nil
    });
    local v53, v54 = v5.createBinding(not v52.state.isVisible and 1 or 0);
    v52.transparencyBinding = v53;
    v52.updateTransparencyBinding = v54;
    v52.onInputBegan = function(v55)
        if l_isGamepadInput_0(v55.UserInputType) then
            local v56 = false;
            if v55.KeyCode == Enum.KeyCode.ButtonR3 then
                v56 = not v52.props.isSceneFullView and not v52.state.isR3BindingOverridden;
            end;
            if not v56 then
                v52:setStateIfChanged({
                    lastGamepadKeyCode = v55.KeyCode
                });
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v52.onInputChanged = function(v57)
        if l_isGamepadInput_0(v57.UserInputType) then
            local v58 = true;
            if v57.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                v58 = v57.KeyCode == Enum.KeyCode.Thumbstick2;
            end;
            if not v58 or l_GamepadUtils_0.normalizeStickByDeadzone(v57.Position) == Vector2.new(0, 0) then
                return ;
            else
                v52:setStateIfChanged({
                    lastGamepadKeyCode = v57.KeyCode
                });
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v37.didMount = function(v59)
    v59.transparencyMotor = v4.createSingleMotor(not v59.state.isVisible and 1 or 0);
    v59.transparencyMotor:onStep(function(v60)
        v59.updateTransparencyBinding(v60);
    end);
    v59.transparencyMotor:start();
end;
v37.willUpdate = function(v61, _, v63)
    local l_isVisible_0 = v63.isVisible;
    if l_isVisible_0 ~= v61.state.isVisible then
        v61.transparencyMotor:setGoal(v4.spring(not l_isVisible_0 and 1 or 0, v27));
    end;
end;
v37.render = function(v65)
    if not (v65.props.avatarRoute.opaque.name == v14.AvatarExperienceLandingPage) then
        return v5.createFragment({
            InputBeganConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.InputBegan, 
                callback = v65.onInputBegan
            }, {
                InputChangedConnection = if not v10 then v5.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputChanged, 
                    callback = v65.onInputChanged
                }) else nil
            }), 
            InputChangedConnection = if not v10 then nil else v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.InputChanged, 
                callback = v65.onInputChanged
            }), 
            Indicator = l_withStyle_0(function(v66)
                local l_Theme_0 = v66.Theme;
                return v5.createElement("Frame", {
                    AnchorPoint = v65.props.AnchorPoint, 
                    Position = v65.props.Position, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v26.X, 0, v26.Y)
                }, {
                    UIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    ControllerButtonImage = v5.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, v24.X, 0, v24.Y), 
                        BackgroundTransparency = 1, 
                        Image = v23, 
                        ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                        ImageTransparency = v65.transparencyBinding, 
                        LayoutOrder = 1
                    }), 
                    CircleBackground = v5.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, 49, 0, 49), 
                        BackgroundTransparency = 1, 
                        Image = v25, 
                        ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                        ImageTransparency = v65.transparencyBinding, 
                        LayoutOrder = 2
                    }, {
                        IndicatorImage = v5.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            Size = UDim2.new(0, v22.X, 0, v22.Y), 
                            BackgroundTransparency = 1, 
                            Image = v21, 
                            ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                            ImageTransparency = v65.transparencyBinding
                        })
                    })
                });
            end)
        });
    else
        return nil;
    end;
end;
v37.willUnmount = function(v68)
    v68.transparencyMotor:destroy();
end;
return (v19((v6.connect(function(v69, v70)
    return {
        boundInputs = v69.GamepadBottomBar.boundInputs, 
        isSceneFullView = v18.getIsSceneFullViewFromState(v69, v70.avatarRoute)
    };
end)(v37))));
