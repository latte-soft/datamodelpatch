local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TextService_0 = game:GetService("TextService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_getFFlagDebugLuaAppAlwaysUseGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad;
return function(v8, v9, v10)
    if v10 == nil then
        v10 = UDim2.new(1, -1, 1, -1);
    end;
    local v11 = {};
    if not (v9 ~= nil) or #v9 == 0 then
        v9 = "DefaultHintAction";
    end;
    local v12 = l_Utility_0.Create("Frame")({
        Name = "HintActionContainer", 
        Size = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v8
    });
    local v13 = l_Utility_0.Create("TextLabel")({
        Name = "HintActionText", 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        Text = "", 
        ZIndex = 10, 
        Parent = v12
    });
    local v14 = l_Utility_0.Create("ImageLabel")({
        Name = "HintActionImage", 
        Size = UDim2.new(0, 83, 0, 83), 
        BackgroundTransparency = 1, 
        Image = "", 
        ZIndex = 10, 
        Parent = v12
    });
    local function v16()
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v13.Text, l_Utility_0.ConvertFontSizeEnumToInt(v13.FontSize), v13.Font, Vector2.new(0, 0));
        v13.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.x, 0, v14.Size.Y.Offset);
        v13.Position = UDim2.new(1, -l_l_TextService_0_TextSize_0.x, 0, -4);
        v12.Size = UDim2.new(0, (l_l_TextService_0_TextSize_0.x + v14.Size.X.Offset) + 8, 0, v14.Size.Y.Offset);
        v12.Position = UDim2.new(v10.X.Scale, v10.X.Offset * v12.Size.X.Offset, v10.Y.Scale, v10.Y.Offset * v12.Size.Y.Offset);
    end;
    v11.BindAction = function(_, v18, v19)
        if v18 then
            l_ContextActionService_0:UnbindCoreAction(v9);
            if not l_getFFlagDebugLuaAppAlwaysUseGamepad_0() or not v6.Config.DebugKeyboardBindings then
                l_ContextActionService_0:BindCoreAction(v9, v18, false, v19);
                return ;
            else
                l_ContextActionService_0:BindCoreAction(v9, v18, false, v19, table.unpack(v6.Config.DebugKeyboardBindings[v19] or {}));
                return ;
            end;
        else
            return ;
        end;
    end;
    v11.UnbindAction = function(_)
        l_ContextActionService_0:UnbindCoreAction(v9);
    end;
    v11.SetParent = function(_, v22)
        v12.Parent = v22;
    end;
    v11.SetVisible = function(_, v24)
        v12.Visible = v24;
    end;
    v11.SetTransparency = function(_, v26)
        v13.TextTransparency = v26;
        v14.ImageTransparency = v26;
    end;
    v11.SetVisibleWithTween = function(_, v28)
        l_Utility_0.PropertyTweener(v13, "TextTransparency", v13.TextTransparency, v28, 0.25, l_Utility_0.EaseOutQuad, true);
        l_Utility_0.PropertyTweener(v14, "ImageTransparency", v14.ImageTransparency, v28, 0.25, l_Utility_0.EaseOutQuad, true);
    end;
    v11.SetText = function(_, v30)
        if v30 == v13.Text then
            return ;
        else
            v13.Text = v30;
            v16();
            return ;
        end;
    end;
    v11.SetImage = function(_, v32)
        if v32 == v14.Image then
            return ;
        else
            v14.Image = v32;
            return ;
        end;
    end;
    return v11;
end;
