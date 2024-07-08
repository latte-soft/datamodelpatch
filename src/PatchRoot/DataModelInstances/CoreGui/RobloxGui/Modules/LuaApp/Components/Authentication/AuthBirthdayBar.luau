local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = game:DefineFastFlag("ShouldEnableAuthBirthdayBarUpdates", false);
local v7 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v12 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v13 = require(l_Modules_0.LuaApp.Experiment.AppBtidLayers);
local v14 = require(l_Modules_0.LuaApp.FitChildren);
local v15 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v16 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local l_AuthStatefulRoundCornerBorder_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.AuthStatefulRoundCornerBorder;
local v18 = if not v6 then require(l_Modules_0.LuaApp.Util.DateHelper) else require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local v19 = require(l_Modules_0.LuaApp.Models.Authentication.Birthday);
local v20 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v21 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForSignUpBirthdayPicker);
local v24 = l_Images_0["icons/actions/calendar"];
local v25 = v3.PureComponent:extend("AuthBirthdayBar");
v25.init = function(v26)
    v26.state = {
        isFocused = false, 
        isHovering = false, 
        selectedBirthday = nil, 
        age = nil
    };
    v26.isMounted = false;
    v26.onBirthdayPickerClose = function(v27)
        local v28 = {
            isFocused = false
        };
        if v27 ~= nil then
            v5.assert(v19.is(v27), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.");
            local l_onBirthdaySelected_0 = v26.props.onBirthdaySelected;
            if l_onBirthdaySelected_0 then
                v26.props.analytics.reportButtonClicked(v20.Context.SinglePageSignUpScreen, v20.Button.ConfirmBirthday);
                l_onBirthdaySelected_0(v27);
            end;
            v28.selectedBirthday = v27;
            if ((v6 and v27.Day ~= nil) and v27.Month ~= nil) and v27.Year ~= nil then
                local l_v27_AgeInYears_0 = v27:GetAgeInYears();
                v28.age = l_v27_AgeInYears_0;
                if not (not (l_v27_AgeInYears_0 ~= nil) or not v26.props.shouldUseBirthdayAgeLabel) then
                    v26.props.analytics.reportAuthFormInteraction(v20.Context.SignupForm, v20.Field.BirthdayAgeLabel, (tostring(l_v27_AgeInYears_0)));
                end;
            end;
        end;
        if v26.props.onBirthdayFocused then
            v26.props.onBirthdayFocused(false);
        end;
        spawn(function()
            if v26.isMounted then
                v26:setState(v28);
            end;
        end);
    end;
    v26.onActivated = function()
        v26.props.analytics.reportFocus(v20.Context.SinglePageSignUpScreen, v20.Field.Birthday);
        v26.props.openCentralOverlayForSignUpBirthdayPicker({
            initialBirthday = v26.state.selectedBirthday, 
            onClose = v26.onBirthdayPickerClose, 
            navigateBackWithoutSelection = v26.props.autoFocusOnMount and not v26.state.selectedBirthday
        });
        if v26.props.onBirthdayFocused then
            v26.props.onBirthdayFocused(true);
        end;
        spawn(function()
            if v26.isMounted then
                v26:setState({
                    isFocused = true
                });
            end;
        end);
    end;
    v26.onMouseEnter = function()
        if v26.isMounted then
            v26:setState({
                isHovering = true
            });
        end;
    end;
    v26.onMouseLeave = function()
        if v26.isMounted then
            v26:setState({
                isHovering = false
            });
        end;
    end;
end;
v25.didMount = function(v31)
    v31.isMounted = true;
    if v31.props.autoFocusOnMount then
        spawn(v31.onActivated);
    end;
end;
v25.willUnmount = function(v32)
    v32.isMounted = false;
end;
v25.render = function(v33)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local l_layoutOrder_0 = v33.props.layoutOrder;
    local l_isFocused_0 = v33.state.isFocused;
    local l_isHovering_0 = v33.state.isHovering;
    local l_selectedBirthday_0 = v33.state.selectedBirthday;
    local v39 = not not l_selectedBirthday_0 and v18.MonthsLocalizationKeys[l_selectedBirthday_0.Month] or nil;
    local v40 = not v6 and "" or tostring(v33.state.age or 0);
    return l_withStyle_0(function(v41)
        return v9({
            monthText = v39, 
            dayAffix = v18.DayAffixLocalizationKey, 
            yearAffix = v18.YearAffixLocalizationKey, 
            titleText = "Authentication.SignUp.Label.Birthday", 
            datePlaceholder = "CommonUI.Controls.Birthdaypicker.Label.Date", 
            titleTextWithAge = if not v6 then nil else {
                "Authentication.SignUp.Label.BirthdayWithAge"; 
                yearsOld = v40
            }
        })(function(v42)
            local l_datePlaceholder_0 = v42.datePlaceholder;
            local l_Color_0 = v41.Theme.UIDefault.Color;
            local l_Transparency_0 = v41.Theme.UIDefault.Transparency;
            local l_Color_1 = v41.Theme.UIDefault.Color;
            local l_Transparency_1 = v41.Theme.UIDefault.Transparency;
            local l_titleText_0 = v42.titleText;
            if not (not (v6 and v33.state.age ~= nil) or not v33.props.shouldUseBirthdayAgeLabel) then
                l_titleText_0 = v42.titleTextWithAge;
            end;
            local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
            if l_selectedBirthday_0 then
                l_datePlaceholder_0 = v18:GetFormattedFullString(v42.monthText, l_selectedBirthday_0.Day, v42.dayAffix, l_selectedBirthday_0.Year, v42.yearAffix, " ", l_RobloxLocaleId_0);
                l_Color_0 = v41.Theme.TextDefault.Color;
                l_Transparency_0 = v41.Theme.TextDefault.Transparency;
            end;
            if not l_isFocused_0 then
                if l_isHovering_0 then
                    l_Color_1 = v41.Theme.IconDefault.Color;
                    l_Transparency_1 = v41.Theme.IconDefault.Transparency;
                    l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Hover;
                end;
            else
                l_Color_1 = v41.Theme.TextDefault.Color;
                l_Transparency_1 = v41.Theme.TextDefault.Transparency;
                l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Focused;
            end;
            return v3.createElement(v14.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v14.FitAxis.Height, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5), 
                    PaddingBottom = UDim.new(0, 5)
                }), 
                Title = v3.createElement(v15, {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v14.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = l_titleText_0, 
                    TextWrapped = true, 
                    Font = v41.Font.CaptionHeader.Font, 
                    TextSize = v41.Font.BaseSize * v41.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v41.Theme.TextEmphasis.Color, 
                    TextTransparency = v41.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                TextInput = v3.createElement(l_AuthStatefulRoundCornerBorder_0, {
                    layoutOrder = 1, 
                    size = UDim2.new(1, 0, 0, 36), 
                    borderState = l_Default_0
                }, {
                    Base = v3.createElement(v16, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Image = "LuaApp/buttons/buttonFill", 
                        ImageColor3 = v41.Theme.BackgroundUIContrast.Color, 
                        ImageTransparency = v41.Theme.BackgroundUIContrast.Transparency, 
                        BorderSizePixel = 0, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9), 
                        [v3.Event.Activated] = v33.onActivated, 
                        [v3.Event.MouseEnter] = v33.onMouseEnter, 
                        [v3.Event.MouseLeave] = v33.onMouseLeave
                    }, {
                        UIPadding = v3.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 0), 
                            PaddingBottom = UDim.new(0, 0), 
                            PaddingLeft = UDim.new(0, 12), 
                            PaddingRight = UDim.new(0, 12)
                        }), 
                        TextLabel = v3.createElement("TextLabel", {
                            Size = UDim2.new(1, -16, 1, 0), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            BackgroundTransparency = 1, 
                            Text = l_datePlaceholder_0, 
                            Font = v41.Font.Body.Font, 
                            TextSize = v41.Font.BaseSize * v41.Font.Body.RelativeSize, 
                            TextColor3 = l_Color_0, 
                            TextTransparency = l_Transparency_0
                        }), 
                        ImageLabel = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, 16, 0, 16), 
                            Position = UDim2.new(1, 0, 0.5, 0), 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            BackgroundTransparency = 1, 
                            Image = v24, 
                            ImageColor3 = l_Color_1, 
                            ImageTransparency = l_Transparency_1
                        })
                    })
                })
            });
        end);
    end);
end;
v25 = v4.connect(nil, function(v50)
    return {
        openCentralOverlayForSignUpBirthdayPicker = function(v51)
            v50(v23(v51));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v21
})(v25)));
if v6 then
    v25 = v12.connectBrowserTrackerLayer({
        v13.SignupLayer
    }, function(v52, _)
        return {
            shouldUseBirthdayAgeLabel = (v52[v13.SignupLayer] or {}).shouldUseBirthdayAgeLabel
        };
    end)(v25);
end;
return v25;
