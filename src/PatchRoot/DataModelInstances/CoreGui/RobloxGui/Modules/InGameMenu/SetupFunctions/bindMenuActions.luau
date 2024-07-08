local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v4 = require(l_CoreGui_0.RobloxGui.Modules.DevConsoleMaster);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Thunks.OpenSystemMenu);
local v7 = require(l_Parent_0.Thunks.CloseMenu);
local v8 = require(l_Parent_0.Actions.SetRespawning);
local v9 = require(l_Parent_0.Actions.SetCurrentPage);
local v10 = require(l_Parent_0.Actions.NavigateBack);
local v11 = require(l_Parent_0.Actions.SetCurrentZone);
local v12 = require(l_Parent_0.Components.Pages);
local v13 = require(l_Parent_0.Resources.Constants);
return function(v14)
    l_ContextActionService_0:BindCoreAction("ToggleInGameMenu", function(_, v16, _)
        if v16 ~= Enum.UserInputState.Begin then
            return ;
        else
            local v18 = v14:getState();
            local l_isMenuOpen_0 = v18.isMenuOpen;
            local v20 = v12.pagesByKey[v18.menuPage];
            if not v20 or not v20.isModal then
                if not l_isMenuOpen_0 then
                    v14:dispatch(v6(v13.AnalyticsMenuOpenTypes.Keyboard));
                    return ;
                elseif v18.menuPage == v13.InitalPageKey then
                    v14:dispatch(v6(v13.AnalyticsMenuOpenTypes.Keyboard));
                    return ;
                else
                    v14:dispatch(v7);
                    return ;
                end;
            else
                v14:dispatch(v9(v13.defaultPageKey));
                return ;
            end;
        end;
    end, false, Enum.KeyCode.Escape);
    l_ContextActionService_0:BindCoreAction("ToggleDeveloperConsole", function(v21, v22)
        if v21 ~= "ToggleDeveloperConsole" then
            return ;
        elseif v22 ~= Enum.UserInputState.Begin then
            return ;
        else
            v4:ToggleVisibility();
            return ;
        end;
    end, false, Enum.KeyCode.F9);
    l_ContextActionService_0:BindCoreAction("TogglePerformanceStats", function(v23, v24)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) then
            if v23 ~= "TogglePerformanceStats" then
                return ;
            elseif v24 ~= Enum.UserInputState.Begin then
                return ;
            else
                l_UserGameSettings_0.PerformanceStatsVisible = not l_UserGameSettings_0.PerformanceStatsVisible;
                return ;
            end;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, Enum.KeyCode.F7);
    l_ContextActionService_0:BindCoreAction("LeaveGame", function(_, v26, _)
        local v28 = v14:getState();
        if v26 == Enum.UserInputState.Begin and v28.isMenuOpen then
            if not v12.pagesByKey[v28.menuPage].isModal then
                v14:dispatch(v9(v13.LeaveGamePromptPageKey));
                return Enum.ContextActionResult.Sink;
            else
                return Enum.ContextActionResult.Pass;
            end;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, Enum.KeyCode.L, Enum.KeyCode.ButtonX);
    l_ContextActionService_0:BindCoreAction("ResetCharacter", function(_, v30, _)
        local v32 = v14:getState();
        if v30 == Enum.UserInputState.Begin and v32.isMenuOpen then
            if v32.respawn.enabled then
                if not v12.pagesByKey[v32.menuPage].isModal then
                    if v32.menuPage == v13.InitalPageKey then
                        return Enum.ContextActionResult.Pass;
                    else
                        v14:dispatch(v8(true));
                        return Enum.ContextActionResult.Sink;
                    end;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            else
                return Enum.ContextActionResult.Pass;
            end;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, Enum.KeyCode.R, Enum.KeyCode.ButtonY);
    l_ContextActionService_0:BindCoreAction("NavigateBack", function(_, v34, _)
        local v36 = v14:getState();
        local l_parentPage_0 = v12.pagesByKey[v36.menuPage].parentPage;
        local l_v4_Visibility_0 = v4:GetVisibility();
        if v34 == Enum.UserInputState.End and (v36.isMenuOpen or l_v4_Visibility_0) then
            if not l_v4_Visibility_0 then
                if not (l_parentPage_0 == nil) or v36.respawn.dialogOpen then
                    v14:dispatch(v10());
                else
                    v14:dispatch(v7);
                end;
            else
                v4:SetVisibility(false);
            end;
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, Enum.KeyCode.ButtonB);
    local function _()
        local v39 = v14:getState();
        local v40 = false;
        if v39.menuPage ~= "Controls" then
            v40 = ((v39.isMenuOpen and not v39.respawn.dialogOpen) and not v39.report.dialogOpen) and not v39.report.reportSentOpen;
        end;
        return v40;
    end;
    l_ContextActionService_0:BindCoreAction("LeftBumperSwitchToZone0", function(_, v43, _)
        if v43 == Enum.UserInputState.Begin then
            local v45 = v14:getState();
            local v46 = false;
            if v45.menuPage ~= "Controls" then
                v46 = ((v45.isMenuOpen and not v45.respawn.dialogOpen) and not v45.report.dialogOpen) and not v45.report.reportSentOpen;
            end;
            if v46 then
                v14:dispatch(v11(0));
                return Enum.ContextActionResult.Sink;
            end;
        end;
        return Enum.ContextActionResult.Pass;
    end, false, Enum.KeyCode.ButtonL1);
    l_ContextActionService_0:BindCoreAction("RightBumperSwitchToZone1", function(_, v48, _)
        if v48 == Enum.UserInputState.Begin then
            local v50 = v14:getState();
            local v51 = false;
            if v50.menuPage ~= "Controls" then
                v51 = ((v50.isMenuOpen and not v50.respawn.dialogOpen) and not v50.report.dialogOpen) and not v50.report.reportSentOpen;
            end;
            if v51 then
                v14:dispatch(v11(1));
                return Enum.ContextActionResult.Sink;
            end;
        end;
        return Enum.ContextActionResult.Pass;
    end, false, Enum.KeyCode.ButtonR1);
end;
