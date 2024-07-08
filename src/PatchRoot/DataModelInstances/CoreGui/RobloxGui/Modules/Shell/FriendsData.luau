local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = nil;
pcall(function()
    v2 = game:GetService("PlatformService");
end);
local v3 = nil;
pcall(function()
    v3 = game:GetService("FriendService");
end);
local v4 = nil;
pcall(function()
    v4 = game:GetService("ThirdPartyUserService");
end);
local v5 = UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows;
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local v10 = require(l_CorePackages_0.tutils);
local l_ReloaderManager_0 = require(l_Shell_0:FindFirstChild("ReloaderManager"));
local l_SafeAsync_0 = require(l_Shell_0:FindFirstChild("SafeAsync"));
local v13 = require(l_Shell_0.AppState);
local v14 = require(l_Shell_0.Actions.ResetUserThumbnails);
local v15 = require(l_Shell_0.Actions.SetFriendsData);
local v16 = require(l_Shell_0.Actions.SetRenderedFriendsData);
local v17 = {
    Setup = nil, 
    Reset = nil
};
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AuthenticationSuccess, "FriendsData", function()
    v17.Setup();
end);
if v4 then
    v4.ActiveUserSignedOut:connect(function()
        v17.Reset();
    end);
end;
local v18 = false;
local v19 = false;
local v20 = false;
local v21 = nil;
local v22 = {};
local v23 = {};
local function v29(v24)
    for v25 = 1, #v24 do
        local v26 = v24[v25];
        if v26.gamertag == "" then
            v26.gamertag = nil;
        end;
        if v26.robloxuid <= 0 then
            v26.robloxuid = nil;
        end;
        if v26.xuid == "" then
            v26.xuid = nil;
        end;
        if v26.placeId == 0 then
            v26.placeId = nil;
        end;
        if v26.lastLocation == "" then
            v26.lastLocation = nil;
        end;
        if v26.robloxName == "" then
            v26.robloxName = nil;
        end;
        local l_placeId_0 = v26.placeId;
        local l_lastLocation_0 = v26.lastLocation;
        v26.placeId = l_placeId_0;
        v26.lastLocation = l_lastLocation_0;
    end;
    return v24;
end;
v17.OnFriendsDataUpdated = l_Utility_0.Signal();
v17.GetOnlineFriendsAsync = function()
    if not v21 then
        while not (not v19 or v21) do
            wait();
        end;
    end;
    return v21 or {};
end;
v17.ConnectUpdateEvent = function(v30)
    table.insert(v23, (v17.OnFriendsDataUpdated:connect(v30)));
end;
v17.Reset = function()
    v18 = false;
    for v31, v32 in pairs(v23) do
        l_Utility_0.DisconnectEvent(v32);
        v23[v31] = nil;
    end;
    v19 = false;
    v21 = nil;
    v22 = {};
    v13.store:dispatch(v14());
    v13.store:dispatch(v15());
    v13.store:dispatch(v16());
    v20 = false;
    if v5 then
        l_ReloaderManager_0:removeReloader("FriendsData");
        v17.ReloaderFuncId = nil;
    end;
end;
local function v39(v33)
    local v34 = {};
    for v35 = 1, #v33 do
        local v36 = v33[v35];
        local v37 = tostring((v36.xuid or "") .. "#" .. (v36.robloxuid or ""));
        v34[v37] = true;
        if v22[v37] and next((v10.tableDifference(v22[v37], v36))) ~= nil then
            v36.isUpdated = true;
        end;
        v22[v37] = v36;
    end;
    for v38 in pairs(v22) do
        if not v34[v38] then
            v22[v38] = nil;
        end;
    end;
end;
local function _(v40)
    v13.store:dispatch(v16(v40));
    v39(v40);
    v21 = v40;
    v17.OnFriendsDataUpdated:fire(v40);
end;
v17.SuspendUpdate = function(_)
    v20 = true;
end;
v17.ResumeUpdate = function(_)
    if v13.store:getState().Friends.initialized then
        local l_data_0 = v13.store:getState().Friends.data;
        v13.store:dispatch(v16(l_data_0));
        v39(l_data_0);
        v21 = l_data_0;
        v17.OnFriendsDataUpdated:fire(l_data_0);
    end;
    v20 = false;
end;
v17.Setup = function()
    v17.Reset();
    if not v2 or not v3 then
        if v5 then
            local v63 = l_SafeAsync_0({
                asyncFunc = function()
                    local v45 = {};
                    local v46 = l_Http_0.GetRecommendedUsersndsAsync();
                    if not (not v46 or not v46.recommendedUsers) then
                        local v47 = {};
                        local l_recommendedUsers_0 = v46.recommendedUsers;
                        local v49 = {};
                        for v50 = 1, #l_recommendedUsers_0 do
                            local v51 = l_recommendedUsers_0[v50];
                            local l_userId_0 = v51.userId;
                            if l_userId_0 then
                                table.insert(v49, l_userId_0);
                                v47[l_userId_0] = {
                                    robloxuid = l_userId_0, 
                                    robloxName = v51.userName
                                };
                            end;
                        end;
                        local v53 = l_Http_0.GetUsersPresenceAsync(v49);
                        if not (not v53 or not v53.userPresences) then
                            for _, v55 in ipairs(v53.userPresences) do
                                local l_userId_1 = v55.userId;
                                if not (not l_userId_1 or not v47[l_userId_1]) then
                                    v47[l_userId_1].placeId = v55.rootPlaceId;
                                    v47[l_userId_1].lastLocation = v55.lastLocation;
                                    v47[l_userId_1].friendsSource = "Roblox";
                                    local v57 = "Offline";
                                    local v58 = 4;
                                    if v55.userPresenceType == 1 then
                                        v57 = "Online";
                                        v58 = 3;
                                    elseif v55.userPresenceType == 2 then
                                        if v55.rootPlaceId and v55.rootPlaceId > 0 then
                                            v57 = "InGame";
                                            v58 = 1;
                                        else
                                            v57 = "Online";
                                            v58 = 3;
                                        end;
                                    elseif v55.userPresenceType == 3 then
                                        v57 = "InStudio";
                                        v58 = 2;
                                    end;
                                    v47[l_userId_1].robloxStatus = v57;
                                    v47[l_userId_1].rank = v58;
                                    table.insert(v45, v47[l_userId_1]);
                                end;
                            end;
                        end;
                        table.sort(v45, function(v59, v60)
                            if v59.rank == v60.rank then
                                return v59.robloxName:lower() < v60.robloxName:lower();
                            else
                                return v59.rank < v60.rank;
                            end;
                        end);
                    end;
                    return v45;
                end, 
                callback = function(v61)
                    v61 = v29(v61);
                    v13.store:dispatch(v15(v61));
                    if not (v13.store:getState().RenderedFriends.initialized and v20) then
                        local l_v61_0 = v61;
                        v13.store:dispatch(v16(l_v61_0));
                        v39(l_v61_0);
                        v21 = l_v61_0;
                        v17.OnFriendsDataUpdated:fire(l_v61_0);
                    end;
                end, 
                userRelated = true
            });
            if not v18 then
                v18 = true;
                v19 = true;
                spawn(function()
                    l_ReloaderManager_0:removeReloader("FriendsData");
                    v17.ReloaderFuncId = l_ReloaderManager_0:addReloaderFunc("FriendsData", function()
                        v63();
                    end, 30, true);
                    l_ReloaderManager_0:callReloaderFunc("FriendsData", v17.ReloaderFuncId);
                end);
            end;
        end;
    else
        table.insert(v23, v3.FriendsUpdated:connect(function(v64)
            v64 = v29(v64);
            v13.store:dispatch(v15(v64));
            if not (v13.store:getState().RenderedFriends.initialized and v20) then
                local l_v64_0 = v64;
                v13.store:dispatch(v16(l_v64_0));
                v39(l_v64_0);
                v21 = l_v64_0;
                v17.OnFriendsDataUpdated:fire(l_v64_0);
            end;
        end));
        v19 = true;
        local l_status_0, l_result_0 = pcall(function()
            return v3:GetPlatformFriends();
        end);
        if l_status_0 then
            l_result_0 = v29(l_result_0);
            v13.store:dispatch(v15(l_result_0));
            if not (v13.store:getState().RenderedFriends.initialized and v20) then
                local l_l_result_0_0 = l_result_0;
                v13.store:dispatch(v16(l_l_result_0_0));
                v39(l_l_result_0_0);
                v21 = l_l_result_0_0;
                v17.OnFriendsDataUpdated:fire(l_l_result_0_0);
                return ;
            end;
        end;
    end;
end;
return v17;
