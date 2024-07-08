local v0 = {};
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local v3 = {};
v3.__index = v3;
v3.new = function(v4)
    local v5 = setmetatable({}, v3);
    v5.player = v4;
    v5.pendingGroupData = {};
    v5.pendingCanManage = {};
    v5.groupData = nil;
    v5.canManage = nil;
    return v5;
end;
v3.getGroupDataAsync = function(v6)
    if not v6.groupData then
        table.insert(v6.pendingGroupData, (coroutine.running()));
        coroutine.yield();
        return v6.groupData;
    else
        return v6.groupData;
    end;
end;
v3.getCanManageAsync = function(v7)
    if v7.canManage ~= nil then
        return v7.canManage;
    else
        table.insert(v7.pendingCanManage, (coroutine.running()));
        coroutine.yield();
        return v7.canManage;
    end;
end;
v3.setGroupData = function(v8, v9)
    v8.groupData = v9;
    local l_pendingGroupData_0 = v8.pendingGroupData;
    v8.pendingGroupData = {};
    for _, v12 in pairs(l_pendingGroupData_0) do
        coroutine.resume(v12);
    end;
end;
v3.setCanManage = function(v13, v14)
    v13.canManage = not not v14 or false;
    local l_pendingCanManage_0 = v13.pendingCanManage;
    v13.pendingCanManage = {};
    for _, v17 in pairs(l_pendingCanManage_0) do
        coroutine.resume(v17);
    end;
end;
v3.destroy = function(v18)
    for _, v20 in pairs(v18.pendingGroupData) do
        coroutine.resume(v20);
    end;
    for _, v22 in pairs(v18.pendingCanManage) do
        coroutine.resume(v22);
    end;
end;
local v23 = {};
local function _(v24)
    local v25 = v23[v24];
    if not v25 and v24.Parent ~= nil then
        v25 = v3.new(v24);
        v23[v24] = v25;
    end;
    return v25;
end;
spawn(function()
    game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerGroupDetails", math.huge).OnClientEvent:Connect(function(...)
        local v27 = {
            ...
        };
        if #v27 == 1 then
            for v28, v29 in pairs(v27[1]) do
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(v28)));
                if l_l_Players_0_PlayerByUserId_0 then
                    local v31 = v23[l_l_Players_0_PlayerByUserId_0];
                    if not v31 and l_l_Players_0_PlayerByUserId_0.Parent ~= nil then
                        v31 = v3.new(l_l_Players_0_PlayerByUserId_0);
                        v23[l_l_Players_0_PlayerByUserId_0] = v31;
                    end;
                    local l_v31_0 = v31;
                    if l_v31_0 then
                        l_v31_0:setGroupData(v29);
                    end;
                end;
            end;
            return ;
        else
            local v33 = v27[1];
            local v34 = v27[2];
            local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId((tonumber(v33)));
            if l_l_Players_0_PlayerByUserId_1 then
                local v36 = v23[l_l_Players_0_PlayerByUserId_1];
                if not v36 and l_l_Players_0_PlayerByUserId_1.Parent ~= nil then
                    v36 = v3.new(l_l_Players_0_PlayerByUserId_1);
                    v23[l_l_Players_0_PlayerByUserId_1] = v36;
                end;
                local l_v36_0 = v36;
                if l_v36_0 then
                    l_v36_0:setGroupData(v34);
                end;
            end;
            return ;
        end;
    end);
end);
coroutine.wrap(function()
    game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerCanManageDetails", math.huge).OnClientEvent:Connect(function(v38, v39)
        local l_l_Players_0_PlayerByUserId_2 = l_Players_0:GetPlayerByUserId((tonumber(v38)));
        if l_l_Players_0_PlayerByUserId_2 then
            local v41 = v23[l_l_Players_0_PlayerByUserId_2];
            if not v41 and l_l_Players_0_PlayerByUserId_2.Parent ~= nil then
                v41 = v3.new(l_l_Players_0_PlayerByUserId_2);
                v23[l_l_Players_0_PlayerByUserId_2] = v41;
            end;
            local l_v41_0 = v41;
            if l_v41_0 then
                l_v41_0:setCanManage(v39);
            end;
        end;
    end);
end)();
l_Players_0.PlayerRemoving:Connect(function(v43)
    if v23[v43] then
        local v44 = v23[v43];
        v23[v43] = nil;
        v44:destroy();
    end;
end);
local function _(v45)
    return function(v46)
        local v47 = v23[v46];
        if not v47 and v46.Parent ~= nil then
            v47 = v3.new(v46);
            v23[v46] = v47;
        end;
        local l_v47_0 = v47;
        if l_v47_0 then
            v47 = l_v47_0:getGroupDataAsync();
            if not (not v47 or not v47[v45]) then
                return true;
            end;
        end;
        return false;
    end;
end;
local v50 = {};
local v51 = "SpanishLocalizationExpert";
local l_v51_0 = v51 --[[ copy: 11 -> 15 ]];
local function v56(v53)
    local v54 = v23[v53];
    if not v54 and v53.Parent ~= nil then
        v54 = v3.new(v53);
        v23[v53] = v54;
    end;
    local l_v54_0 = v54;
    if l_v54_0 then
        v54 = l_v54_0:getGroupDataAsync();
        if not (not v54 or not v54[l_v51_0]) then
            return true;
        end;
    end;
    return false;
end;
local v57 = "BrazilianLocalizationExpert";
local l_v57_0 = v57 --[[ copy: 12 -> 16 ]];
v51 = function(v59)
    local v60 = v23[v59];
    if not v60 and v59.Parent ~= nil then
        v60 = v3.new(v59);
        v23[v59] = v60;
    end;
    local l_v60_0 = v60;
    if l_v60_0 then
        v60 = l_v60_0:getGroupDataAsync();
        if not (not v60 or not v60[l_v57_0]) then
            return true;
        end;
    end;
    return false;
end;
local v62 = "FrenchLocalizationExpert";
local l_v62_0 = v62 --[[ copy: 13 -> 17 ]];
v57 = function(v64)
    local v65 = v23[v64];
    if not v65 and v64.Parent ~= nil then
        v65 = v3.new(v64);
        v23[v64] = v65;
    end;
    local l_v65_0 = v65;
    if l_v65_0 then
        v65 = l_v65_0:getGroupDataAsync();
        if not (not v65 or not v65[l_v62_0]) then
            return true;
        end;
    end;
    return false;
end;
local v67 = "GermanLocalizationExpert";
local l_v67_0 = v67 --[[ copy: 14 -> 18 ]];
v62 = function(v69)
    local v70 = v23[v69];
    if not v70 and v69.Parent ~= nil then
        v70 = v3.new(v69);
        v23[v69] = v70;
    end;
    local l_v70_0 = v70;
    if l_v70_0 then
        v70 = l_v70_0:getGroupDataAsync();
        if not (not v70 or not v70[l_v67_0]) then
            return true;
        end;
    end;
    return false;
end;
setlist { ['R009[1 to 4]'] = 'R010 to R013' };
v56 = function()
    return function(v72)
        for v73 = 1, #v50 do
            if v50[v73](v72) then
                return true;
            end;
        end;
        return false;
    end;
end;
v51 = function()
    if game.CreatorType == Enum.CreatorType.Group then
        local v74 = "PlaceCreator";
        return function(v75)
            local v76 = v23[v75];
            if not v76 and v75.Parent ~= nil then
                v76 = v3.new(v75);
                v23[v75] = v76;
            end;
            local l_v76_0 = v76;
            if l_v76_0 then
                v76 = l_v76_0:getGroupDataAsync();
                if not (not v76 or not v76[v74]) then
                    return true;
                end;
            end;
            return false;
        end;
    else
        return function(v78)
            return v78.UserId == game.CreatorId;
        end;
    end;
end;
v57 = function(v79)
    local v80 = v23[v79];
    if not v80 and v79.Parent ~= nil then
        v80 = v3.new(v79);
        v23[v79] = v80;
    end;
    local l_v80_0 = v80;
    if not l_v80_0 then
        return false;
    else
        return l_v80_0:getCanManageAsync() or false;
    end;
end;
v67 = "Admin";
local l_v67_1 = v67 --[[ copy: 14 -> 19 ]];
v0.IsPlayerAdminAsync = function(v83)
    local v84 = v23[v83];
    if not v84 and v83.Parent ~= nil then
        v84 = v3.new(v83);
        v23[v83] = v84;
    end;
    local l_v84_0 = v84;
    if l_v84_0 then
        v84 = l_v84_0:getGroupDataAsync();
        if not (not v84 or not v84[l_v67_1]) then
            return true;
        end;
    end;
    return false;
end;
v67 = "Intern";
local l_v67_2 = v67 --[[ copy: 14 -> 20 ]];
v0.IsPlayerInternAsync = function(v87)
    local v88 = v23[v87];
    if not v88 and v87.Parent ~= nil then
        v88 = v3.new(v87);
        v23[v87] = v88;
    end;
    local l_v88_0 = v88;
    if l_v88_0 then
        v88 = l_v88_0:getGroupDataAsync();
        if not (not v88 or not v88[l_v67_2]) then
            return true;
        end;
    end;
    return false;
end;
v67 = "Star";
local l_v67_3 = v67 --[[ copy: 14 -> 21 ]];
v0.IsPlayerStarAsync = function(v91)
    local v92 = v23[v91];
    if not v92 and v91.Parent ~= nil then
        v92 = v3.new(v91);
        v23[v91] = v92;
    end;
    local l_v92_0 = v92;
    if l_v92_0 then
        v92 = l_v92_0:getGroupDataAsync();
        if not (not v92 or not v92[l_v67_3]) then
            return true;
        end;
    end;
    return false;
end;
v0.IsPlayerLocalizationExpertAsync = function(v94)
    for v95 = 1, #v50 do
        if v50[v95](v94) then
            return true;
        end;
    end;
    return false;
end;
if game.CreatorType == Enum.CreatorType.Group then
    v67 = "PlaceCreator";
    v62 = function(v96)
        local v97 = v23[v96];
        if not v97 and v96.Parent ~= nil then
            v97 = v3.new(v96);
            v23[v96] = v97;
        end;
        local l_v97_0 = v97;
        if l_v97_0 then
            v97 = l_v97_0:getGroupDataAsync();
            if not (not v97 or not v97[v67]) then
                return true;
            end;
        end;
        return false;
    end;
else
    v62 = function(v99)
        return v99.UserId == game.CreatorId;
    end;
end;
v0.IsPlayerPlaceOwnerAsync = v62;
v0.CanPlayerManagePlaceAsync = v57;
return v0;
