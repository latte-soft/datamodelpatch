local l_TextService_0 = game:GetService("TextService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
return function(v7, v8, v9)
    local v10 = {};
    local v11 = false;
    local v12 = false;
    v10.SizeChanged = l_Utility_0.Signal();
    v10.Clicked = l_Utility_0.Signal();
    local v13 = l_Utility_0.Create("TextLabel")({
        Size = UDim2.new(0, 100, 1, 0), 
        BackgroundTransparency = 1, 
        Name = "TabItem", 
        Selectable = false, 
        Text = ""
    });
    local v14 = l_Utility_0.Create("TextLabel")({
        Text = v7, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Name = "LargeText", 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        Font = l_GlobalSettings_0.LightFont, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Visible = true, 
        Parent = v13, 
        Selectable = false
    });
    v13.Size = UDim2.new(0, l_TextService_0:GetTextSize(v14.Text, l_Utility_0.ConvertFontSizeEnumToInt(v14.FontSize), v14.Font, Vector2.new()).X + 20, 1, 0);
    v10.SizeChanged:fire(v13.Size);
    local v15 = l_Utility_0.Create("TextLabel")({
        Text = v7, 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Name = "SmallText", 
        FontSize = l_GlobalSettings_0.MediumFontSize, 
        Font = l_GlobalSettings_0.LightFont, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        BackgroundTransparency = 1, 
        Visible = false, 
        Selectable = false, 
        Parent = v13
    });
    local function v19(v16, v17)
        if v16 and type(v16.GetAnalyticsInfo) == "function" then
            local l_v16_AnalyticsInfo_0 = v16:GetAnalyticsInfo();
            if not (not (type(l_v16_AnalyticsInfo_0) == "table") or not l_v16_AnalyticsInfo_0[l_Analytics_0.WidgetNames("WidgetId")]) then
                l_v16_AnalyticsInfo_0.Status = v17;
                l_Analytics_0.SetRBXEventStream("Widget", l_v16_AnalyticsInfo_0);
            end;
        end;
    end;
    local function _()
        if not v11 then
            v14.TextColor3 = l_GlobalSettings_0.BlueTextColor;
            return ;
        else
            v14.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
            v19(v8, "Select");
            return ;
        end;
    end;
    v10.GetContentItem = function(_)
        return v8;
    end;
    v10.GetGuiObject = function(_)
        return v13;
    end;
    v10.SetSelected = function(_, v24)
        if v11 ~= v24 then
            v11 = v24;
            if not v11 then
                v14.TextColor3 = l_GlobalSettings_0.BlueTextColor;
            else
                v14.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
                v19(v8, "Select");
                return ;
            end;
        end;
    end;
    v10.GetSelected = function(_)
        return v11;
    end;
    v10.GetId = function(_)
        return v9;
    end;
    v10.GetName = function(_)
        return v7;
    end;
    v10.GetSize = function(_)
        return v13.Size;
    end;
    v10.OnClick = function(_)
        v15.Visible = true;
        v14.Visible = false;
        l_SoundManager_0:Play("ButtonPress");
    end;
    v10.OnClickRelease = function(_)
        v15.Visible = false;
        v14.Visible = true;
    end;
    v10.SetFocused = function(v31, v32)
        if v12 ~= v32 then
            v12 = v32;
            if not v12 then
                v31:OnClickRelease();
            else
                for _, v34 in pairs(l_UserInputService_0:GetGamepadState(Enum.UserInputType.Gamepad1)) do
                    if v34.KeyCode == Enum.KeyCode.ButtonA and v34.UserInputState == Enum.UserInputState.Begin then
                        v31:OnClick();
                    end;
                end;
                return ;
            end;
        end;
    end;
    v10.SetPosition = function(_, v36)
        v13.Position = v36;
    end;
    v10.SetParent = function(_, v38)
        v13.Parent = v38;
    end;
    if not v11 then
        v14.TextColor3 = l_GlobalSettings_0.BlueTextColor;
    else
        v14.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        v19(v8, "Select");
    end;
    return v10;
end;
