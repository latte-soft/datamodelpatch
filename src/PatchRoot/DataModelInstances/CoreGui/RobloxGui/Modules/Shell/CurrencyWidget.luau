local l_TextService_0 = game:GetService("TextService");
local v1 = nil;
pcall(function()
    v1 = game:GetService("PlatformService");
end);
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local v9 = 0;
local v10 = l_Utility_0.Signal();
local v11 = l_Utility_0.Signal();
local function v46(v12)
    v12 = v12 or {};
    local v13 = {
        RefreshRobuxAmountAsync = nil, 
        RobuxChanged = l_Utility_0.Signal()
    };
    local v14 = nil;
    local v15 = nil;
    local v16 = false;
    v9 = v9 + 1;
    local v17 = "CurrencyWidget" .. tostring(v9);
    local v18 = l_Utility_0.Create("TextLabel")({
        Name = "RobuxBalanceTitle", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = v12.Position or UDim2.new(0, 0, 0, 0), 
        TextXAlignment = "Left", 
        TextYAlignment = "Top", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("RobuxBalanceTitle") .. ":", 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        BackgroundTransparency = 1, 
        ZIndex = v12.ZIndex or 2, 
        Parent = v12.Parent or nil
    });
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v18.Text, l_Utility_0.ConvertFontSizeEnumToInt(v18.FontSize), v18.Font, Vector2.new());
    v18.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
    local v20 = l_Utility_0.Create("TextLabel")({
        Name = "RobuxBalanceValue", 
        Size = UDim2.new(0, 0, 1, 0), 
        Position = UDim2.new(1, 5, 0, -2), 
        Text = "", 
        TextXAlignment = "Left", 
        TextYAlignment = "Center", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        BackgroundTransparency = 1, 
        ZIndex = v12.ZIndex or 2, 
        TextTransparency = 1, 
        Parent = l_Utility_0.Create("ImageLabel")({
            Name = "RobuxIcon", 
            Size = UDim2.new(0, 48, 0, 48), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/common/robux_small@3x.png", 
            ZIndex = v12.ZIndex or 2, 
            Parent = v18, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(1, 17, 0.5, 0)
        })
    });
    local function v22()
        local v21 = not not v15 and l_Utility_0.FormatNumberString((tostring(v15))) or "-";
        v20.Size = UDim2.new(0, l_TextService_0:GetTextSize(v21, l_Utility_0.ConvertFontSizeEnumToInt(v20.FontSize), v20.Font, Vector2.new()).X, 1, 0);
        v20.Text = v21;
        if v20.TextTransparency == 1 and v15 ~= nil then
            l_Utility_0.PropertyTweener(v20, "TextTransparency", 1, 0, 0.5, l_Utility_0.EaseOutQuad, true);
        end;
    end;
    local v23 = nil;
    local v24 = nil;
    if v1 then
        local v25 = 0;
        do
            local l_v25_0 = v25;
            local function v31(v27)
                if not v15 then
                    v13:RefreshRobuxAmountAsync();
                end;
                local l_v15_0 = v15;
                l_Utility_0.ExponentialRepeat(function()
                    local v29 = false;
                    if v27 == l_v25_0 then
                        v29 = not v16;
                    end;
                    return v29;
                end, function()
                    local v30 = l_UserData_0.GetTotalUserBalanceAsync();
                    if not (not v30 or v16) and v30 ~= l_v15_0 then
                        v15 = v30;
                        v22();
                        if v13.RobuxChanged ~= nil then
                            v13.RobuxChanged:fire(v30);
                        end;
                        return true;
                    else
                        return ;
                    end;
                end);
            end;
            local function v34()
                l_v25_0 = l_v25_0 + 1;
                local l_l_v25_0_0 = l_v25_0;
                if v23 then
                    v23:Cleanup();
                    v23 = nil;
                end;
                local v33 = l_LoadingWidget_0({
                    Parent = v20, 
                    Size = UDim2.new(0, 50, 0, 50), 
                    Position = UDim2.new(1, 75, 0, 25)
                }, {
                    function()
                        v31(l_l_v25_0_0);
                    end
                });
                v23 = v33;
                v23:AwaitFinished();
                if v23 and v33 == v23 then
                    v23:Cleanup();
                    v23 = nil;
                end;
            end;
            l_Utility_0.DisconnectEvent(v24);
            v24 = v1.ConsumePurchased:connect(function(v35, _)
                if v35 == 3 then
                    v34();
                    return ;
                else
                    if v23 then
                        v23:Cleanup();
                        v23 = nil;
                    end;
                    return ;
                end;
            end);
            l_EventHub_0:addEventListener(l_EventHub_0.Notifications.RobuxCatalogPurchaseInitiated, v17, function()
                v34();
            end);
        end;
    end;
    v13.GetAbsoluteSize = function(_)
        return (v20.AbsolutePosition + v20.AbsoluteSize) - v18.AbsolutePosition;
    end;
    v13.GetRobuxAmount = function(_)
        return v15;
    end;
    v13.RefreshRobuxAmountAsync = function(_)
        local l_v15_1 = v15;
        l_UserData_0.GetLocalUserIdAsync();
        v15 = l_UserData_0.GetTotalUserBalanceAsync();
        v22();
        if l_v15_1 ~= v15 then
            v10:fire(v15);
        end;
    end;
    local v41 = nil;
    v13.GetRobuxAmountAsync = function(v42)
        if not v15 then
            l_UserData_0.GetLocalUserIdAsync();
            spawn(function()
                wait(1);
                if v15 == nil and v41 == nil then
                    v41 = l_LoadingWidget_0({
                        Parent = v20, 
                        Size = UDim2.new(0, 50, 0, 50), 
                        Position = UDim2.new(1, 75, 0, 25)
                    }, {
                        function()
                            while v15 == nil do
                                wait();
                            end;
                        end
                    });
                    v41:AwaitFinished();
                    if v41 then
                        v41:Cleanup();
                    end;
                    v41 = nil;
                end;
            end);
            v42:RefreshRobuxAmountAsync();
            return v15;
        else
            return v15;
        end;
    end;
    v13.Destroy = function(v43)
        v16 = true;
        v18.Parent = nil;
        v43.RobuxChanged = nil;
        if v23 then
            v23:Cleanup();
            v23 = nil;
        end;
        v24 = l_Utility_0.DisconnectEvent(v24);
        v14 = l_Utility_0.DisconnectEvent(v14);
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.RobuxCatalogPurchaseInitiated, v17);
    end;
    v13.GetGuiObject = function(_)
        return v18;
    end;
    v14 = v11:connect(function(v45)
        if v45 ~= v15 then
            v15 = v45;
            v13.RobuxChanged:fire(v15);
        end;
    end);
    spawn(function()
        v13:GetRobuxAmountAsync();
    end);
    return v13;
end;
return function(v47)
    return (v46(v47));
end;
