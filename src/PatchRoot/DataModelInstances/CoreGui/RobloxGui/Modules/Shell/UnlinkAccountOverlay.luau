local l_Shell_0 = game:GetService("CoreGui").RobloxGui.Modules.Shell;
local v1 = require(l_Shell_0.BaseOverlay);
local v2 = require(l_Shell_0.GlobalSettings);
local v3 = require(l_Shell_0.SoundManager);
local v4 = require(l_Shell_0.LocalizedStrings);
local v5 = require(l_Shell_0.Utility);
local v6 = require(l_Shell_0.Analytics);
return function(v7, v8)
    local v9 = v1();
    local l_Title_0 = v7.Title;
    local l_Msg_0 = v7.Msg;
    v9:SetImage((v5.Create("ImageLabel")({
        Name = "ReportIcon", 
        Position = UDim2.new(0, 226, 0, 204), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/ErrorIconLargeCopy@1080.png", 
        Size = UDim2.new(0, 321, 0, 264)
    })));
    v5.Create("TextLabel")({
        Name = "DescriptionText", 
        Size = UDim2.new(0, 762, 0, 304), 
        Position = UDim2.new(0, v9.RightAlign, 0, v5.Create("TextLabel")({
            Name = "TitleText", 
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(0, v9.RightAlign, 0, 136), 
            BackgroundTransparency = 1, 
            Font = v2.RegularFont, 
            FontSize = v2.HeaderSize, 
            TextColor3 = v2.WhiteTextColor, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Parent = v9.Container
        }).Position.Y.Offset + 62), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = v2.LightFont, 
        FontSize = v2.TitleSize, 
        TextColor3 = v2.WhiteTextColor, 
        TextWrapped = true, 
        Text = l_Msg_0, 
        Parent = v9.Container
    });
    local v12 = v5.Create("TextButton")({
        Name = "OkButton", 
        Size = UDim2.new(0, 320, 0, 66), 
        Position = UDim2.new(0, v9.RightAlign, 1, -166), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v2.GreyButtonColor, 
        Font = v2.RegularFont, 
        FontSize = v2.ButtonSize, 
        TextColor3 = v2.WhiteTextColor, 
        Text = v4:LocalizedString("ConfirmWord"), 
        Parent = v9.Container; 
        v3:CreateSound("MoveSelection")
    });
    v5.ResizeButtonWithText(v12, v12, v2.TextHorizontalPadding);
    local v13 = v5.Create("TextButton")({
        Name = "CancelButton", 
        Position = UDim2.new(0, (v12.Position.X.Offset + v12.Size.X.Offset) + 10, 1, -166), 
        Size = UDim2.new(0, 320, 0, 66), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v2.BlueButtonColor, 
        Font = v2.RegularFont, 
        FontSize = v2.ButtonSize, 
        TextColor3 = v2.TextSelectedColor, 
        Text = v4:LocalizedString("CancelWord"), 
        Parent = v9.Container; 
        v3:CreateSound("MoveSelection")
    });
    v5.ResizeButtonWithText(v13, v13, v2.TextHorizontalPadding);
    v12.SelectionGained:connect(function()
        v12.BackgroundColor3 = v2.GreySelectedButtonColor;
        v12.TextColor3 = v2.TextSelectedColor;
    end);
    v12.SelectionLost:connect(function()
        v12.BackgroundColor3 = v2.GreyButtonColor;
        v12.TextColor3 = v2.WhiteTextColor;
    end);
    v13.SelectionGained:connect(function()
        v13.BackgroundColor3 = v2.GreySelectedButtonColor;
        v13.TextColor3 = v2.TextSelectedColor;
    end);
    v13.SelectionLost:connect(function()
        v13.BackgroundColor3 = v2.GreyButtonColor;
        v13.TextColor3 = v2.WhiteTextColor;
    end);
    v13.MouseButton1Click:connect(function()
        v9:Close();
    end);
    v9.GetAnalyticsInfo = function(_)
        return {
            [v6.WidgetNames("WidgetId")] = v6.WidgetNames("UnlinkAccountOverlayId"), 
            Title = v7.Title
        };
    end;
    v12.MouseButton1Click:connect(function()
        if not (not v9:Close() or not v8) then
            v8();
        end;
    end);
    local l_Focus_0 = v9.Focus;
    v9.Focus = function(v16)
        l_Focus_0(v16);
        v5.SetSelectedCoreObject(v13);
    end;
    v9.GetOverlaySound = function(_)
        return "Error";
    end;
    return v9;
end;
