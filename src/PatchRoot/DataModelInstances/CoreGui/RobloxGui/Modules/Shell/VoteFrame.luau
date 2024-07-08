local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
return function(v3, v4, v5, v6)
    local v7 = {};
    local l_RedTextColor_0 = l_GlobalSettings_0.RedTextColor;
    local l_GreenTextColor_0 = l_GlobalSettings_0.GreenTextColor;
    local l_GreyTextColor_0 = l_GlobalSettings_0.GreyTextColor;
    local v11 = l_Utility_0.Create("Frame")({
        Name = "VoteContainer", 
        Size = UDim2.new(0, 203, 0, 16), 
        Position = v4, 
        AnchorPoint = v5, 
        BackgroundTransparency = 1, 
        LayoutOrder = v6, 
        Parent = v3
    });
    local v12 = l_Utility_0.Create("Frame")({
        Name = "VoteContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        ClipsDescendants = true, 
        Parent = v11
    });
    local v13 = l_Utility_0.Create("Frame")({
        Name = "VoteContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        ClipsDescendants = true, 
        Parent = v11
    });
    local v14 = l_Utility_0.Create("Frame")({
        Name = "VoteContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        ClipsDescendants = true, 
        Parent = v11
    });
    local v15 = l_Utility_0.Create("ImageLabel")({
        Name = "BatteryImageRed", 
        BackgroundTransparency = 1, 
        ImageColor3 = l_RedTextColor_0, 
        Parent = v13, 
        Image = "rbxasset://textures/ui/Shell/Icons/RatingBar@1080.png", 
        Size = UDim2.new(0, v13.AbsoluteSize.X, 0, v13.AbsoluteSize.Y), 
        Position = UDim2.new(0, 0, 0, 0), 
        Visible = false
    });
    local v16 = v15:Clone();
    v16.ImageColor3 = l_GreenTextColor_0;
    v16.ZIndex = 2;
    v16.Name = "BatteryImageGreen";
    v16.Parent = v12;
    local v17 = v15:Clone();
    v17.ImageColor3 = l_GreyTextColor_0;
    v17.ZIndex = 3;
    v17.Name = "BatteryImageGrey";
    v17.Visible = true;
    v17.Parent = v14;
    v7.SetPercentFilled = function(_, v19)
        if not v19 or not tonumber(v19) then
            v16.Visible = false;
            v15.Visible = false;
            v17.Visible = true;
            return ;
        else
            v17.Visible = false;
            v16.Visible = true;
            v15.Visible = true;
            v19 = l_Utility_0.Round(tonumber(v19), 0.1);
            v12.Size = UDim2.new(v19, 0, 1, 0);
            v13.Position = UDim2.new(v19, 0, 0, 0);
            v15.Position = UDim2.new(-v19, 0, 0, 0);
            return ;
        end;
    end;
    v7.SetImageColorTint = function(_, v21)
        l_RedTextColor_0 = Color3.new(0, 0, 0):Lerp(l_GlobalSettings_0.RedTextColor, v21);
        l_GreenTextColor_0 = Color3.new(0, 0, 0):Lerp(l_GlobalSettings_0.GreenTextColor, v21);
        l_GreyTextColor_0 = Color3.new(0, 0, 0):Lerp(l_GlobalSettings_0.GreyTextColor, v21);
        v15.ImageColor3 = l_RedTextColor_0;
        v16.ImageColor3 = l_GreenTextColor_0;
        v17.ImageColor3 = l_GreyTextColor_0;
    end;
    v7.TweenTransparency = function(_, v23, v24)
        l_Utility_0.PropertyTweener(v15, "ImageTransparency", v15.ImageTransparency, v23, v24, l_Utility_0.Linear, true);
        l_Utility_0.PropertyTweener(v16, "ImageTransparency", v16.ImageTransparency, v23, v24, l_Utility_0.Linear, true);
        l_Utility_0.PropertyTweener(v17, "ImageTransparency", v17.ImageTransparency, v23, v24, l_Utility_0.Linear, true);
    end;
    v7.SetVisible = function(_, v26)
        v11.Visible = v26;
    end;
    v7.GetContainer = function(_)
        return v11;
    end;
    v7.Destroy = function(_)
        v11:Destroy();
        v7 = nil;
    end;
    return v7;
end;
