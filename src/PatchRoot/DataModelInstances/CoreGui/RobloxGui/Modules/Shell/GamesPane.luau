local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GamesView_0 = require(l_Shell_0:FindFirstChild("GamesView"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_SortsData_0 = require(l_Shell_0:FindFirstChild("SortsData"));
local l_GamesPaneDetailsView_0 = require(l_Shell_0:FindFirstChild("GamesPaneDetailsView"));
local l_LuaContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("ContextBarContext")).LuaContext;
local v11 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v12 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v13 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function(v14)
    local v15 = {};
    local v16 = {};
    local v17 = false;
    local v18 = l_Utility_0.Create("Frame")({
        Name = "GamesPane", 
        Size = UDim2.new(1, 0, 0, 900), 
        Position = UDim2.new(0, 0, 0, not v11.isUserEnrolled() and -120 or 0), 
        BackgroundTransparency = 1, 
        Visible = false, 
        SelectionImageObject = l_Utility_0.Create("ImageLabel")({
            Name = "NoSelectionObject", 
            BackgroundTransparency = 1
        }), 
        ClipsDescendants = false, 
        Parent = v14
    });
    local v19 = l_GamesPaneDetailsView_0();
    v19:TweenTransparency(1, 0);
    v19:SetParent(v18);
    local v20 = UDim2.new(0, 0, 0, 100);
    local v21 = UDim2.new(0, 1730, 0, 700);
    local v22 = UDim2.new(0, 0, 0, 300);
    local v23 = UDim2.new(0, 1730, 0, 700);
    local v24 = l_Utility_0.Create("Frame")({
        Name = "GamesViewContainer", 
        Size = UDim2.new(0, 1730, 0, 700), 
        Position = if not v11.isUserEnrolled() then v20 else v22, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        Parent = v18
    });
    local function _(v25, v26)
        table.insert(v25, (l_Utility_0.PropertyTweener(v24, "Position", v20, v22, v26, l_Utility_0.SCurveUDim2)));
        table.insert(v25, (l_Utility_0.PropertyTweener(v24, "Size", v21, v23, v26, l_Utility_0.SCurveUDim2)));
    end;
    local function _(v28, v29)
        table.insert(v28, (l_Utility_0.PropertyTweener(v24, "Position", v22, v20, v29, l_Utility_0.SCurveUDim2)));
        table.insert(v28, (l_Utility_0.PropertyTweener(v24, "Size", v23, v21, v29, l_Utility_0.SCurveUDim2)));
    end;
    local v34 = l_GamesView_0({
        Size = UDim2.new(1, 0, 0, 500), 
        Position = UDim2.new(0, -110, 0, 0), 
        CellSize = Vector2.new(1900, 300), 
        BackgroundTransparency = 1, 
        Spacing = Vector2.new(0, 0), 
        Padding = Vector2.new(0, 0), 
        ScrollDirection = "Vertical", 
        ClipsDescendants = false, 
        SelectionMode = "TopLeft", 
        Dynamic = true
    }, function(v31, v32, v33)
        v19:SetGamePreview(v31, v32, v33);
    end);
    v34:SetParent(v24);
    local v35 = l_Utility_0.Create("ImageLabel")({
        Name = "HintGradient", 
        Size = UDim2.new(0, 631, 0, 276), 
        Position = UDim2.new(1, -631, 1, -276), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Images/IGG/IGGHintGradient.png", 
        Parent = v18
    });
    spawn(function()
        v35.Position = UDim2.new(1, -631 + math.abs((l_RobloxGui_0.AbsoluteSize.x - v18.AbsoluteSize.x) - v18.AbsolutePosition.x), 1, -276 + math.abs((l_RobloxGui_0.AbsoluteSize.y - v18.AbsoluteSize.y) - v18.AbsolutePosition.y));
    end);
    v15.GetName = function(_)
        return l_LocalizedStrings_0:LocalizedString("GamesWord");
    end;
    v15.GetId = function(_)
        return l_Analytics_0.TabNames("DiscoverId");
    end;
    v15.IsFocused = function(_)
        return v17;
    end;
    v15.Show = function(v39, v40)
        v18.Visible = true;
        v24.Visible = true;
        if v40 then
            v34:Load();
        end;
        l_SortsData_0:SuspendUpdate();
        v39.TransitionTweens = l_ScreenManager_0:DefaultFadeIn(v18);
        l_ScreenManager_0:PlayDefaultOpenSound();
        if v12() > 0 then
            if not v13() then
                l_Analytics_0.reportNavigationLoaded(v15:GetName());
            else
                l_Analytics_0.reportNavigationLoaded(l_Analytics_0.TabNames("DiscoverId"));
                return ;
            end;
        end;
    end;
    v15.Hide = function(v41, v42)
        v18.Visible = false;
        v24.Visible = false;
        l_ScreenManager_0:DefaultCancelFade(v41.TransitionTweens);
        v41.TransitionTweens = nil;
        spawn(function()
            if v11.isUserEnrolled() then
                l_LuaContext_0:UnbindAction("X");
            end;
            if v42 then
                l_SortsData_0:ResumeUpdate();
                l_SortsData_0:CallUpdate();
            end;
        end);
    end;
    v15.Focus = function(_, v44)
        v17 = true;
        if not v11.isUserEnrolled() then
            v44:Hide();
            l_Utility_0.CancelTweens(v16);
            local l_v16_0 = v16;
            local l_TabDockTweenDuration_0 = l_GlobalSettings_0.TabDockTweenDuration;
            table.insert(l_v16_0, (l_Utility_0.PropertyTweener(v24, "Position", v20, v22, l_TabDockTweenDuration_0, l_Utility_0.SCurveUDim2)));
            table.insert(l_v16_0, (l_Utility_0.PropertyTweener(v24, "Size", v21, v23, l_TabDockTweenDuration_0, l_Utility_0.SCurveUDim2)));
        end;
        v34:Focus();
        v19:Focus();
    end;
    v15.RemoveFocus = function(_, v48)
        if v17 then
            if not v11.isUserEnrolled() then
                l_Utility_0.CancelTweens(v16);
                local l_v16_1 = v16;
                local l_TabDockTweenDuration_1 = l_GlobalSettings_0.TabDockTweenDuration;
                table.insert(l_v16_1, (l_Utility_0.PropertyTweener(v24, "Position", v22, v20, l_TabDockTweenDuration_1, l_Utility_0.SCurveUDim2)));
                table.insert(l_v16_1, (l_Utility_0.PropertyTweener(v24, "Size", v23, v21, l_TabDockTweenDuration_1, l_Utility_0.SCurveUDim2)));
                v19:RemoveFocus();
            end;
            v34:RemoveFocus(v48);
            v17 = false;
            return ;
        else
            return ;
        end;
    end;
    v15.SetPosition = function(_, v52)
        v18.Position = v52;
    end;
    v15.SetParent = function(_, v54)
        v18.Parent = v54;
    end;
    v15.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("GamesPaneId")
        };
    end;
    v15.IsAncestorOf = function(_, v57)
        return v18 and v18:IsAncestorOf(v57);
    end;
    return v15;
end;
