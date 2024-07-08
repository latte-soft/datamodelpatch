local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("MasterVolume");
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Utility.ExternalEventConnection);
local v8 = require(script.Parent.SliderEntry);
local v9 = require(l_Parent_0.Utility.SendAnalytics);
local v10 = require(l_Parent_0.Resources.Constants);
if l_CoreGui_0.RobloxGui:FindFirstChild("Sounds") == nil then
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "Sounds";
    l_Folder_0.Parent = l_CoreGui_0.RobloxGui;
end;
local v12 = Instance.new("Sound", l_CoreGui_0.RobloxGui.Sounds);
v12.Name = "VolumeChangeSound";
v12.Volume = 1;
v12.SoundId = "rbxasset://sounds/uuhhh.mp3";
local v13 = l_Roact_0.PureComponent:extend("VolumeEntry");
v13.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean), 
    buttonRef = l_t_0.optional(l_t_0.table)
});
v13.init = function(v14)
    v14.onVolumeChanged = function()
        v14:setState({
            volume = math.floor(l_UserGameSettings_0.MasterVolume * 10 + 0.5)
        });
    end;
    v14.onVolumeChanged();
end;
v13.render = function(v15)
    return l_Roact_0.createFragment({
        VolumeSlider = l_Roact_0.createElement(v8, {
            labelKey = "CoreScripts.InGameMenu.GameSettings.Volume", 
            LayoutOrder = v15.props.LayoutOrder, 
            min = 0, 
            max = 10, 
            stepInterval = 1, 
            value = v15.state.volume, 
            valueChanged = function(v16)
                l_UserGameSettings_0.MasterVolume = v16 / 10;
                v12:Play();
                v9(v10.AnalyticsSettingsChangeName, nil, {}, true);
            end, 
            canCaptureFocus = v15.props.canCaptureFocus, 
            isMenuOpen = v15.props.isMenuOpen, 
            buttonRef = v15.props.buttonRef
        }), 
        VolumeListener = l_Roact_0.createElement(v7, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = v15.onVolumeChanged
        })
    });
end;
return v13;
