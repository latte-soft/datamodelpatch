local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local v3 = require(script.Parent.Analytics);
local v4 = require(script.Parent.AppState);
local v5 = require(script.Parent.GlobalSettings);
local v6 = require(script.Parent.Models.ScreenItem);
local v7 = require(script.Parent.SoundManager);
local v8 = require(script.Parent.Utility);
local v9 = require(script.Parent.PageHeartbeatTimer);
local v10 = require(script.Parent.Actions.InsertScreen);
local v11 = require(script.Parent.Actions.RemoveScreen);
local l_contentHistory_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("contentHistory"));
local v13 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v14 = {};
local v15 = {};
local v16 = {
    [1] = l_RobloxGui_0
};
local function _(v17)
    local l_DefaultPriority_0 = v5.DefaultPriority;
    if v17.GetPriority ~= nil then
        l_DefaultPriority_0 = v17:GetPriority();
    end;
    return l_DefaultPriority_0;
end;
local function v23(v20, v21)
    if v20 and type(v20.GetAnalyticsInfo) == "function" then
        local l_v20_AnalyticsInfo_0 = v20:GetAnalyticsInfo();
        if not (not (type(l_v20_AnalyticsInfo_0) == "table") or not l_v20_AnalyticsInfo_0[v3.WidgetNames("WidgetId")]) then
            l_v20_AnalyticsInfo_0.Status = v21;
            v3.SetRBXEventStream("Widget", l_v20_AnalyticsInfo_0);
        end;
    end;
end;
v14.GetScreenGuiByPriority = function(_, v25)
    v25 = math.max(1, v25);
    if not v16[v25] then
        for v26 = 1, v25 do
            if not v16[v26] then
                v16[v26] = v8.Create("ScreenGui")({
                    Name = "AppShell" .. tostring(v26), 
                    Parent = l_CoreGui_0
                });
            end;
        end;
    end;
    return v16[v25];
end;
v14.OpenScreen = function(_, v28, v29)
    if v29 == nil then
        v29 = true;
    end;
    local v30 = {
        hidePrevious = v29
    };
    local v31 = tostring(v28);
    v15[v31] = {
        screen = v28, 
        isShown = false
    };
    local l_new_0 = v6.new;
    local l_v31_0 = v31;
    local l_DefaultPriority_1 = v5.DefaultPriority;
    if v28.GetPriority ~= nil then
        l_DefaultPriority_1 = v28:GetPriority();
    end;
    l_new_0 = l_new_0(l_v31_0, l_DefaultPriority_1, v30);
    if v13() > 0 then
        l_v31_0 = v14:GetTopScreen();
        if l_v31_0 then
            l_contentHistory_0:setLastSelectedContent(l_v31_0);
        end;
    end;
    v4.store:dispatch(v10(l_new_0));
end;
v14.CloseCurrent = function(_, v36)
    local l_ScreenList_0 = v4.store:getState().ScreenList;
    local v38 = false;
    if #l_ScreenList_0 > 0 then
        v38 = l_ScreenList_0[1];
    end;
    if v38 and v15[v38.id] then
        if v36 and v38.id ~= tostring(v36) then
            return ;
        else
            v4.store:dispatch(v11(v38));
            return ;
        end;
    else
        return ;
    end;
end;
local function v50(v39)
    local v40 = {};
    for _, v42 in ipairs(v39) do
        v40[v42.id] = true;
    end;
    local v43 = {};
    for v44, _ in pairs(v15) do
        if not v40[v44] then
            table.insert(v43, v44);
        end;
    end;
    for _, v47 in ipairs(v43) do
        local v48 = v15[v47];
        if v48 then
            local l_screen_0 = v48.screen;
            l_screen_0:RemoveFocus();
            l_screen_0:Hide();
            if l_screen_0.ScreenRemoved then
                l_screen_0:ScreenRemoved();
            end;
            v23(l_screen_0, "Close");
        end;
        v15[v47] = nil;
    end;
end;
local function v58(v51)
    for v52 = #v51, 1, -1 do
        local v53 = v15[v51[v52].id];
        if v53 then
            local l_screen_1 = v53.screen;
            if v52 > 1 then
                local v55 = true;
                local v56 = v51[v52 - 1];
                if not (not v56 or not v56.data) then
                    v55 = v56.data.hidePrevious;
                end;
                l_screen_1:RemoveFocus();
                if v55 then
                    l_screen_1:Hide();
                    v53.isShown = false;
                end;
                if not (v53.isShown or v55) then
                    l_screen_1:Show();
                    v53.isShown = true;
                end;
            else
                if not v53.isShown then
                    l_screen_1:Show();
                    v53.isShown = true;
                    v23(l_screen_1, "Show");
                end;
                l_screen_1:Focus();
                v23(l_screen_1, "Focus");
                local v57 = v53.screen.GetAnalyticsInfo and v53.screen.GetAnalyticsInfo();
                if v57 then
                    v9.onPageChanged(v57[v3.WidgetNames("WidgetId")]);
                end;
            end;
        end;
    end;
    v3.reportPageChanged();
end;
local function _(v59)
    v50(v59);
    v58(v59);
end;
v4.store.changed:connect(function(v61, v62)
    local l_ScreenList_1 = v61.ScreenList;
    if l_ScreenList_1 == v62.ScreenList then
        return ;
    else
        v50(l_ScreenList_1);
        v58(l_ScreenList_1);
        return ;
    end;
end);
v14.ContainsScreen = function(_, v65)
    for _, v67 in pairs(v15) do
        if v67.screen == v65 then
            return true;
        end;
    end;
    return false;
end;
v14.GetScreenBelow = function(_, v69)
    local l_ScreenList_2 = v4.store:getState().ScreenList;
    for v71, v72 in ipairs(l_ScreenList_2) do
        if v72.id == tostring(v69) then
            local v73 = l_ScreenList_2[v71 + 1];
            if v73 then
                local v74 = v15[v73.id];
                if v74 then
                    return v74.screen;
                end;
            end;
        end;
    end;
    return nil;
end;
v14.GetTopScreen = function(_)
    local l_ScreenList_3 = v4.store:getState().ScreenList;
    if l_ScreenList_3 and #l_ScreenList_3 > 0 then
        return v15[l_ScreenList_3[1].id].screen;
    else
        return nil;
    end;
end;
local function v77(v78, v79)
    if v78 == nil then
        return ;
    else
        if not (not v78:IsA("ImageLabel") and not v78:IsA("ImageButton")) then
            table.insert(v79, v8.PropertyTweener(v78, "ImageTransparency", 1, v78.ImageTransparency, 0.5, v8.EaseOutQuad));
        end;
        if v78:IsA("GuiObject") then
            table.insert(v79, v8.PropertyTweener(v78, "BackgroundTransparency", 1, v78.BackgroundTransparency, 0.5, v8.EaseOutQuad));
        end;
        if not (not (v78:IsA("TextLabel") or v78:IsA("TextBox")) and not v78:IsA("TextButton")) then
            table.insert(v79, v8.PropertyTweener(v78, "TextTransparency", 1, v78.TextTransparency, 0.5, v8.EaseOutQuad));
        end;
        for _, v81 in pairs(v78:GetChildren()) do
            v77(v81, v79);
        end;
        return ;
    end;
end;
v14.FadeInSitu = function(_, v83)
    local v84 = {};
    if v83 then
        v77(v83, v84);
    end;
    return v84;
end;
v14.DefaultFadeIn = function(_, v86)
    local v87 = {};
    if v86 then
        table.insert(v87, v8.PropertyTweener(v86, "Position", v86.Position + UDim2.new(0.15, 0, 0, 0), v86.Position, 0.5, function(v88, v89, v90, v91)
            if v91 <= v88 then
                return v89 + v90;
            else
                v88 = v88 / v91;
                local v92 = v88 * (v88 - 2);
                return -UDim2.new(v90.X.Scale * v92, v90.X.Offset * v92, v90.Y.Scale * v92, v90.Y.Offset * v92) + v89;
            end;
        end));
        v77(v86, v87);
    end;
    return v87;
end;
v14.DefaultCancelFade = function(_, v94)
    if v94 then
        for _, v96 in pairs(v94) do
            v96:Finish();
        end;
    end;
    return nil;
end;
v14.PlayDefaultOpenSound = function(_)
    v7:Play("ScreenChange");
end;
return v14;
