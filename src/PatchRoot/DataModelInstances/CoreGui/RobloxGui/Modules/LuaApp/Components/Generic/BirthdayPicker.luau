local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local l_TimeUnit_0 = require(l_CorePackages_0.Workspace.Packages.Time).TimeUnit;
local l_DateTime_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateTime;
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local v10 = require(l_Modules_0.LuaApp.Components.Authentication.ScrollingPicker);
local v11 = require(l_Modules_0.LuaApp.Util.DateHelper);
local v12 = {
    Default = "Default", 
    Emphasized = "Emphasized", 
    Muted = "Muted"
};
local v13 = {};
for v14 = 1, 31 do
    table.insert(v13, v14);
end;
local l_ReasonDateInvalid_0 = v11.ReasonDateInvalid;
local l_MonthsLocalizationKeys_0 = v11.MonthsLocalizationKeys;
local l_DateTypeOrder_0 = v11.DateTypeOrder;
local v18 = v3.PureComponent:extend("BirthdayPicker");
v18.defaultProps = {
    minAgeAllowed = 0, 
    maxAgeAllowed = 99
};
v18.init = function(v19)
    v19.isMounted = false;
    local l_Values_0 = l_DateTime_0.now():GetValues();
    v19.currentDate = {
        [l_TimeUnit_0.Months] = v5.isNonNegativeNumber(l_Values_0.Month, "current month in BirthdayPicker"), 
        [l_TimeUnit_0.Days] = v5.isNonNegativeNumber(l_Values_0.Day, "current day in BirthdayPicker"), 
        [l_TimeUnit_0.Years] = v5.isNonNegativeNumber(l_Values_0.Year, "current year in BirthdayPicker")
    };
    local v21 = v19.currentDate[l_TimeUnit_0.Years];
    local l_minAgeAllowed_0 = v19.props.minAgeAllowed;
    local v23 = v21 - v19.props.maxAgeAllowed;
    local v24 = v21 - l_minAgeAllowed_0;
    v19.dummyYears = {};
    for v25 = v23, v24 do
        table.insert(v19.dummyYears, v25);
    end;
    local l_initialMonth_0 = v19.props.initialMonth;
    local l_initialDay_0 = v19.props.initialDay;
    local l_initialYear_0 = v19.props.initialYear;
    local v29 = nil;
    if l_initialYear_0 then
        v29 = (math.clamp(l_initialYear_0, v23, v24) - v23) + 1;
    end;
    v19.state = {
        selectedMonthIndex = l_initialMonth_0 or 1, 
        selectedDayIndex = l_initialDay_0 or 1, 
        selectedYearIndex = v29 or #v19.dummyYears + -1, 
        continueButtonEnabled = true
    };
    v19.renderEntryTextfunction = function(v30, v31)
        return l_withStyle_0(function(v32)
            local l_Font_0 = v32.Font.Body.Font;
            local v34 = v32.Font.BaseSize * v32.Font.Body.RelativeSize;
            local l_Color_0 = v32.Theme.TextDefault.Color;
            local l_Transparency_0 = v32.Theme.TextDefault.Transparency;
            if v31 == v12.Muted then
                l_Color_0 = v32.Theme.TextMuted.Color;
                l_Transparency_0 = v32.Theme.TextMuted.Transparency;
            elseif v31 == v12.Emphasized then
                l_Font_0 = v32.Font.Header1.Font;
                v34 = v32.Font.BaseSize * v32.Font.Header1.RelativeSize;
                l_Color_0 = v32.Theme.TextEmphasis.Color;
                l_Transparency_0 = v32.Theme.TextEmphasis.Transparency;
            end;
            return v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = tostring(v30), 
                Font = l_Font_0, 
                TextSize = v34, 
                TextColor3 = l_Color_0, 
                TextTransparency = l_Transparency_0
            });
        end);
    end;
    v19.onSelectedIndexChangedForMonth = function(v37)
        if v19.state.selectedMonthIndex ~= v37 then
            spawn(function()
                if v19.isMounted then
                    v19:setState({
                        selectedMonthIndex = v37
                    });
                end;
            end);
        end;
    end;
    v19.onSelectedIndexChangedForDay = function(v38)
        if v19.state.selectedDayIndex ~= v38 then
            spawn(function()
                if v19.isMounted then
                    v19:setState({
                        selectedDayIndex = v38
                    });
                end;
            end);
        end;
    end;
    v19.onSelectedIndexChangedForYear = function(v39)
        if v19.state.selectedYearIndex ~= v39 then
            spawn(function()
                if v19.isMounted then
                    v19:setState({
                        selectedYearIndex = v39
                    });
                end;
            end);
        end;
    end;
end;
v18.didMount = function(v40)
    local l_updateBirthday_0 = v40.props.updateBirthday;
    local l_selectedMonthIndex_0 = v40.state.selectedMonthIndex;
    local l_selectedDayIndex_0 = v40.state.selectedDayIndex;
    local v44 = v40.dummyYears[v40.state.selectedYearIndex];
    if l_updateBirthday_0 then
        l_updateBirthday_0(l_selectedMonthIndex_0, l_selectedDayIndex_0, v44);
    end;
    v40.isMounted = true;
end;
v18.willUnmount = function(v45)
    v45.isMounted = false;
end;
v18.updatePickerState = function(v46)
    local l_selectedMonthIndex_1 = v46.state.selectedMonthIndex;
    local l_selectedDayIndex_1 = v46.state.selectedDayIndex;
    local v49 = v46.dummyYears[v46.state.selectedYearIndex];
    local v50 = false;
    local v51, v52 = v11:isValidDate(l_selectedMonthIndex_1, l_selectedDayIndex_1, v49);
    if not v51 and v52 == l_ReasonDateInvalid_0.IsInvalidDayOfMonth then
        v50 = true;
        l_selectedDayIndex_1 = v11:getLastDayOfTheMonthInYear(l_selectedMonthIndex_1, v49);
    end;
    spawn(function()
        if v46.isMounted then
            v46:setState({
                selectedDayIndex = not not v50 and l_selectedDayIndex_1 or nil, 
                continueButtonEnabled = v51
            });
        end;
    end);
end;
v18.didUpdate = function(v53)
    local l_updateBirthday_1 = v53.props.updateBirthday;
    local l_selectedMonthIndex_2 = v53.state.selectedMonthIndex;
    local l_selectedDayIndex_2 = v53.state.selectedDayIndex;
    local v57 = v53.dummyYears[v53.state.selectedYearIndex];
    if v11:isValidDate(l_selectedMonthIndex_2, l_selectedDayIndex_2, v57) ~= v53.state.continueButtonEnabled then
        v53:updatePickerState();
    end;
    if l_updateBirthday_1 then
        l_updateBirthday_1(l_selectedMonthIndex_2, l_selectedDayIndex_2, v57);
    end;
end;
v18.render = function(v58)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v60 = l_DateTypeOrder_0[l_RobloxLocaleId_0];
    local l_layoutOrder_0 = v58.props.layoutOrder;
    local l_selectedMonthIndex_3 = v58.state.selectedMonthIndex;
    local l_selectedDayIndex_3 = v58.state.selectedDayIndex;
    local l_selectedYearIndex_0 = v58.state.selectedYearIndex;
    return l_withStyle_0(function(_)
        return v9({
            continueText = "Authentication.SignUp.Label.Continue"
        })(function(_)
            return v3.createElement(v4.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v4.FitAxis.Height, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 14)
                }), 
                DatePickerWrap = v3.createElement(v4.FitFrame, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v4.FitAxis.Height, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    CenterFrame = v3.createElement("ImageLabel", {
                        Size = UDim2.new(1, 0, 0, 50), 
                        Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/DatePickerDivider.png", 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(2, 2, 4, 4), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ZIndex = 2
                    }), 
                    DatePicker = v3.createElement(v4.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v4.FitAxis.Height, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        ListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        WheelContainer = v3.createElement(v4.FitFrame, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v4.FitAxis.Height, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true
                        }, {
                            ListLayout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Horizontal, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Padding = v3.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 5), 
                                PaddingRight = UDim.new(0, 5), 
                                PaddingTop = UDim.new(0, 5), 
                                PaddingBottom = UDim.new(0, 5)
                            }), 
                            MonthWheel = v3.createElement(v10, {
                                layoutOrder = v60[l_TimeUnit_0.Months], 
                                size = UDim2.new(0.45, 0, 0, 200), 
                                renderEntry = function(v67)
                                    return l_withStyle_0(function(_)
                                        return v9({
                                            monthText = v67
                                        })(function(v69)
                                            local l_selectedMonthIndex_4 = v58.state.selectedMonthIndex;
                                            local l_Default_0 = v12.Default;
                                            if v67 == l_MonthsLocalizationKeys_0[l_selectedMonthIndex_4] then
                                                l_Default_0 = v12.Emphasized;
                                            end;
                                            return v58.renderEntryTextfunction(v69.monthText, l_Default_0);
                                        end);
                                    end);
                                end, 
                                entries = l_MonthsLocalizationKeys_0, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v58.onSelectedIndexChangedForMonth, 
                                parentSpecifiedTarget = l_selectedMonthIndex_3
                            }), 
                            DayWheel = v3.createElement(v10, {
                                layoutOrder = v60[l_TimeUnit_0.Days], 
                                size = UDim2.new(0.2, 0, 0, 200), 
                                renderEntry = function(v72)
                                    return v9({
                                        dayAffix = v11.DayAffixLocalizationKey
                                    })(function(v73)
                                        local l_selectedMonthIndex_5 = v58.state.selectedMonthIndex;
                                        local v75 = v58.dummyYears[v58.state.selectedYearIndex];
                                        local l_selectedDayIndex_4 = v58.state.selectedDayIndex;
                                        local l_v11_FormattedDayString_0 = v11:GetFormattedDayString(v72, v73.dayAffix, l_RobloxLocaleId_0);
                                        local l_Default_1 = v12.Default;
                                        if not v11:isInvalidDayOfTheMonth(l_selectedMonthIndex_5, v72, v75) then
                                            if v72 == l_selectedDayIndex_4 then
                                                l_Default_1 = v12.Emphasized;
                                            end;
                                        else
                                            l_Default_1 = v12.Muted;
                                        end;
                                        return v58.renderEntryTextfunction(l_v11_FormattedDayString_0, l_Default_1);
                                    end);
                                end, 
                                entries = v13, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v58.onSelectedIndexChangedForDay, 
                                parentSpecifiedTarget = l_selectedDayIndex_3
                            }), 
                            YearWheel = v3.createElement(v10, {
                                layoutOrder = v60[l_TimeUnit_0.Years], 
                                size = UDim2.new(0.35, 0, 0, 200), 
                                renderEntry = function(v79)
                                    return v9({
                                        yearAffix = v11.YearAffixLocalizationKey
                                    })(function(v80)
                                        local v81 = v58.dummyYears[v58.state.selectedYearIndex];
                                        local l_v11_FormattedYearString_0 = v11:GetFormattedYearString(v79, v80.yearAffix, l_RobloxLocaleId_0);
                                        local l_Default_2 = v12.Default;
                                        if v79 == v81 then
                                            l_Default_2 = v12.Emphasized;
                                        end;
                                        return v58.renderEntryTextfunction(l_v11_FormattedYearString_0, l_Default_2);
                                    end);
                                end, 
                                entries = v58.dummyYears, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v58.onSelectedIndexChangedForYear, 
                                parentSpecifiedTarget = l_selectedYearIndex_0
                            })
                        })
                    })
                })
            });
        end);
    end);
end;
return v18;
