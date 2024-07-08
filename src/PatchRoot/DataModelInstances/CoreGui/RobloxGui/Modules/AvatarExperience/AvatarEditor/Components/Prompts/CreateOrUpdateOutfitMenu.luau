local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.GetDuplicateOutfit);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.NavOverlayContainer);
local v15 = require(l_CorePackages_0.UIBlox);
local l_ContextualMenu_0 = v15.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v15.App.Menu.MenuDirection;
local v18 = v4.PureComponent:extend("CreateOrUpdateOutfitMenu");
v18.validateProps = v2.strictInterface({
    screenSize = v2.Vector2, 
    duplicateOutfitId = v2.optional(v2.string), 
    navigation = v2.table, 
    focusController = v2.optional(v2.table), 
    onOverlayClosed = v2.optional(v2.callback), 
    saveTilePosition = v2.Vector2, 
    defaultChildRef = v2.optional(v2.table)
});
v18.init = function(v19)
    v19.saveOutfitAsNew = function()
        if not v19.props.duplicateOutfitId then
            v10.navigateToNextOverlay(v19.props.navigation, v8.SaveOutfitPrompt);
            return ;
        else
            v10.navigateToNextOverlay(v19.props.navigation, v8.DuplicateOutfitInfoPrompt, {
                duplicateOutfitId = v19.props.duplicateOutfitId, 
                saveAsNew = true
            });
            return ;
        end;
    end;
    v19.updateExistingOutfit = function()
        if not v19.props.duplicateOutfitId then
            v10.navigateFromOverlay(v19.props.navigation, v8.UpdateOutfitPage);
            return ;
        else
            v10.navigateToNextOverlay(v19.props.navigation, v8.DuplicateOutfitInfoPrompt, {
                duplicateOutfitId = v19.props.duplicateOutfitId, 
                saveAsNew = false
            });
            return ;
        end;
    end;
    v19.closePrompt = function()
        v10.closeOverlay(v19.props.navigation);
    end;
    v19:setState({
        useFullWidth = false
    });
    v19.onNavOverlaySizeChanged = function(v20)
        if v20.AbsoluteSize.X < 640 then
            if not v19.state.useFullWidth then
                v19:setState({
                    useFullWidth = true
                });
                return ;
            end;
        elseif v19.state.useFullWidth then
            v19:setState({
                useFullWidth = false
            });
        end;
    end;
    local v21, v22 = v4.createBinding(UDim2.fromOffset(0, 0));
    v19.positionOffset = v21;
    v19.updatePositionOffset = v22;
    v19.onNavOverlayPositionChanged = function(v23)
        v19.updatePositionOffset(UDim2.fromOffset(-v23.AbsolutePosition.X, -v23.AbsolutePosition.Y));
    end;
end;
v18.renderLocalized = function(v24, v25)
    local v26 = {};
    table.insert(v26, {
        text = v25.saveAsNew, 
        inputBindingKey = "CommonUI.Controls.Action.Confirm", 
        onActivated = v24.saveOutfitAsNew
    });
    table.insert(v26, {
        text = v25.updateExistingCharacter, 
        inputBindingKey = "CommonUI.Controls.Action.Confirm", 
        onActivated = v24.updateExistingOutfit
    });
    local v27 = v24.props.saveTilePosition.Y + 25;
    local l_Down_0 = l_MenuDirection_0.Down;
    if v24.props.screenSize.Y < (v27 + 112) + 12 then
        v27 = v24.props.saveTilePosition.Y - 25;
        l_Down_0 = l_MenuDirection_0.Up;
    end;
    local v29 = UDim2.fromOffset(v24.props.saveTilePosition.X - 42, 0);
    local v30 = UDim2.new(0, 324, 1, 0);
    if v24.state.useFullWidth then
        v29 = UDim2.fromOffset(0, 0);
        v30 = UDim2.fromScale(1, 1);
    end;
    return v4.createElement(v14, {
        onAbsoluteSizeChanged = v24.onNavOverlaySizeChanged, 
        onAbsolutePositionChanged = v24.onNavOverlayPositionChanged
    }, {
        SizeFrame = v4.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Position = v29, 
            Size = v30, 
            [v4.Ref] = v24.props.defaultChildRef, 
            inputBindings = {
                NavigateBack = v6.Input.onBegin(Enum.KeyCode.ButtonB, v24.closePrompt)
            }
        }, {
            PositionOffsetFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = not v24.state.useFullWidth and v24.positionOffset or nil, 
                Size = UDim2.fromScale(1, 1)
            }, {
                ContextMenu = v4.createElement(l_ContextualMenu_0, {
                    buttonProps = v26, 
                    open = true, 
                    menuDirection = l_Down_0, 
                    openPositionY = UDim.new(0, v27), 
                    closeBackgroundVisible = true, 
                    screenSize = v24.props.screenSize, 
                    onDismiss = v24.closePrompt
                })
            })
        })
    });
end;
v18.render = function(v31)
    return l_withLocalization_0({
        saveAsNew = "Feature.Avatar.Action.SaveAsNew", 
        updateExistingCharacter = "Feature.Avatar.Action.UpdateExistingCharacter"
    })(function(v32)
        return v31:renderLocalized(v32);
    end);
end;
return (v9((v13((v5.connect(function(v33, _)
    return {
        duplicateOutfitId = v12(v33), 
        screenSize = v33.ScreenSize
    };
end, nil)(v18))))));
