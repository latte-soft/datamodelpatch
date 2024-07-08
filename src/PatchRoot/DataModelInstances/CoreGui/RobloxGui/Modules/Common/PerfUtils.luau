local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Stats_0 = game:GetService("Stats");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_InGameMenu_0 = l_RobloxGui_0.Modules.InGameMenu;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v6 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v7 = require(l_InGameMenu_0.Utility.SendAnalytics);
local v8 = require(script.Parent.Constants);
local v9 = require(l_InGameMenu_0.Resources.Constants);
local v10 = require(script.Parent.Flags.GetFFlagEnableInGameMenuDurationLogger)();
local v11 = if not l_Stats_0 then nil else l_Stats_0:FindFirstChild("FrameRateManager");
local v12 = if not v11 then nil else v11:FindFirstChild("RenderAverage");
local function _()
    if not v6() then
        return 1;
    else
        return 2;
    end;
end;
local function _(v14)
    if not v14 then
        return v9.ShieldCloseAnimationTweenTime;
    else
        return v9.ShieldOpenAnimationTweenTime;
    end;
end;
local function _()
    return os.clock();
end;
local function v17()
    if not v12 then
        return nil;
    else
        return 1000 / v12:GetValue();
    end;
end;
local v18 = l_HttpService_0:GenerateGUID();
local v19 = os.clock();
local v20 = os.clock();
local v21 = nil;
local v22 = nil;
local v23 = false;
local v24 = false;
local v25 = 0;
local function v28(v26, v27)
    v27.fps = if not v12 then nil else 1000 / v12:GetValue();
    v27.menu_version = not v6() and 1 or 2;
    if v10 then
        v26 = v26 .. "_v" .. v27.menu_version;
    end;
    if v27.menu_session then
        if not v10 then
            v7(v8.AnalyticsInGameMenuName, v26, v27);
        else
            l_default_0:logEvent(v26, v27);
            return ;
        end;
    end;
end;
local function v31()
    local v29 = if not v10 then v8.AnalyticsPerfMenuOpening else v8.AnalyticsGameMenuOpenStart;
    local v30 = {
        menu_session = v21, 
        game_session = v18, 
        count = v25, 
        interrupted_closing = v23
    };
    if v10 then
        v28(v8.AnalyticsGameMenuFlowStart, v30);
    end;
    v28(v29, v30);
end;
local function _(v32, v33)
    v28(if not v10 then v8.AnalyticsPerfMenuStarted else v8.AnalyticsGameMenuOpenEnd, {
        menu_session = v21, 
        transition_time_total = v32, 
        transition_time_normalized = v33
    });
end;
local function v39(v35, v36)
    local v37 = if not v10 then v8.AnalyticsPerfMenuClosed else v8.AnalyticsGameMenuCloseEnd;
    local v38 = {
        menu_session = v22, 
        transition_time_total = v35, 
        transition_time_normalized = v36
    };
    v28(v37, v38);
    if v10 then
        v28(v8.AnalyticsGameMenuFlowEnd, v38);
    end;
end;
local function _(v40, v41)
    v28(if not v10 then v8.AnalyticsPerfMenuEnding else v8.AnalyticsGameMenuCloseStart, {
        menu_session = v21, 
        session_time = v40, 
        reason = not v41 and "resume" or "leaving", 
        interrupted_opening = v24
    });
end;
return {
    menuOpenBegin = function()
        if not v21 then
            v25 = v25 + 1;
            v19 = os.clock();
            v21 = l_HttpService_0:GenerateGUID();
            v31();
            v24 = true;
            v23 = false;
            return ;
        else
            return ;
        end;
    end, 
    menuOpenComplete = function()
        local v43 = os.clock() - v19;
        v28(if not v10 then v8.AnalyticsPerfMenuStarted else v8.AnalyticsGameMenuOpenEnd, {
            menu_session = v21, 
            transition_time_total = v43, 
            transition_time_normalized = v43 - v9.ShieldOpenAnimationTweenTime
        });
        v24 = false;
    end, 
    menuClose = function()
        v20 = os.clock();
        v28(if not v10 then v8.AnalyticsPerfMenuEnding else v8.AnalyticsGameMenuCloseStart, {
            menu_session = v21, 
            session_time = v20 - v19, 
            reason = "resume", 
            interrupted_opening = v24
        });
        v22 = v21;
        v21 = nil;
        v24 = false;
        v23 = true;
    end, 
    menuCloseComplete = function()
        local v44 = os.clock() - v20;
        v39(v44, v44 - v9.ShieldCloseAnimationTweenTime);
        v22 = nil;
        v23 = false;
    end, 
    leavingGame = function()
        v28(if not v10 then v8.AnalyticsPerfMenuEnding else v8.AnalyticsGameMenuCloseStart, {
            menu_session = v21, 
            session_time = os.clock() - v19, 
            reason = "leaving", 
            interrupted_opening = v24
        });
        v21 = nil;
    end, 
    getFps = v17
};
