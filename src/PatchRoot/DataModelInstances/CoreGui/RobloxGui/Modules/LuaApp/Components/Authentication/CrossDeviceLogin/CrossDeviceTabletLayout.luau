local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
return function(v5)
    local v6 = l_useDesignTokens_0();
    local l_Font_0 = v6.LuaApps.CrossDeviceLogin.layoutHeaderFont.Font;
    local l_FontSize_0 = v6.LuaApps.CrossDeviceLogin.layoutHeaderFont.FontSize;
    return v2.createFragment({
        Align = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 16), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        TabletHeader = not v5.HighKeyboardMode and v2.createElement("TextLabel", {
            Font = l_Font_0, 
            TextSize = l_FontSize_0, 
            TextColor3 = v6.LuaApps.CrossDeviceLogin.layoutTextColor.Color3, 
            Text = v5.TabletHeaderText or "", 
            Size = UDim2.new(1, 0, 0, l_FontSize_0), 
            LayoutOrder = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1
        }), 
        WarningText = v2.createElement(v3.FitFrame, {
            Size = UDim2.new(1, 0, 1, 0), 
            fitAxis = v3.FitAxis.Height, 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            Align = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = v6.LuaApps.CrossDeviceLogin.warningTextVerticalAlignment, 
                Padding = UDim.new(0, 16), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Icon = v5.Icon, 
            WarningText = v5.WarningText
        }), 
        CodeInput = ((v5.InputBox and v5.ConfirmCodeButton) and v5.ConfirmCodeButtonWidth) and v2.createElement("Frame", {
            LayoutOrder = 3, 
            Size = UDim2.new(1, -16 - v5.ConfirmCodeButtonWidth, 0, 30), 
            BackgroundTransparency = 1
        }, {
            InputBox = v5.InputBox, 
            InputWarning = v5.InputWarning, 
            ButtonWrapper = v2.createElement("Frame", {
                Size = UDim2.new(0, v5.ConfirmCodeButtonWidth, 1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 16, 0, 0)
            }, {
                ConfirmButton = v5.ConfirmCodeButton
            })
        }), 
        CodeConfirmButtonFrame = (v5.LoginButton and v5.CancelButton) and v2.createElement("Frame", {
            Size = UDim2.new(v6.LuaApps.CrossDeviceLogin.buttonFrameWidth, 0, 0, v5.Style.Font.BaseSize * 2), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            CancelButtonWrapper = v2.createElement("Frame", {
                Size = UDim2.new(0.5, -6, 1, 0), 
                BackgroundTransparency = 1
            }, {
                CancelButton = v5.CancelButton
            }), 
            LoginButtonWrapper = v2.createElement("Frame", {
                Size = UDim2.new(0.5, -6, 1, 0), 
                Position = UDim2.new(0.5, 6, 0, 0), 
                BackgroundTransparency = 1
            }, {
                LoginButton = v5.LoginButton
            })
        })
    });
end;
