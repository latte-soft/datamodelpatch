local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("ComputerCameraMovementMode");
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
    [Enum.ComputerCameraMovementMode.Classic] = "CoreScripts.InGameMenu.GameSettings.CameraModeClassic", 
    [Enum.ComputerCameraMovementMode.Follow] = "CoreScripts.InGameMenu.GameSettings.CameraModeFollow", 
    [Enum.ComputerCameraMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default", 
    [Enum.ComputerCameraMovementMode.CameraToggle] = "CoreScripts.InGameMenu.GameSettings.CameraModeCameraToggle"
};
local v20 = l_Roact_0.PureComponent:extend("CameraModeEntry");
v20.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canOpen = l_t_0.optional(l_t_0.boolean), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    ButtonRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
});
v20.defaultProps = {
    canOpen = true
};
v20.init = function(v21)
    v21:setState({
        selectedComputerMode = l_UserGameSettings_0.ComputerCameraMovementMode, 
        computerOptions = not not v6 and v6:GetRegisteredComputerCameraMovementModes() or {}, 
        developerComputerMode = l_LocalPlayer_0.DevComputerCameraMode
    });
end;
v20.render = function(v22)
    local v23 = {
        ComputerCameraMovementModeListener = l_Roact_0.createElement(v13, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function()
                v22:setState({
                    selectedComputerMode = l_UserGameSettings_0.ComputerCameraMovementMode
                });
            end
        }), 
        ComputerCameraMovementModeRegisteredListener = v6 and l_Roact_0.createElement(v13, {
            event = v6.ComputerCameraMovementModeRegistered, 
            callback = function()
                v22:setState({
                    computerOptions = v6:GetRegisteredComputerCameraMovementModes()
                });
            end
        }), 
        LocalPlayerComputerMovementMode = l_Roact_0.createElement(v13, {
            event = l_l_LocalPlayer_0_PropertyChangedSignal_0, 
            callback = function()
                v22:setState({
                    developerComputerMode = l_LocalPlayer_0.DevComputerCameraMode
                });
            end
        })
    };
    if #v22.state.computerOptions == 0 then
        return l_Roact_0.createFragment(v23);
    else
        local v24 = v22.state.developerComputerMode ~= Enum.DevComputerCameraMovementMode.UserChoice;
        local v25 = {};
        local v26 = 0;
        if not v24 then
            for v27, v28 in ipairs(v22.state.computerOptions) do
                v25[v27] = v19[v28];
                assert(v25[v27] ~= nil, "Camera movement mode " .. v28.Name .. " has no localization key");
                if v22.state.selectedComputerMode.Value == v28.Value then
                    v26 = v27;
                end;
            end;
        end;
        v23.CameraModeEntrySelector = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = 1, 
            LayoutOrder = v22.props.LayoutOrder, 
            ZIndex = 2
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            InputLabel = l_Roact_0.createElement(v14, {
                localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraMode", 
                Size = UDim2.new(1, 0, 0, 56), 
                Position = UDim2.new(0, 0, 0, 0), 
                AnchorPoint = Vector2.new(0, 0)
            }), 
            Dropdown = v16({
                placeholder = not not v24 and v19[v22.state.developerComputerMode] or nil
            })(function(_)
                return l_Roact_0.createElement(v12, {
                    Size = UDim2.new(1, 0, 0, 44), 
                    Position = UDim2.new(0, 0, 0, 56), 
                    selections = v25, 
                    selectedIndex = v26, 
                    placeHolderText = v22.state.developerComputerMode.Name, 
                    enabled = not v24, 
                    localize = true, 
                    selectionChanged = function(v30)
                        l_UserGameSettings_0.ComputerCameraMovementMode = v22.state.computerOptions[v30];
                        v17(v18.AnalyticsSettingsChangeName, nil, {}, true);
                    end, 
                    selectionParentName = "cameraModeDropdown", 
                    canOpen = v22.props.canOpen, 
                    canCaptureFocus = v22.props.canCaptureFocus, 
                    ButtonRef = v22.props.ButtonRef
                });
            end), 
            LockedLabel = v24 and l_Roact_0.createElement(v15, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, -72, 0.25, 0)
            })
        });
        return l_Roact_0.createFragment(v23);
    end;
end;
return v20;
