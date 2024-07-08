local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v1 = nil;
pcall(function()
    v1 = game:GetService("PlatformService");
end);
local l_TitleSafeContainer_0 = require(l_Shell_0.AppContainer).TitleSafeContainer;
local l_TextService_0 = game:GetService("TextService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v6 = {};
v6.__index = v6;
v6.new = function()
    local v7 = {};
    setmetatable(v7, v6);
    v7.container = l_Utility_0.Create("Frame")({
        Name = "SiteInfoContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = 1
    });
    v7.text = l_Utility_0.Create("TextLabel")({
        Name = "SiteInfoText", 
        Size = UDim2.new(1, -12, 0, 12), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Bottom, 
        Text = "", 
        Parent = v7.container
    });
    v7.updateLayout = function()
        v7.container.Size = UDim2.new(0, l_TextService_0:GetTextSize(v7.text.Text, l_Utility_0.ConvertFontSizeEnumToInt(v7.text.FontSize), v7.text.Font, Vector2.new(0, 0)).X, 0, 50);
    end;
    if v1 then
        spawn(function()
            local l_v1_SiteInfo_0 = v1:GetSiteInfo();
            if l_v1_SiteInfo_0 and l_v1_SiteInfo_0 ~= "" then
                v7:SetText(l_v1_SiteInfo_0);
                v7:SetParent(l_TitleSafeContainer_0);
            end;
        end);
    end;
    return v7;
end;
v6.SetParent = function(v9, v10)
    v9.container.Parent = v10;
end;
v6.SetText = function(v11, v12)
    if v12 ~= v11.text.Text then
        v11.text.Text = v12;
        v11.updateLayout();
    end;
end;
return v6;
