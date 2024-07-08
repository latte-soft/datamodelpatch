local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v4 = require(l_Modules_0.LuaApp.Components.Common.AppDropdownMenu);
local v5 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = require(l_Modules_0.LuaApp.Enum.UserGender);
local v9 = {
    [Enum.HorizontalAlignment.Left] = Vector2.new(0, 0), 
    [Enum.HorizontalAlignment.Center] = Vector2.new(0.5, 0), 
    [Enum.HorizontalAlignment.Right] = Vector2.new(1, 0)
};
local v10 = {
    [Enum.HorizontalAlignment.Left] = UDim2.fromScale(0, 0), 
    [Enum.HorizontalAlignment.Center] = UDim2.fromScale(0.5, 0), 
    [Enum.HorizontalAlignment.Right] = UDim2.fromScale(1, 0)
};
return function(v11)
    local v12 = l_useStyle_0();
    local v13 = v5({
        titleText = "Authentication.SignUp.Label.Gender", 
        optionalText = "Authentication.SignUp.Label.OptionalGenderShort", 
        maleText = "Authentication.SignUp.Label.GenderMale", 
        femaleText = "Authentication.SignUp.Label.GenderFemale"
    });
    local v15 = l_useSelector_0(function(v14)
        return v14.ScreenSize or Vector2.new(1920, 1080);
    end);
    local l_SignUpView_0 = l_useDesignTokens_0().LuaApps.SignUpView;
    local l_dropdownHeight_0 = l_SignUpView_0.dropdownHeight;
    local l_dropdownVerticalPadding_0 = l_SignUpView_0.dropdownVerticalPadding;
    local v19 = v11.alignment or Enum.HorizontalAlignment.Left;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 270, 1, 0), 
        AnchorPoint = v9[v19], 
        Position = v10[v19], 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v11.layoutOrder
    }, {
        ListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, l_dropdownVerticalPadding_0)
        }), 
        Title = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 6)
            }), 
            MainTitle = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v12.Font.CaptionHeader.Font, 
                LayoutOrder = 1, 
                Size = UDim2.fromScale(0, 0), 
                Text = v13.titleText, 
                TextColor3 = v12.Theme.TextEmphasis.Color, 
                TextSize = l_SignUpView_0.textCaptionHeaderSize, 
                TextTransparency = v12.Theme.TextEmphasis.Transparency, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY
            }), 
            OptionalTitle = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v12.Font.Footer.Font, 
                LayoutOrder = 2, 
                Size = UDim2.fromScale(0, 0), 
                Text = "(" .. v13.optionalText .. ")", 
                TextColor3 = v12.Theme.TextMuted.Color, 
                TextSize = l_SignUpView_0.textSmallSize, 
                TextTransparency = v12.Theme.TextMuted.Transparency, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY
            })
        }), 
        GenderPicker = v2.createElement("Frame", {
            Size = UDim2.new(0, 270, 0, l_dropdownHeight_0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            ZIndex = 2
        }, {
            GenderDropdownMenu = v2.createElement(v4, {
                height = UDim.new(0, l_dropdownHeight_0), 
                placeholder = "--", 
                screenSize = v15, 
                showDropShadow = true, 
                onChange = v11.onGenderChanged, 
                cellDatas = {
                    {
                        key = v8.Male, 
                        text = v13.maleText
                    }, 
                    {
                        key = v8.Female, 
                        text = v13.femaleText
                    }, 
                    {
                        key = v8.Unknown, 
                        text = "--"
                    }
                }, 
                analyticsContext = "GenderDropdownMenu", 
                selectionGroupName = "GenderDropdownMenu"
            })
        })
    });
end;
