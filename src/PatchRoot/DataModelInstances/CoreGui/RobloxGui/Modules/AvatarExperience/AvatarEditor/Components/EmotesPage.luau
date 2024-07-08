local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local v6 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v8 = require(l_CorePackages_0.Cryo);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EquipSlots);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ItemsList);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v21 = v3.PureComponent:extend("EmotesPage");
v21.init = function(v22)
    v22.equipSlotsRef = v3.createRef();
    v22.itemsListRef = v3.createRef();
    v22:setState({
        equipSlotsFocused = false, 
        itemsListFocused = false, 
        lastInputType = l_UserInputService_0:GetLastInputType()
    });
    v22.onEquipSlotsFocusChanged = function(v23)
        v22:setState({
            equipSlotsFocused = v23
        });
    end;
    v22.onItemsListFocusChanged = function(v24)
        v22:setState({
            itemsListFocused = v24
        });
    end;
    v22.onSlotActivated = function(v25)
        local function v27()
            local v26 = l_wasLastInputGamepad_0();
            v17("EmotesPage", v26);
            if v26 then
                v22.props.focusController.captureFocus();
            end;
        end;
        if v22.props.avatarType == v14.AvatarType.R6 then
            v22.props.navigation.navigate(v15.R15UpgradePrompt, {
                onOverlayClosed = v27, 
                bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
            });
        end;
        v22.props.setSelectedEmoteSlot(v25);
    end;
end;
v21.render = function(v28)
    return l_withStyle_0(function(v29)
        local l_Overlay_0 = v29.Theme.Overlay;
        local l_lockNavigationCallback_0 = v28.props.lockNavigationCallback;
        local l_unlockNavigationCallback_0 = v28.props.unlockNavigationCallback;
        local l_categoryInfo_0 = v28.props.categoryInfo;
        local l_onSlotActivated_0 = v28.onSlotActivated;
        local v35 = l_isGamepadInput_0(v28.state.lastInputType) and v28.props.avatarRoute.current.name == v15.ItemDetails;
        return v3.createElement(l_Focusable_0.Frame, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            BackgroundTransparency = 1, 
            defaultChild = v28.equipSlotsRef, 
            restorePreviousChildFocus = v28.props.restorePreviousChildFocus
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            EquipSlots = v3.createElement(v11, {
                slotsCount = l_categoryInfo_0.EquipSlotsCount, 
                lockNavigationCallback = l_lockNavigationCallback_0, 
                unlockNavigationCallback = l_unlockNavigationCallback_0, 
                onActivated = l_onSlotActivated_0, 
                LayoutOrder = 1, 
                NextSelectionUp = v28.props.NextSelectionUp, 
                itemsListRef = v28.itemsListRef, 
                [v3.Ref] = v28.equipSlotsRef, 
                onFocusChanged = v28.onEquipSlotsFocusChanged, 
                itemsListFocused = v28.state.itemsListFocused, 
                darkenItemsGrid = v35
            }), 
            Tiles = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -72), 
                LayoutOrder = 2
            }, {
                GamepadDarkOverlay = v28.state.equipSlotsFocused and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = l_Overlay_0.Transparency, 
                    BackgroundColor3 = l_Overlay_0.Color
                }), 
                ItemsList = v3.createElement(v12, {
                    buttonBInputRef = v28.equipSlotsRef, 
                    [v3.Ref] = v28.itemsListRef, 
                    onFocusChanged = v28.onItemsListFocusChanged, 
                    darkenItemsGrid = v35
                })
            }), 
            LastInputChangedListener = v3.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v36)
                    v28:setState({
                        lastInputType = v36
                    });
                end
            })
        });
    end);
end;
v21 = v19((l_withNavigation_0(v6.connect(function(v37, _)
    return {
        avatarType = v37.AvatarExperience.AvatarEditor.Character.AvatarType
    };
end, function(v39)
    return {
        setSelectedEmoteSlot = function(v40)
            v39(v13(v40));
        end
    };
end)(v21), nil)));
return function(v41)
    return v4.withFocusController(function(v42)
        return v3.createElement(v21, v8.Dictionary.join(v41, {
            focusController = v42
        }));
    end);
end;
