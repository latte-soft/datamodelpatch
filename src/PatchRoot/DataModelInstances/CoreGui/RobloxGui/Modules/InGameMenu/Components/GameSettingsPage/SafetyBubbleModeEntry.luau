local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v2 = require(l_CorePackages_0.Packages.LuauPolyfill);
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_t_0 = v3.t;
local l_UIBlox_0 = v3.UIBlox;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Components.ThemedTextLabel);
local l_l_GameSettings_0_PropertyChangedSignal_0 = l_GameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode");
local v10 = require(l_Parent_0.Utility.ExternalEventConnection);
local v11 = require(script.Parent.InputLabel);
local l_RadioButtonList_0 = l_UIBlox_0.App.InputButton.RadioButtonList;
local v13 = require(l_Parent_0.Localization.withLocalization);
local v14 = require(l_Parent_0.Utility.SendAnalytics);
local v15 = require(l_Parent_0.Resources.Constants);
local v16 = {
    Title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle", 
    Description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription", 
    ["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne", 
    ["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends", 
    ["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
};
local l_EnumItems_0 = Enum.VRSafetyBubbleMode:GetEnumItems();
local function _(v18)
    return v2.Array.indexOf(l_EnumItems_0, v18);
end;
local function _(v20)
    local v21 = l_EnumItems_0[v20];
    l_GameSettings_0.VRSafetyBubbleMode = v21;
    v14(v15.AnalyticsSettingsChangeName, v15.AnalyticsSettingsSafetyBubbleModeChangeName, {
        mode = tostring(v21)
    });
end;
local v23 = v4.PureComponent:extend("SafetyBubbleModeEntry");
v23.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.integer)
});
v23.init = function(v24)
    v24:setState({
        selectedMode = v2.Array.indexOf(l_EnumItems_0, l_GameSettings_0.VRSafetyBubbleMode)
    });
end;
v23.render = function(v25)
    return v13(v16)(function(v26)
        return v4.createFragment({
            VRSafetyBubbleModeListener = v4.createElement(v10, {
                event = l_l_GameSettings_0_PropertyChangedSignal_0, 
                callback = function()
                    v25:setState({
                        selectedMode = v2.Array.indexOf(l_EnumItems_0, l_GameSettings_0.VRSafetyBubbleMode)
                    });
                end
            }), 
            SafetyBubbleModeEntrySelector = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v25.props.LayoutOrder, 
                ZIndex = 2
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 15), 
                    PaddingTop = UDim.new(0, 15)
                }), 
                ListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20)
                }), 
                InputLabel = v4.createElement(v11, {
                    localizationKey = v16.Title, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0, 0), 
                    LayoutOrder = 1
                }), 
                InputDescription = v4.createElement(v8, {
                    themeKey = "TextDefault", 
                    fontKey = "CaptionHeader", 
                    Text = v26.Description, 
                    Size = UDim2.new(0.9, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    LayoutOrder = 2, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                RadioList = v4.createElement(l_RadioButtonList_0, {
                    layoutOrder = 3, 
                    radioButtons = v2.Array.map(l_EnumItems_0, function(v27, _)
                        return {
                            label = v26[tostring(v27)]
                        };
                    end), 
                    onActivated = function(v29)
                        local v30 = l_EnumItems_0[v29];
                        l_GameSettings_0.VRSafetyBubbleMode = v30;
                        v14(v15.AnalyticsSettingsChangeName, v15.AnalyticsSettingsSafetyBubbleModeChangeName, {
                            mode = tostring(v30)
                        });
                    end, 
                    currentValue = v25.state.selectedMode, 
                    automaticSize = true, 
                    padding = UDim.new(0, 20), 
                    elementSize = UDim2.new(0, 0, 0, 20)
                })
            })
        });
    end);
end;
return v23;
