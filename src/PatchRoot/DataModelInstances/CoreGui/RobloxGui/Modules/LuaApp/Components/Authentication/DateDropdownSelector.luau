local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v5 = require(l_Modules_0.LuaApp.Components.Common.AppDropdownMenu);
local l_DateHelper_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local l_TimeUnit_0 = require(l_CorePackages_0.Workspace.Packages.Time).TimeUnit;
local v8 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = game:DefineFastFlag("FixMissingBirthdayTranslations", false);
local l_DateTypeOrder_0 = l_DateHelper_0.DateTypeOrder;
local v12 = {
    [Enum.HorizontalAlignment.Left] = Vector2.new(0, 0), 
    [Enum.HorizontalAlignment.Center] = Vector2.new(0.5, 0), 
    [Enum.HorizontalAlignment.Right] = Vector2.new(1, 0)
};
local v13 = {
    [Enum.HorizontalAlignment.Left] = UDim2.fromScale(0, 0), 
    [Enum.HorizontalAlignment.Center] = UDim2.fromScale(0.5, 0), 
    [Enum.HorizontalAlignment.Right] = UDim2.fromScale(1, 0)
};
return function(v14)
    local v15 = l_useStyle_0();
    local v16 = v8({
        titleText = v14.titleKey, 
        subTitleText = v14.subTitleKey, 
        errorText = v14.errorTextKey, 
        yearText = if not v10 then nil else "CommonUI.Controls.Label.Year", 
        monthText = if not v10 then nil else "CommonUI.Controls.Label.Month", 
        dayText = if not v10 then nil else "CommonUI.Controls.Label.Day"
    });
    local v18 = l_useSelector_0(function(v17)
        return v17.ScreenSize or Vector2.new(1920, 1080);
    end);
    local v19, v20 = v3.useState(0);
    local v21, v22 = v3.useState(0);
    local v23, v24 = v3.useState(0);
    local v27 = v3.useCallback(function(v25)
        local v26 = tonumber(v25);
        if v26 then
            v20(v26);
        end;
        v14.onDateSelected({
            [l_TimeUnit_0.Years] = v26, 
            [l_TimeUnit_0.Months] = v21, 
            [l_TimeUnit_0.Days] = v23
        });
    end, {
        v14.onDateSelected, 
        v21, 
        v23
    });
    local v30 = v3.useCallback(function(v28)
        local v29 = tonumber(v28);
        if v29 then
            v22(v29);
        end;
        v14.onDateSelected({
            [l_TimeUnit_0.Years] = v19, 
            [l_TimeUnit_0.Months] = v29, 
            [l_TimeUnit_0.Days] = v23
        });
    end, {
        v14.onDateSelected, 
        v19, 
        v23
    });
    local v33 = v3.useCallback(function(v31)
        local v32 = tonumber(v31);
        if v32 then
            v24(v32);
        end;
        v14.onDateSelected({
            [l_TimeUnit_0.Years] = v19, 
            [l_TimeUnit_0.Months] = v21, 
            [l_TimeUnit_0.Days] = v32
        });
    end, {
        v14.onDateSelected, 
        v19, 
        v21
    });
    local v39 = v3.useMemo(function()
        local v34 = l_DateHelper_0:getCurrentDate();
        local v35 = {};
        local v36 = v14.maxYear or v34[l_TimeUnit_0.Years];
        local v37 = v14.minYear or v36 - 100;
        for v38 = v36, v37, -1 do
            table.insert(v35, {
                key = tostring(v38), 
                text = tostring(v38)
            });
        end;
        return v35;
    end, {
        v14.minYear, 
        v14.maxYear
    });
    local v42 = v3.useMemo(function()
        local v40 = {};
        for v41 = 1, 12 do
            table.insert(v40, {
                key = tostring(v41), 
                text = tostring(v41)
            });
        end;
        return v40;
    end);
    local v45 = v3.useMemo(function()
        local v43 = {};
        for v44 = 1, 31 do
            table.insert(v43, {
                key = tostring(v44), 
                text = tostring(v44)
            });
        end;
        return v43;
    end);
    local v46 = l_DateTypeOrder_0[l_LocalizationService_0.RobloxLocaleId];
    local v47 = if not v14.designTokens then {
        textCaptionHeaderSize = v15.Font.BaseSize * v15.Font.CaptionHeader.RelativeSize, 
        textBodySize = v15.Font.BaseSize * v15.Font.Body.RelativeSize, 
        dropdownHeight = 72, 
        dropdownHorizontalPadding = 36, 
        dropdownVerticalPadding = 24, 
        dateDropdownWidth = 156
    } else v14.designTokens;
    local v48 = v14.alignment or Enum.HorizontalAlignment.Left;
    return v3.createElement("Frame", {
        Size = v14.size, 
        AnchorPoint = v12[v48], 
        Position = v13[v48], 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v14.layoutOrder
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v47.dropdownVerticalPadding)
        }), 
        Title = if not v14.titleKey then nil else v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v15.Font.CaptionHeader.Font, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0), 
            Text = v16.titleText, 
            TextColor3 = v15.Theme.TextEmphasis.Color, 
            TextSize = v47.textCaptionHeaderSize, 
            TextTransparency = v15.Theme.TextEmphasis.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY
        }), 
        BirthdayPicker = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v47.dropdownHeight), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            ZIndex = 2
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = if not v14.horizontalInnerPadding then UDim.new(0, v47.dropdownHorizontalPadding) else v14.horizontalInnerPadding
            }), 
            YearPicker = v3.createElement("Frame", {
                Size = UDim2.new(0.25, 0, 0, v47.dropdownHeight), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v46[l_TimeUnit_0.Years], 
                ZIndex = 2
            }, {
                YearDropdownMenu = v3.createElement(v5, {
                    height = UDim.new(0, v47.dropdownHeight), 
                    placeholder = not v10 and "Year" or v16.yearText, 
                    screenSize = v18, 
                    showDropShadow = true, 
                    fixedListHeight = v14.fixedListHeight, 
                    onChange = v27, 
                    cellDatas = v39, 
                    analyticsContext = "YearDropdownMenu", 
                    selectionGroupName = "YearDropdownMenu"
                })
            }), 
            MonthPicker = v3.createElement("Frame", {
                Size = UDim2.new(0.25, 0, 0, v47.dropdownHeight), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v46[l_TimeUnit_0.Months], 
                ZIndex = 2
            }, {
                MonthDropdownMenu = v3.createElement(v5, {
                    height = UDim.new(0, v47.dropdownHeight), 
                    placeholder = not v10 and "Month" or v16.monthText, 
                    screenSize = v18, 
                    showDropShadow = true, 
                    fixedListHeight = v14.fixedListHeight, 
                    onChange = v30, 
                    cellDatas = v42, 
                    analyticsContext = "MonthDropdownMenu", 
                    selectionGroupName = "MonthDropdownMenu"
                })
            }), 
            DayPicker = v3.createElement("Frame", {
                Size = UDim2.new(0.25, 0, 0, v47.dropdownHeight), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v46[l_TimeUnit_0.Days], 
                ZIndex = 2
            }, {
                DayDropdownMenu = v3.createElement(v5, {
                    height = UDim.new(0, v47.dropdownHeight), 
                    placeholder = not v10 and "Day" or v16.dayText, 
                    screenSize = v18, 
                    showDropShadow = true, 
                    fixedListHeight = v14.fixedListHeight, 
                    onChange = v33, 
                    cellDatas = v45, 
                    analyticsContext = "DayDropdownMenu", 
                    selectionGroupName = "DayDropdownMenu"
                })
            })
        }), 
        OptionalTitle = if not v14.subTitleKey then nil else v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v15.Font.CaptionHeader.Font, 
            LayoutOrder = 3, 
            Size = UDim2.fromScale(1, 0), 
            Text = v16.subTitleText, 
            TextColor3 = v15.Theme.TextDefault.Color, 
            TextSize = v47.textBodySize, 
            TextTransparency = v15.Theme.TextDefault.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY
        }), 
        ErrorTitle = if not v14.errorTextKey then nil else v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v15.Font.CaptionHeader.Font, 
            LayoutOrder = 4, 
            Size = UDim2.fromScale(1, 0), 
            Text = v16.errorText, 
            TextColor3 = v15.Theme.Alert.Color, 
            TextSize = v47.textBodySize, 
            TextTransparency = v15.Theme.Alert.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY
        })
    });
end;
