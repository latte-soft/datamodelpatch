local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled");
local v5 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_UIBlox_0 = v5.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v13 = require(l_CoreGui_0.RobloxGui.Modules.DevConsoleMaster);
local l_Parent_0 = script.Parent.Parent.Parent;
local v15 = require(l_Parent_0.Components.Divider);
local v16 = require(l_Parent_0.Utility.ExternalEventConnection);
local v17 = require(script.Parent.Parent.Page);
local v18 = require(script.Parent.CategoryHeader);
local v19 = require(script.Parent.ToggleEntry);
local v20 = require(script.Parent.VersionReporter);
local v21 = require(l_Parent_0.Thunks.CloseMenu);
local v22 = require(script.Parent.Parent.Connection.FocusHandler);
local v23 = require(l_Parent_0.Localization.withLocalization);
local v24 = require(l_Parent_0.Utility.SendAnalytics);
local v25 = require(l_Parent_0.Resources.Constants);
local v26 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v27 = l_Roact_0.PureComponent:extend("AdvancedPage");
v27.validateProps = l_t_0.strictInterface({
    canCaptureFocus = l_t_0.boolean, 
    closeMenu = l_t_0.callback, 
    pageTitle = l_t_0.string, 
    currentPage = not not v26() and l_t_0.string or nil, 
    currentZone = not not v26() and l_t_0.optional(l_t_0.number) or nil
});
v27.init = function(v28)
    v28:setState({
        microProfilerEnabled = l_UserGameSettings_0.OnScreenProfilerEnabled, 
        performanceStatsEnabled = l_UserGameSettings_0.PerformanceStatsVisible
    });
    v28.backButtonRef = l_Roact_0.createRef();
    v28.performanceToggleRef = l_Roact_0.createRef();
end;
if not v26() then
    v27.didUpdate = function(v29, v30)
        if not (not v29.props.canCaptureFocus or v30.canCaptureFocus) then
            l_GuiService_0.SelectedCoreObject = v29.performanceToggleRef:getValue();
        end;
    end;
end;
v27.renderWithSelectionCursor = function(v31, v32)
    return l_withStyle_0(function(v33)
        local l_createElement_0 = l_Roact_0.createElement;
        local l_v17_0 = v17;
        local v36 = {
            pageTitle = v31.props.pageTitle, 
            zIndex = 2, 
            position = v31.props.position, 
            buttonRef = v31.backButtonRef, 
            NextSelectionDown = v31.performanceToggleRef
        };
        local v37 = {};
        local v38;
        if v26() then
            v38 = l_Roact_0.createElement;
            local l_v22_0 = v22;
            local v40 = {
                isFocused = v31.props.canCaptureFocus
            };
            local v41 = true;
            if v31.props.currentPage == v25.advancedSettingsPageKey then
                v41 = v31.props.currentZone == 0;
            end;
            v40.shouldForgetPreviousSelection = v41;
            v40.didFocus = function(v42)
                l_GuiService_0.SelectedCoreObject = v42 or v31.performanceToggleRef:getValue();
            end;
            v38 = v38(l_v22_0, v40);
            if v38 then
                goto label0;
            end;
        end;
        v38 = nil;
        ::label0::;
        v37.FocusHandler = v38;
        v37.Layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        });
        v37.AdvancedHeader = l_Roact_0.createElement(v18, {
            LayoutOrder = 1, 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.AdvancedSettingsTitle"
        });
        v37.PerformanceStats = l_Roact_0.createElement(v19, {
            LayoutOrder = 2, 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats", 
            checked = v31.state.performanceStatsEnabled, 
            onToggled = function()
                l_UserGameSettings_0.PerformanceStatsVisible = not l_UserGameSettings_0.PerformanceStatsVisible;
                v24(v25.AnalyticsSettingsChangeName, nil, {}, true);
            end, 
            buttonRef = v31.performanceToggleRef, 
            NextSelectionUp = v31.backButtonRef
        });
        v37.MicroProfiler = l_Roact_0.createElement(v19, {
            LayoutOrder = 3, 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ShowMicroProfiler", 
            checked = v31.state.microProfilerEnabled, 
            onToggled = function()
                l_UserGameSettings_0.OnScreenProfilerEnabled = not l_UserGameSettings_0.OnScreenProfilerEnabled;
                v24(v25.AnalyticsSettingsChangeName, nil, {}, true);
            end
        });
        v37.DeveloperConsole = v23({
            text = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole"
        })(function(v43)
            return l_Roact_0.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 54), 
                Text = v43.text, 
                TextColor3 = v33.Theme.TextEmphasis.Color, 
                Font = v33.Font.Header2.Font, 
                TextSize = v33.Font.Header2.RelativeSize * v33.Font.BaseSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 4, 
                SelectionImageObject = v32(l_CursorKind_0.Square), 
                [l_Roact_0.Event.Activated] = function()
                    v13:SetVisibility(true);
                    v31.props.closeMenu();
                end
            }, {
                Padding = l_Roact_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24)
                })
            });
        end);
        v37.Divider = l_Roact_0.createElement(v15, {
            Size = UDim2.new(1, -24, 0, 1), 
            LayoutOrder = 5
        });
        v37.VersionReporter = l_Roact_0.createElement(v20, {
            LayoutOrder = 6
        });
        v37.MicroProfilerVisibilityListener = l_Roact_0.createElement(v16, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function()
                v31:setState({
                    microProfilerEnabled = l_UserGameSettings_0.OnScreenProfilerEnabled
                });
            end
        });
        v37.PerformanceStatsVisibilityListener = l_Roact_0.createElement(v16, {
            event = l_UserGameSettings_0.PerformanceStatsVisibleChanged, 
            callback = function()
                v31:setState({
                    performanceStatsEnabled = l_UserGameSettings_0.PerformanceStatsVisible
                });
            end
        });
        return l_createElement_0(l_v17_0, v36, v37);
    end);
end;
v27.render = function(v44)
    return l_withSelectionCursorProvider_0(function(v45)
        return v44:renderWithSelectionCursor(v45);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v46)
    local v47 = false;
    if v46.menuPage == "AdvancedGameSettings" then
        v47 = false;
        if v46.displayOptions.inputType == v25.InputType.Gamepad then
            v47 = not v46.respawn.dialogOpen and v46.currentZone == 1;
        end;
    end;
    local v48 = nil;
    if v26() then
        v48 = v46.currentZone;
    end;
    return {
        canCaptureFocus = v47, 
        currentPage = not not v26() and v46.menuPage or nil, 
        currentZone = v48
    };
end, function(v49)
    return {
        closeMenu = function()
            v49(v21);
        end
    };
end)(v27);
