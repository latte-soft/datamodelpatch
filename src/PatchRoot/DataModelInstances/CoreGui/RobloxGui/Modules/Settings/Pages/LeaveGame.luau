local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local v8 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v9 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v11 = require(l_RobloxGui_0.Modules.Settings.leaveGame);
local v12 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v13 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v14 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local l_GetFFlagChromeSurveySupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeSurveySupport;
local v16 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagExtractLeaveGameFunc);
local v17 = require(l_RobloxGui_0.Modules.Common.GetDefaultQualityLevel);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v19 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v20 = require(l_RobloxGui_0.Modules.Chrome.Service.LocalStore);
v12 = (function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.LeaveFunc = function()
        if v14() then
            v8.leavingGame();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsLeaveGameName, {
            confirmed = l_Constants_0.AnalyticsConfirmedName, 
            universeid = tostring(game.GameId), 
            source = l_Constants_0.AnalyticsLeaveGameSource
        });
        local v22 = nil;
        if l_GetFFlagChromeSurveySupport_0() then
            v22 = {
                chromeSeenCount = tostring(v20.getChromeSeenCount())
            };
        end;
        l_MessageBus_0.publish(l_Constants_0.OnSurveyEventDescriptor, {
            eventType = l_Constants_0.SurveyEventType, 
            userId = tostring(l_Players_0.LocalPlayer.UserId), 
            customProps = v22
        });
        l_RunService_0.RenderStepped:wait();
        l_RunService_0.RenderStepped:wait();
        game:Shutdown();
        settings().Rendering.QualityLevel = v17();
    end;
    l_NewPage_0.DontLeaveFunc = function(v23)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v23, true);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsLeaveGameName, {
            confirmed = l_Constants_0.AnalyticsCancelledName, 
            universeid = tostring(game.GameId), 
            source = l_Constants_0.AnalyticsLeaveGameSource
        });
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v25, v26)
        if v25 == Enum.UserInputState.Begin then
            local v27 = true;
            if v26.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v27 = true;
                if v26.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v27 = true;
                    if v26.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v27 = v26.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v27);
        end;
    end;
    l_NewPage_0.DontLeaveFromButton = function(v28)
        l_NewPage_0.DontLeaveFunc(v28);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGamePage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    local v29 = v9:Create("TextLabel")({
        Name = "LeaveGameText", 
        Text = "Are you sure you want to leave the experience?", 
        Font = v19.font(Enum.Font.SourceSansBold, "Confirmation"), 
        FontSize = v19.fontSize(Enum.FontSize.Size36, "Confirmation"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 200), 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = l_NewPage_0.Page, 
        Position = not not v13 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
    });
    local v30 = v9:Create("Frame")({
        Name = "LeaveButtonContainer", 
        Parent = v29, 
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 1, 0)
    });
    local _ = v9:Create("UIGridLayout")({
        Name = "LeavetButtonsLayout", 
        CellSize = not not v13 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
        CellPadding = UDim2.new(0, 20, 0, 20), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Parent = v30
    });
    if not v9:IsSmallTouchScreen() then
        if v13 then
            v29.FontSize = Enum.FontSize.Size48;
        end;
    else
        v29.FontSize = Enum.FontSize.Size24;
        v29.Size = UDim2.new(1, 0, 0, 100);
    end;
    l_NewPage_0.LeaveGameButton = v9:MakeStyledButton("LeaveGame", "Leave", nil, if not v16() then l_NewPage_0.LeaveFunc else function()
        v11(true);
    end);
    l_NewPage_0.LeaveGameButton.NextSelectionRight = nil;
    l_NewPage_0.LeaveGameButton.Parent = v30;
    local v32 = v9:MakeStyledButton("DontLeaveGame", "Don't Leave", nil, l_NewPage_0.DontLeaveFromButton);
    v32.NextSelectionLeft = nil;
    v32.Parent = v30;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v32.AbsolutePosition.Y + v32.AbsoluteSize.Y);
    return l_NewPage_0;
end)();
v12.Displayed.Event:connect(function()
    l_GuiService_0.SelectedCoreObject = v12.LeaveGameButton;
    l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", v12.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v12.Hidden.Event:connect(function()
    l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
end);
return v12;
