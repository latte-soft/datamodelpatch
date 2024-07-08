local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("ComputerMovementMode");
local v4 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.CoreUtility);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v6 = v4.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
local l_l_LocalPlayer_0_PropertyChangedSignal_0 = l_LocalPlayer_0:GetPropertyChangedSignal("DevComputerMovementMode");
local v8 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v8.Roact;
local l_t_0 = v8.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v12 = require(l_Parent_0.Components.DropDownSelection);
local v13 = require(l_Parent_0.Utility.ExternalEventConnection);
local v14 = require(script.Parent.InputLabel);
local v15 = require(script.Parent.DeveloperLockLabel);
local v16 = require(l_Parent_0.Localization.withLocalization);
local v17 = require(l_Parent_0.Utility.SendAnalytics);
local v18 = require(l_Parent_0.Resources.Constants);
local v19 = {
    [Enum.ComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse", 
    [Enum.ComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove", 
    [Enum.ComputerMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default"
};
local v20 = {
    [Enum.DevComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse", 
    [Enum.DevComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove"
};
local v21 = l_Roact_0.PureComponent:extend("MovementModeEntry");
v21.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canOpen = l_t_0.optional(l_t_0.boolean), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean)
});
v21.defaultProps = {
    canOpen = true
};
v21.init = function(v22)
    v22:setState({
        selectedComputerMode = l_UserGameSettings_0.ComputerMovementMode, 
        computerOptions = not not v6 and v6:GetRegisteredComputerMovementModes() or {}, 
        developerComputerMode = l_LocalPlayer_0.DevComputerMovementMode
    });
end;
v21.render = function(v23)
    local v24 = {
        ComputerMovementModeListener = l_Roact_0.createElement(v13, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function()
                v23:setState({
                    selectedComputerMode = l_UserGameSettings_0.ComputerMovementMode
                });
            end
        }), 
        ComputerMovementModeRegisteredListener = v6 and l_Roact_0.createElement(v13, {
            event = v6.ComputerMovementModeRegistered, 
            callback = function()
                v23:setState({
                    computerOptions = v6:GetRegisteredComputerMovementModes()
                });
            end
        }), 
        DevComputerMovementMode = l_Roact_0.createElement(v13, {
            event = l_l_LocalPlayer_0_PropertyChangedSignal_0, 
            callback = function()
                v23:setState({
                    developerComputerMode = l_LocalPlayer_0.DevComputerMovementMode
                });
            end
        })
    };
    if #v23.state.computerOptions == 0 then
        return l_Roact_0.createFragment(v24);
    else
        local v25 = v23.state.developerComputerMode ~= Enum.DevComputerMovementMode.UserChoice;
        local v26 = {};
        local v27 = 0;
        if not v25 then
            for v28, v29 in ipairs(v23.state.computerOptions) do
                v26[v28] = v19[v29];
                assert(v26[v28] ~= nil, "Movement mode " .. v29.Name .. " has no localization key");
                if v23.state.selectedComputerMode.Value == v29.Value then
                    v27 = v28;
                end;
            end;
        end;
        v24.MovementModeEntrySelector = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = 1, 
            LayoutOrder = v23.props.LayoutOrder, 
            ZIndex = 2
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            InputLabel = l_Roact_0.createElement(v14, {
                localizationKey = "CoreScripts.InGameMenu.GameSettings.MovementMode", 
                Size = UDim2.new(1, 0, 0, 56), 
                Position = UDim2.new(0, 0, 0, 0), 
                AnchorPoint = Vector2.new(0, 0)
            }), 
            Dropdown = v16({
                placeholder = not not v25 and v20[v23.state.developerComputerMode] or nil
            })(function(v30)
                return l_Roact_0.createElement(v12, {
                    Size = UDim2.new(1, 0, 0, 44), 
                    Position = UDim2.new(0, 0, 0, 56), 
                    selections = v26, 
                    selectedIndex = v27, 
                    placeHolderText = v30.placeholder, 
                    enabled = not v25, 
                    localize = true, 
                    selectionParentName = "MovementModeEntryDropdown", 
                    canOpen = v23.props.canOpen, 
                    canCaptureFocus = v23.props.canCaptureFocus, 
                    selectionChanged = function(v31)
                        l_UserGameSettings_0.ComputerMovementMode = v23.state.computerOptions[v31];
                        v17(v18.AnalyticsSettingsChangeName, nil, {}, true);
                    end
                });
            end), 
            LockedLabel = v25 and l_Roact_0.createElement(v15, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, -72, 0.25, 0)
            })
        });
        return l_Roact_0.createFragment(v24);
    end;
end;
return v21;
