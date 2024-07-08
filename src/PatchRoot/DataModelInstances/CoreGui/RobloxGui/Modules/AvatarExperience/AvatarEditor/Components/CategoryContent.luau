local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.UIBlox);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_withStyle_0 = v8.Style.withStyle;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyColorsFrame);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EmotesPage);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ItemsList);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ScalesPage);
local v21 = v4.PureComponent:extend("CategoryContent");
v21.init = function(v22)
    v22.isMounted = false;
    v22.connections = {};
    v22.isTouched = false;
    v22.ref = v4.createRef();
    v22.state = {
        enableNavigation = true
    };
    v22.lockNavigationCallback = function()
        if v22.isMounted then
            v22:setState({
                enableNavigation = false
            });
            return ;
        else
            return ;
        end;
    end;
    v22.unlockNavigationCallback = function()
        if v22.isMounted then
            v22:setState({
                enableNavigation = true
            });
            return ;
        else
            return ;
        end;
    end;
end;
v21.renderWithProviders = function(v23, v24, v25)
    local l_Theme_0 = v24.Theme;
    local l_categoryInfo_0 = v23.props.categoryInfo;
    local v28 = v23.props.size or UDim2.new(1, 0, 1, 0);
    local v29 = nil;
    if l_categoryInfo_0.PageType == v14.PageType.Emotes then
        v29 = v4.createElement(v18, {
            enableNavigation = v23.state.enableNavigation, 
            lockNavigationCallback = v23.lockNavigationCallback, 
            unlockNavigationCallback = v23.unlockNavigationCallback, 
            categoryInfo = l_categoryInfo_0, 
            NextSelectionUp = v23.props.NextSelectionUp, 
            restorePreviousChildFocus = v23.props.restorePreviousChildFocus
        });
    elseif l_categoryInfo_0.PageType == v14.PageType.BodyStyle then
        v29 = v4.createElement(v20, {
            enableNavigation = v23.state.enableNavigation, 
            lockNavigationCallback = v23.lockNavigationCallback, 
            unlockNavigationCallback = v23.unlockNavigationCallback, 
            NextSelectionUp = v23.props.NextSelectionUp
        });
    elseif l_categoryInfo_0.PageType == v14.PageType.BodyColors then
        v29 = v4.createElement(v17, {
            Size = v28, 
            NextSelectionUp = v23.props.NextSelectionUp
        });
    elseif l_categoryInfo_0.RenderItemTiles then
        v29 = v4.createElement(v19, {
            backToTopSignal = v23.props.backToTopSignal, 
            NextSelectionUp = v23.props.NextSelectionUp
        });
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        Active = true, 
        Size = v28, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        LayoutOrder = v23.props.LayoutOrder, 
        inputBindings = {
            NavUp = v5.Input.onBegin(Enum.KeyCode.ButtonB, function()
                if v23.props.NextSelectionUp then
                    v25.moveFocusTo(v23.props.NextSelectionUp);
                end;
            end)
        }, 
        [v4.Ref] = v23.props.frameRef or v23.ref
    }, {
        PageContent = v29
    });
end;
v21.render = function(v30)
    return l_withStyle_0(function(v31)
        return v5.withFocusController(function(v32)
            return v30:renderWithProviders(v31, v32);
        end);
    end);
end;
v21.didMount = function(v33)
    v33.isMounted = true;
end;
v21.willUnmount = function(v34)
    v34.isMounted = false;
    v34:disconnectListeners();
end;
v21.disconnectListeners = function(v35)
    for _, v37 in v35.connections, nil, nil do
        v37:disconnect();
    end;
    v35.connections = {};
    v35.isTouched = false;
end;
v21.didUpdate = function(v38, v39, _)
    local l_name_0 = v38.props.avatarRoute.current.name;
    local l_name_1 = v39.avatarRoute.current.name;
    if l_name_0 == v9.AvatarEditor and l_name_0 ~= l_name_1 then
        local v43 = l_UserInputService_0.TouchMoved:Connect(function(...)
            v38:onTouchMoved(...);
        end);
        local v44 = l_UserInputService_0.TouchSwipe:Connect(function(...)
            v38:onTouchSwipe(...);
        end);
        v38.connections[#v38.connections + 1] = v43;
        v38.connections[#v38.connections + 1] = v44;
        return ;
    else
        if (l_name_1 == v9.AvatarEditor and l_name_0 ~= v9.AvatarEditor) and l_name_0 ~= l_name_1 then
            v38:disconnectListeners();
        end;
        return ;
    end;
end;
v21.onTouchMoved = function(v45, v46, _)
    v45.isTouched = false;
    local l_frameRef_0 = v45.props.frameRef;
    local v49 = not not l_frameRef_0 and l_frameRef_0.current or v45.ref.current;
    if v49 and v45.state.enableNavigation then
        local l_AbsolutePosition_0 = v49.AbsolutePosition;
        local l_AbsoluteSize_0 = v49.AbsoluteSize;
        local v52 = Vector2.new(l_AbsolutePosition_0.X + l_AbsoluteSize_0.X, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y);
        if ((v49.AbsolutePosition.X < v46.Position.X and v49.AbsolutePosition.Y < v46.Position.Y) and v46.Position.X < v52.X) and v46.Position.Y < v52.Y then
            v45.isTouched = true;
        end;
        return ;
    else
        return ;
    end;
end;
v21.onTouchSwipe = function(v53, v54, v55, _)
    if v55 ~= 1 then
        return ;
    elseif v53.isTouched and v53.state.enableNavigation then
        if v54 == Enum.SwipeDirection.Right then
            if v53.props.navigateLeft then
                v53.props.navigateLeft();
                return ;
            end;
        elseif not (not (v54 == Enum.SwipeDirection.Left) or not v53.props.navigateRight) then
            v53.props.navigateRight();
        end;
        return ;
    else
        return ;
    end;
end;
return (v16((v7.connect(function(v57, _)
    return {
        categoryInfo = v15.getAvatarEditorCategoryInfoFromState(v57), 
        deviceOrientation = v57.DeviceOrientation, 
        screenSize = v57.ScreenSize
    };
end, nil)((l_RoactServices_0.connect({
    avatarExperienceAnalytics = v13
})(v21))))));
