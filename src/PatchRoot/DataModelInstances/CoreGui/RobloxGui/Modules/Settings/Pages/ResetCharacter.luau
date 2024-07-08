local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v7 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v8 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v9 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
v8 = (function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.DontResetCharFunc = function(v12)
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsRespawnCharacterName, {
            confirmed = l_Constants_0.AnalyticsCancelledName, 
            universeid = tostring(game.GameId)
        });
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v12, true);
        end;
    end;
    l_NewPage_0.DontResetCharFromHotkey = function(_, v14, v15)
        if v14 == Enum.UserInputState.Begin then
            local v16 = true;
            if v15.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v16 = true;
                if v15.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v16 = true;
                    if v15.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v16 = v15.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontResetCharFunc(v16);
        end;
    end;
    l_NewPage_0.DontResetCharFromButton = function(v17)
        l_NewPage_0.DontResetCharFunc(v17);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "ResetCharacter";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    local v18 = v6:Create("TextLabel")({
        Name = "ResetCharacterText", 
        Text = "Are you sure you want to reset your character?", 
        Font = v7.font(Enum.Font.SourceSansBold, "Confirmation"), 
        FontSize = v7.fontSize(Enum.FontSize.Size36, "Confirmation"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 200), 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = l_NewPage_0.Page, 
        Position = not not v9 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
    });
    local v19 = v6:Create("Frame")({
        Name = "ResetButtonContainer", 
        Parent = v18, 
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 1, 0)
    });
    local _ = v6:Create("UIGridLayout")({
        Name = "ResetButtonsLayout", 
        CellSize = not not v9 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
        CellPadding = UDim2.new(0, 20, 0, 20), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Parent = v19
    });
    if not v6:IsSmallTouchScreen() then
        if v9 then
            v18.FontSize = Enum.FontSize.Size48;
        end;
    else
        v18.FontSize = Enum.FontSize.Size24;
        v18.Size = UDim2.new(1, 0, 0, 100);
    end;
    local function v24()
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            local l_Character_0 = l_LocalPlayer_0.Character;
            if l_Character_0 then
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if l_Humanoid_0 then
                    l_Humanoid_0.Health = 0;
                end;
            end;
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsRespawnCharacterName, {
            confirmed = l_Constants_0.AnalyticsConfirmedName, 
            universeid = tostring(game.GameId)
        });
        l_RbxAnalyticsService_0:ReportCounter("InGameMenu-ResetCharacter");
    end;
    l_NewPage_0.ResetBindable = true;
    l_NewPage_0.ResetCharacterButton = v6:MakeStyledButton("ResetCharacter", "Reset", nil, function()
        if l_NewPage_0.ResetBindable == true then
            v24();
        elseif l_NewPage_0.ResetBindable then
            l_NewPage_0.ResetBindable:Fire();
        end;
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:SetVisibility(false, true);
        end;
    end);
    l_NewPage_0.ResetCharacterButton.NextSelectionRight = nil;
    l_NewPage_0.ResetCharacterButton.Parent = v19;
    local v25 = v6:MakeStyledButton("DontResetCharacter", "Don't Reset", nil, l_NewPage_0.DontResetCharFromButton);
    v25.NextSelectionLeft = nil;
    v25.Parent = v19;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v25.AbsolutePosition.Y + v25.AbsoluteSize.Y);
    return l_NewPage_0;
end)();
local v26 = false;
v8.Displayed.Event:connect(function()
    v26 = true;
    l_GuiService_0.SelectedCoreObject = v8.ResetCharacterButton;
    l_ContextActionService_0:BindCoreAction("ResetCharacterAction", v8.DontResetCharFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v8.Hidden.Event:connect(function()
    v26 = false;
    l_ContextActionService_0:UnbindCoreAction("ResetCharacterAction");
end);
v8.SetResetCallback = function(_, v28)
    if not (not (v28 == false) or not v26) then
        v8.HubRef:PopMenu(nil, true);
    end;
    v8.ResetBindable = v28;
end;
return v8;
