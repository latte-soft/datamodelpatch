local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v2 = require(l_CorePackages_0.Packages.LuauPolyfill);
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_t_0 = v3.t;
local l_SegmentedControl_0 = v3.UIBlox.App.Control.SegmentedControl;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Components.ThemedTextLabel);
local l_l_GameSettings_0_PropertyChangedSignal_0 = l_GameSettings_0:GetPropertyChangedSignal("VRComfortSetting");
local v10 = require(l_Parent_0.Utility.ExternalEventConnection);
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = require(l_Parent_0.Utility.SendAnalytics);
local v13 = require(l_Parent_0.Resources.Constants);
local v14 = {
    Description = "CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription", 
    ["Enum.VRComfortSetting.Comfort"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingComfort", 
    ["Enum.VRComfortSetting.Normal"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingNormal", 
    ["Enum.VRComfortSetting.Expert"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingExpert", 
    ["Enum.VRComfortSetting.Custom"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingCustom"
};
local l_EnumItems_0 = Enum.VRComfortSetting:GetEnumItems();
local function _(v16)
    return v2.Array.indexOf(l_EnumItems_0, v16);
end;
local function _(v18)
    local v19 = l_EnumItems_0[v18];
    l_GameSettings_0.VRComfortSetting = v19;
    v12(v13.AnalyticsSettingsChangeName, v13.AnalyticsSettingsVRComfortSettingChangeName, {
        mode = tostring(v19)
    });
end;
local v21 = v4.PureComponent:extend("ComfortSettingsEntry");
v21.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.integer)
});
v21.init = function(v22)
    v22:setState({
        selectedMode = v2.Array.indexOf(l_EnumItems_0, l_GameSettings_0.VRComfortSetting)
    });
end;
v21.render = function(v23)
    return v11(v14)(function(v24)
        return v4.createFragment({
            VRComfortSettingListener = v4.createElement(v10, {
                event = l_l_GameSettings_0_PropertyChangedSignal_0, 
                callback = function()
                    v23:setState({
                        selectedMode = v2.Array.indexOf(l_EnumItems_0, l_GameSettings_0.VRComfortSetting)
                    });
                end
            }), 
            ComfortSettingEntrySelector = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v23.props.LayoutOrder, 
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
                InputDescription = v4.createElement(v8, {
                    themeKey = "TextDefault", 
                    fontKey = "CaptionHeader", 
                    Text = v24.Description, 
                    Size = UDim2.new(0.9, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    LayoutOrder = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Frame = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    SegmentedControl = v4.createElement(l_SegmentedControl_0, {
                        width = UDim.new(1, 0), 
                        selectedTabIndex = v23.state.selectedMode, 
                        onTabActivated = function(v25)
                            local v26 = l_EnumItems_0[v25];
                            l_GameSettings_0.VRComfortSetting = v26;
                            v12(v13.AnalyticsSettingsChangeName, v13.AnalyticsSettingsVRComfortSettingChangeName, {
                                mode = tostring(v26)
                            });
                        end, 
                        tabs = v2.Array.map(l_EnumItems_0, function(v27, _)
                            return {
                                tabName = v24[tostring(v27)]
                            };
                        end)
                    })
                })
            })
        });
    end);
end;
return v21;
