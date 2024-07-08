local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v4 = require(l_CorePackages_0.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_Toggle_0 = v9.App.InputButton.Toggle;
local l_ContextualSlider_0 = v9.App.Slider.ContextualSlider;
local v13 = require(l_Modules_0.LuaApp.Constants);
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v16 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v17 = require(l_Modules_0.LuaApp.Analytics.Events.changeAccessibilitySettingFromApp);
local v18 = require(l_Modules_0.LuaApp.Components.More.AccessibilityPageSetting);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUiNavigationKeyBindSettingInAppShellSettings);
local v20 = v4.PureComponent:extend("AccessibilityPageContent");
v20.validateProps = v8.strictInterface({
    formFactor = v8.string, 
    platform = v8.EnumItem, 
    roactAnalytics = v8.union(v8.Instance, v8.table)
});
v20.eventDisconnect = function(v21)
    if v21.onReducedMotionChangedSignal then
        v21.onReducedMotionChangedSignal:Disconnect();
        v21.onReducedMotionChangedSignal = nil;
    end;
    if v21.onPreferredTransparencyChangedSignal then
        v21.onPreferredTransparencyChangedSignal:Disconnect();
        v21.onPreferredTransparencyChangedSignal = nil;
    end;
    if v21.onUiNavigationKeyBindEnabledChanged then
        v21.onUiNavigationKeyBindEnabledChanged:Disconnect();
        v21.onUiNavigationKeyBindEnabledChanged = nil;
    end;
    if v21.onKeyboardEnabledChangedSignal then
        v21.onKeyboardEnabledChangedSignal:Disconnect();
        v21.onKeyboardEnabledChangedSignal = nil;
    end;
end;
v20.init = function(v22)
    local function _(v23)
        return 10 - math.clamp(math.floor(v23 * 10 + 0.5), 0, 10);
    end;
    v22.state = {
        keyboardEnabled = l_UserInputService_0.KeyboardEnabled, 
        reducedMotionEnabled = l_UserGameSettings_0.ReducedMotion, 
        preferredTransparencyValue = 10 - math.clamp(math.floor(l_UserGameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10), 
        uiNavigationKeyBindEnabled = l_UserGameSettings_0.UiNavigationKeyBindEnabled
    };
    v22.onReducedMotionActivated = function()
        local l_reducedMotionEnabled_0 = v22.state.reducedMotionEnabled;
        local v26 = not v22.state.reducedMotionEnabled;
        l_UserGameSettings_0.ReducedMotion = v26;
        v17(v22.props.roactAnalytics.EventStream, v16.Context.AccessibilitySettingsPage, "ReducedMotion", tostring(l_reducedMotionEnabled_0), (tostring(v26)));
    end;
    v22.onReducedMotionChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
        v22:setState({
            reducedMotionEnabled = l_UserGameSettings_0.ReducedMotion
        });
    end);
    v22.onPreferredTransparencyValueChanged = function(v27)
        local l_PreferredTransparency_0 = l_UserGameSettings_0.PreferredTransparency;
        local v29 = (10 - math.clamp(math.floor(v27), 0, 10)) / 10;
        l_UserGameSettings_0.PreferredTransparency = v29;
        v17(v22.props.roactAnalytics.EventStream, v16.Context.AccessibilitySettingsPage, "PreferredTransparency", tostring(l_PreferredTransparency_0), (tostring(v29)));
    end;
    v22.onPreferredTransparencyChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
        v22:setState({
            preferredTransparencyValue = 10 - math.clamp(math.floor(l_UserGameSettings_0.PreferredTransparency * 10 + 0.5), 0, 10)
        });
    end);
    v22.onUiNavigationKeyBindActivated = function()
        local l_uiNavigationKeyBindEnabled_0 = v22.state.uiNavigationKeyBindEnabled;
        local v31 = not v22.state.uiNavigationKeyBindEnabled;
        l_UserGameSettings_0.UiNavigationKeyBindEnabled = v31;
        v17(v22.props.roactAnalytics.EventStream, v16.Context.AccessibilitySettingsPage, "UiNavigationKeyBind", tostring(l_uiNavigationKeyBindEnabled_0), (tostring(v31)));
    end;
    v22.onUiNavigationKeyBindEnabledChanged = l_UserGameSettings_0:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function()
        v22:setState({
            uiNavigationKeyBindEnabled = l_UserGameSettings_0.UiNavigationKeyBindEnabled
        });
    end);
    v22.onKeyboardEnabledChangedSignal = l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
        v22:setState({
            keyboardEnabled = l_UserInputService_0.KeyboardEnabled
        });
    end);
end;
local function v34(v32)
    local l_style_0 = v32.style;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_style_0.Theme.Divider.Color, 
        BackgroundTransparency = l_style_0.Theme.Divider.Transparency, 
        LayoutOrder = v32.layoutOrder
    });
end;
v20.renderWithProviders = function(v35, v36, _, v38)
    local v39 = v35.props.formFactor == l_FormFactor_0.WIDE;
    local v40 = v19() and v35.state.keyboardEnabled;
    local l_BaseSize_0 = v38.Font.BaseSize;
    local v42 = l_BaseSize_0 * v38.Font.Body.RelativeSize;
    local v43 = l_BaseSize_0 * v38.Font.CaptionBody.RelativeSize;
    local l_Font_0 = v38.Font.Body.Font;
    local l_Font_1 = v38.Font.CaptionBody.Font;
    return v4.createFragment({
        Frame = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 25)
            }), 
            SettingDescriptionText = v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v36.accessibilityDescription, 
                Font = l_Font_0, 
                TextSize = v42, 
                TextColor3 = v38.Theme.TextDefault.Color, 
                TextTransparency = v38.Theme.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true
            })
        }), 
        ReducedMotion = v4.createElement(v18, {
            style = v38, 
            header = v36.reducedMotionHeader, 
            description = v36.reducedMotionDescription, 
            layoutOrder = 1, 
            Control = v4.createElement(l_Toggle_0, {
                isSelected = v35.state.reducedMotionEnabled, 
                onActivated = v35.onReducedMotionActivated
            })
        }), 
        Divider1 = v34({
            style = v38, 
            layoutOrder = 2
        }), 
        PreferredTransparency = v4.createElement(v18, {
            style = v38, 
            header = v36.preferredTransparencyHeader, 
            description = v36.preferredTransparencyDescription, 
            layoutOrder = 3, 
            topToBottom = not v39, 
            Control = v4.createElement("Frame", {
                Size = if not v39 then UDim2.fromScale(1, 0) else UDim2.new(0, 250, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Layout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.Name, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v13.MORE_PAGE_SECTION_PADDING)
                }), 
                ContextualSlider = v4.createElement(l_ContextualSlider_0, {
                    width = UDim.new(1, 0), 
                    min = 0, 
                    max = 10, 
                    value = v35.state.preferredTransparencyValue, 
                    onValueChanged = v35.onPreferredTransparencyValueChanged
                }), 
                Frame = v4.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, -10)
                    }), 
                    LeftText = v4.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v36.preferredTransparencyTransparent, 
                        Font = l_Font_1, 
                        TextSize = v43, 
                        TextColor3 = v38.Theme.TextMuted.Color, 
                        TextTransparency = v38.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    RightText = v4.createElement("TextLabel", {
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v36.preferredTransparencyOpaque, 
                        Font = l_Font_1, 
                        TextSize = v43, 
                        TextColor3 = v38.Theme.TextMuted.Color, 
                        TextTransparency = v38.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Right, 
                        LayoutOrder = 2
                    })
                })
            })
        }), 
        Divider2 = if not v40 then nil else v34({
            style = v38, 
            layoutOrder = 4
        }), 
        UiNavigationKeyBind = if not v40 then nil else v4.createElement(v18, {
            style = v38, 
            header = v36.uiNavigationKeyBindHeader, 
            description = v36.uiNavigationKeyBindDescription, 
            layoutOrder = 5, 
            Control = v4.createElement(l_Toggle_0, {
                isSelected = v35.state.uiNavigationKeyBindEnabled, 
                onActivated = v35.onUiNavigationKeyBindActivated
            })
        })
    });
end;
v20.render = function(v46)
    return v14({
        accessibilityDescription = "Feature.Accessibility.Description.Main", 
        reducedMotionHeader = "Feature.Accessibility.Heading.ReducedMotion", 
        reducedMotionDescription = "Feature.Accessibility.Description.ReducedMotion", 
        preferredTransparencyHeader = "Feature.Accessibility.Heading.PreferredTransparency", 
        preferredTransparencyDescription = "Feature.Accessibility.Description.PreferredTransparency", 
        preferredTransparencyOpaque = "Feature.Accessibility.PreferredTransparency.Opaque", 
        preferredTransparencyTransparent = "Feature.Accessibility.PreferredTransparency.Transparent", 
        uiNavigationKeyBindHeader = "Feature.Accessibility.Heading.UiNavigationKeyBind", 
        uiNavigationKeyBindDescription = {
            "Feature.Accessibility.Description.UiNavigationKeyBind"; 
            uiNavigationKey = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        }
    })(function(v47)
        return l_withStyle_0(function(v48)
            return v46:renderWithProviders(v47, v48.Theme.BackgroundDefault, v48);
        end);
    end);
end;
v20.willUnmount = function(v49)
    v49:eventDisconnect();
end;
return l_RoactServices_0.connect({
    roactAnalytics = v6
})((v7.connect(function(v50, _)
    return {
        formFactor = v50.FormFactor, 
        platform = v50.Platform
    };
end)(v20)));
