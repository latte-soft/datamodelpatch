local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_SoundService_0 = game:GetService("SoundService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_t_0 = v4.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Components.DropDownSelection);
local v9 = require(l_Parent_0.Components.ThemedTextLabel);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v11 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v12 = l_Roact_0.PureComponent:extend("DeviceSelectionEntry");
local v13 = require(l_Parent_0.Flags.GetFFlagTruncateDeviceSelection);
local v14 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
v12.DeviceType = {
    Input = "Input", 
    Output = "Output"
};
v12.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    deviceType = l_t_0.string, 
    isMenuOpen = l_t_0.boolean, 
    canOpen = l_t_0.optional(l_t_0.boolean), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean)
});
v12.defaultProps = {
    canOpen = true
};
v12.init = function(v15)
    v15:setState({
        deviceNames = {}, 
        deviceGuids = {}, 
        selectedIndex = 0, 
        ready = false
    });
    l_default_0:asyncInit():andThen(function()
        v15:setState({
            ready = true
        });
        l_default_0:SetupParticipantListeners();
        if l_SoundService_0.DeviceListChanged then
            l_SoundService_0.DeviceListChanged:Connect(function()
                if v15.props.isMenuOpen then
                    v15:pollDevices(v15.props.deviceType);
                end;
            end);
        end;
    end):catch(function()
        if v14() then
            v11:warning("Failed to init VoiceChatServiceManager");
        end;
    end);
end;
v12.render = function(v16)
    if not (v16.state.ready and v16.state.deviceNames ~= nil) or #v16.state.deviceNames == 0 then
        return nil;
    else
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = 1, 
            LayoutOrder = v16.props.LayoutOrder, 
            ZIndex = 2
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            InputLabel = l_Roact_0.createElement(v9, {
                fontKey = "Body", 
                themeKey = "TextDefault", 
                Size = UDim2.new(1, 0, 0, 56), 
                Position = UDim2.new(0, 0, 0, 0), 
                AnchorPoint = Vector2.new(0, 0), 
                Text = v16.props.deviceType == v12.DeviceType.Input and "Input Device" or "Output Device", 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Dropdown = l_Roact_0.createElement(v8, {
                Size = UDim2.new(1, 0, 0, 44), 
                Position = UDim2.new(0, 0, 0, 56), 
                truncate = v13(), 
                selections = v16.state.deviceNames, 
                selectedIndex = v16.state.selectedIndex, 
                placeHolderText = "", 
                enabled = true, 
                localize = false, 
                selectionParentName = v16.props.deviceType .. "DeviceSelectionEntryDropdown", 
                canOpen = v16.props.canOpen, 
                canCaptureFocus = v16.props.canCaptureFocus, 
                selectionChanged = function(v17)
                    l_default_0:SwitchDevice(v16.props.deviceType, v16.state.deviceNames[v17], v16.state.deviceGuids[v17]);
                    v16:setState({
                        selectedIndex = v17
                    });
                end
            })
        });
    end;
end;
v12.pollDevices = function(v18, v19)
    spawn(function()
        local l_l_default_0_Devices_0, v21, v22, v23 = l_default_0:GetDevices(v19);
        if not l_l_default_0_Devices_0 then
            if v14() then
                v11:warning("Errors in get {} Device info", v19);
            end;
            v18:setState({
                deviceNames = {}, 
                deviceGuids = {}, 
                selectedIndex = 0
            });
            return ;
        else
            v18:setState({
                deviceNames = v21, 
                deviceGuids = v22, 
                selectedIndex = v23
            });
            return ;
        end;
    end);
end;
v12.willUpdate = function(v24, v25)
    if not (v24.props.isMenuOpen or not v25.isMenuOpen) then
        v24:pollDevices(v25.deviceType);
    end;
end;
return v12;
