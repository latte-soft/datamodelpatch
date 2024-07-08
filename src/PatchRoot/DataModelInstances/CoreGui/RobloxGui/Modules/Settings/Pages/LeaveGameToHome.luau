local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v7 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v10 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v11 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v12 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v13 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local l_FFlag_0 = settings():GetFFlag("CollectAnalyticsForSystemMenu");
local v15 = require(l_RobloxGui_0.Modules.Common.GetDefaultQualityLevel);
local v16 = nil;
if l_FFlag_0 then
    v16 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
end;
v11 = (function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.LeaveFunc = function()
        if v13() then
            v7.leavingGame();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
        if l_FFlag_0 then
            l_RbxAnalyticsService_0:SetRBXEventStream(v16.AnalyticsTargetName, v16.AnalyticsInGameMenuName, v16.AnalyticsLeaveGameName, {
                confirmed = v16.AnalyticsConfirmedName, 
                universeid = tostring(game.GameId), 
                source = v16.AnalyticsLeaveToHomeSource
            });
        end;
        l_LinkingProtocol_0.default:detectURL("roblox://navigation/home");
        l_RunService_0.RenderStepped:wait();
        l_RunService_0.RenderStepped:wait();
        game:Shutdown();
        settings().Rendering.QualityLevel = v15();
    end;
    l_NewPage_0.DontLeaveFunc = function(v18)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v18, true);
        end;
        if l_FFlag_0 then
            l_RbxAnalyticsService_0:SetRBXEventStream(v16.AnalyticsTargetName, v16.AnalyticsInGameMenuName, v16.AnalyticsLeaveGameName, {
                confirmed = v16.AnalyticsCancelledName, 
                universeid = tostring(game.GameId), 
                source = v16.AnalyticsLeaveToHomeSource
            });
        end;
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v20, v21)
        if v20 == Enum.UserInputState.Begin then
            local v22 = true;
            if v21.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v22 = true;
                if v21.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v22 = true;
                    if v21.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v22 = v21.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v22);
        end;
    end;
    l_NewPage_0.DontLeaveFromButton = function(v23)
        l_NewPage_0.DontLeaveFunc(v23);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGameToHomePage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    local v24 = v8:Create("TextLabel")({
        Name = "LeaveGameText", 
        Text = "Are you sure you want to leave the experience?", 
        Font = v10.font(Enum.Font.SourceSansBold, "Confirmation"), 
        FontSize = v10.fontSize(Enum.FontSize.Size36, "Confirmation"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 200), 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = l_NewPage_0.Page, 
        Position = not not v12 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
    });
    local v25 = v8:Create("Frame")({
        Name = "LeaveButtonContainer", 
        Parent = v24, 
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 1, 0)
    });
    local _ = v8:Create("UIGridLayout")({
        Name = "LeavetButtonsLayout", 
        CellSize = not not v12 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
        CellPadding = UDim2.new(0, 20, 0, 20), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Parent = v25
    });
    if not v8:IsSmallTouchScreen() then
        if v12 then
            v24.FontSize = Enum.FontSize.Size48;
        end;
    else
        v24.FontSize = Enum.FontSize.Size24;
        v24.Size = UDim2.new(1, 0, 0, 100);
    end;
    l_NewPage_0.LeaveGameButton = v8:MakeStyledButton("LeaveGame", "Leave", nil, l_NewPage_0.LeaveFunc);
    l_NewPage_0.LeaveGameButton.NextSelectionRight = nil;
    l_NewPage_0.LeaveGameButton.Parent = v25;
    local v27 = v8:MakeStyledButton("DontLeaveGame", "Don't Leave", nil, l_NewPage_0.DontLeaveFromButton);
    v27.NextSelectionLeft = nil;
    v27.Parent = v25;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v27.AbsolutePosition.Y + v27.AbsoluteSize.Y);
    return l_NewPage_0;
end)();
v11.Displayed.Event:connect(function()
    l_GuiService_0.SelectedCoreObject = v11.LeaveGameButton;
    l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", v11.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v11.Hidden.Event:connect(function()
    l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
end);
return v11;
