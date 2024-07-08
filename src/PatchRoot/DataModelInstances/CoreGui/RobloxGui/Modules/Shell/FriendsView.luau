local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v1 = nil;
pcall(function()
    v1 = game:GetService("PlatformService");
end);
local l_FriendsData_0 = require(l_Shell_0:FindFirstChild("FriendsData"));
local l_FriendPresenceItem_0 = require(l_Shell_0:FindFirstChild("FriendPresenceItem"));
local l_SideBar_0 = require(l_Shell_0:FindFirstChild("SideBar"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_GameJoin_0 = require(l_Shell_0:FindFirstChild("GameJoin"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v13 = {
    JoinGame = l_LocalizedStrings_0:LocalizedString("JoinGameWord"), 
    ViewDetails = l_LocalizedStrings_0:LocalizedString("ViewGameDetailsWord"), 
    ViewProfile = l_LocalizedStrings_0:LocalizedString("ViewGamerCardWord"), 
    EmptyFriendSideBar = l_LocalizedStrings_0:LocalizedString("EmptyFriendSideBarWord")
};
local v14 = l_SideBar_0();
local function _(v15, v16)
    v15:SetDisplay(v16);
end;
return function(v18, v19, v20)
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = nil;
    local _ = function(v26, v27)
        l_Utility_0.DisconnectEvent(v24[v26]);
        v24[v26] = v26:GetContainer().MouseButton1Click:connect(function()
            if not v27 then
                l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Default), false);
                return ;
            else
                v14:RemoveAllItems();
                v14.GetAnalyticsInfo = function(_)
                    return {
                        [l_Analytics_0.WidgetNames("WidgetId")] = "FriendsSideBar"
                    };
                end;
                local v29 = true;
                if v27.robloxStatus == "InGame" then
                    local l_placeId_0 = v27.placeId;
                    local l_lastLocation_0 = v27.lastLocation;
                    local l_robloxuid_0 = v27.robloxuid;
                    v14:AddItem(v13.JoinGame, function()
                        l_GameJoin_0:StartGame(l_GameJoin_0.JoinType.Follow, l_robloxuid_0, nil, "FriendsSideBar");
                    end);
                    local l_l_placeId_0_0 = l_placeId_0 --[[ copy: 1 -> 4 ]];
                    v14:AddItem(v13.ViewDetails, function()
                        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameDetail, l_l_placeId_0_0, l_lastLocation_0, nil);
                    end);
                    v29 = false;
                end;
                if not (not (v27.xuid and #v27.xuid > 0) or not v1) then
                    local l_xuid_0 = v27.xuid;
                    v14:AddItem(v13.ViewProfile, function()
                        local l_status_0, l_result_0 = pcall(function()
                            v1:PopupProfileUI(Enum.UserInputType.Gamepad1, l_xuid_0);
                        end);
                        if not l_status_0 then
                            l_Utility_0.DebugLog("PlatformService:PopupProfileUI failed because,", l_result_0);
                        end;
                    end);
                    v29 = false;
                end;
                if v29 then
                    v14:SetText(v13.EmptyFriendSideBar);
                end;
                l_ScreenManager_0:OpenScreen(v14, false);
                return ;
            end;
        end);
    end;
    local function v52(v38)
        local v39 = v25[v38];
        if not v39 then
            return ;
        else
            local v40 = tostring((v39.xuid or "") .. "#" .. (v39.robloxuid or ""));
            local v41 = v22[v40];
            if v41 == nil then
                v41 = l_FriendPresenceItem_0(UDim2.new(0, 446, 0, 114), v40);
                v23[v40] = true;
                v22[v40] = v41;
            end;
            if v23[v40] then
                v41:SetDisplay(v39);
                local l_v41_0 = v41;
                l_Utility_0.DisconnectEvent(v24[l_v41_0]);
                v24[l_v41_0] = l_v41_0:GetContainer().MouseButton1Click:connect(function()
                    if not v39 then
                        l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Default), false);
                        return ;
                    else
                        v14:RemoveAllItems();
                        v14.GetAnalyticsInfo = function(_)
                            return {
                                [l_Analytics_0.WidgetNames("WidgetId")] = "FriendsSideBar"
                            };
                        end;
                        local v44 = true;
                        if v39.robloxStatus == "InGame" then
                            local l_placeId_1 = v39.placeId;
                            local l_lastLocation_1 = v39.lastLocation;
                            local l_robloxuid_1 = v39.robloxuid;
                            v14:AddItem(v13.JoinGame, function()
                                l_GameJoin_0:StartGame(l_GameJoin_0.JoinType.Follow, l_robloxuid_1, nil, "FriendsSideBar");
                            end);
                            local l_l_placeId_1_0 = l_placeId_1 --[[ copy: 1 -> 4 ]];
                            v14:AddItem(v13.ViewDetails, function()
                                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameDetail, l_l_placeId_1_0, l_lastLocation_1, nil);
                            end);
                            v44 = false;
                        end;
                        if not (not (v39.xuid and #v39.xuid > 0) or not v1) then
                            local l_xuid_1 = v39.xuid;
                            v14:AddItem(v13.ViewProfile, function()
                                local l_status_1, l_result_1 = pcall(function()
                                    v1:PopupProfileUI(Enum.UserInputType.Gamepad1, l_xuid_1);
                                end);
                                if not l_status_1 then
                                    l_Utility_0.DebugLog("PlatformService:PopupProfileUI failed because,", l_result_1);
                                end;
                            end);
                            v44 = false;
                        end;
                        if v44 then
                            v14:SetText(v13.EmptyFriendSideBar);
                        end;
                        l_ScreenManager_0:OpenScreen(v14, false);
                        return ;
                    end;
                end);
                v23[v40] = nil;
            end;
            return v41:GetContainer();
        end;
    end;
    local function v60(v53)
        local v54 = {};
        v25 = v53;
        for v55 = 1, #v25 do
            local v56 = v25[v55];
            if v56 then
                local v57 = tostring((v56.xuid or "") .. "#" .. (v56.robloxuid or ""));
                if v56.isUpdated then
                    v23[v57] = true;
                end;
                v54[v57] = true;
            end;
        end;
        for v58, v59 in pairs(v22) do
            if not v54[v58] then
                v23[v58] = true;
                v59:Destroy();
                v22[v58] = nil;
            end;
        end;
        v18:SetItemCallback(v52);
        v18:RecalcLayout(#v25);
        if v20 then
            v20(#v25);
        end;
    end;
    v60(v19);
    l_FriendsData_0.ConnectUpdateEvent(v60);
    v21.GetDefaultFocusItem = function(_)
        return v18:GetSelectableItem();
    end;
    return v21;
end;
