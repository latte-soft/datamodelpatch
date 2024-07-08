local v0 = {
    Groups = {
        {
            GroupId = 1200769, 
            ChatColor = Color3.new(1, 0.8431372549019608, 0)
        }
    }, 
    Players = {
        {}
    }
};
local _ = function(v1, v2)
    local v3 = true;
    if type(v2) ~= "nil" then
        v3 = type(v2) == "number";
    end;
    assert(v3, "requiredRank must be a number or nil");
    return function(v4)
        if not v4 or not v4.UserId then
            return false;
        else
            local _ = v4.UserId;
            local v6 = false;
            local l_status_0, l_result_0 = pcall(function()
                if not v2 then
                    v6 = v4:IsInGroup(v1);
                    return ;
                else
                    v6 = v2 < v4:GetRankInGroup(v1);
                    return ;
                end;
            end);
            if not (l_status_0 or not l_result_0) then
                print("Error checking in group: " .. l_result_0);
            end;
            return v6;
        end;
    end;
end;
(function()
    if v0.Groups then
        for _, v11 in pairs(v0.Groups) do
            local l_GroupId_0 = v11.GroupId;
            local l_Rank_0 = v11.Rank;
            local v14 = true;
            if type(l_Rank_0) ~= "nil" then
                v14 = type(l_Rank_0) == "number";
            end;
            assert(v14, "requiredRank must be a number or nil");
            v11.IsInGroup = function(v15)
                if not v15 or not v15.UserId then
                    return false;
                else
                    local _ = v15.UserId;
                    local v17 = false;
                    local l_status_1, l_result_1 = pcall(function()
                        if not l_Rank_0 then
                            v17 = v15:IsInGroup(l_GroupId_0);
                            return ;
                        else
                            v17 = l_Rank_0 < v15:GetRankInGroup(l_GroupId_0);
                            return ;
                        end;
                    end);
                    if not (l_status_1 or not l_result_1) then
                        print("Error checking in group: " .. l_result_1);
                    end;
                    return v17;
                end;
            end;
        end;
    end;
end)();
local l_Players_0 = game:GetService("Players");
local function v27(v21)
    if v0.Players then
        local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v21);
        if l_l_Players_0_FirstChild_0 then
            for _, v24 in pairs(v0.Players) do
                if l_l_Players_0_FirstChild_0.UserId == v24.UserId then
                    return v24.ChatColor;
                end;
            end;
        end;
    end;
    if v0.Groups then
        for _, v26 in pairs(v0.Groups) do
            if v26.IsInGroup(l_Players_0:FindFirstChild(v21)) then
                return v26.ChatColor;
            end;
        end;
    end;
end;
return function(v28)
    local v29 = {
        Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157), 
        Color3.new(0.00392156862745098, 0.6352941176470588, 1), 
        Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353), 
        BrickColor.new("Bright violet").Color, 
        BrickColor.new("Bright orange").Color, 
        BrickColor.new("Bright yellow").Color, 
        BrickColor.new("Light reddish violet").Color, 
        BrickColor.new("Brick yellow").Color
    };
    local function v35(v30)
        local v31 = 0;
        for v32 = 1, #v30 do
            local v33 = string.byte((string.sub(v30, v32, v32)));
            local v34 = (#v30 - v32) + 1;
            if #v30 % 2 == 1 then
                v34 = v34 - 1;
            end;
            if v34 % 4 >= 2 then
                v33 = -v33;
            end;
            v31 = v31 + v33;
        end;
        return v31;
    end;
    local function _(v36)
        return v29[(v35(v36) + 0) % #v29 + 1];
    end;
    local function _(v38)
        local l_v38_Player_0 = v38:GetPlayer();
        if l_v38_Player_0 and l_v38_Player_0.Team ~= nil then
            return l_v38_Player_0.TeamColor.Color;
        else
            return v29[(v35(v38.Name) + 0) % #v29 + 1];
        end;
    end;
    local function v46(v41)
        local l_v28_Speaker_0 = v28:GetSpeaker(v41);
        if not l_v28_Speaker_0:GetExtraData("NameColor") then
            local v43 = "NameColor";
            local l_l_v28_Speaker_0_Player_0 = l_v28_Speaker_0:GetPlayer();
            l_v28_Speaker_0:SetExtraData(v43, if not not l_l_v28_Speaker_0_Player_0 and l_l_v28_Speaker_0_Player_0.Team ~= nil then l_l_v28_Speaker_0_Player_0.TeamColor.Color else v29[(v35(l_v28_Speaker_0.Name) + 0) % #v29 + 1]);
        end;
        if not l_v28_Speaker_0:GetExtraData("ChatColor") then
            local v45 = v27(v41);
            if v45 then
                l_v28_Speaker_0:SetExtraData("ChatColor", v45);
            end;
        end;
        if not l_v28_Speaker_0:GetExtraData("Tags") then
            l_v28_Speaker_0:SetExtraData("Tags", {});
        end;
    end;
    v28.SpeakerAdded:connect(v46);
    for _, v48 in pairs(v28:GetSpeakerList()) do
        v46(v48);
    end;
    local v49 = {};
    l_Players_0.PlayerAdded:connect(function(v50)
        v49[v50] = v50.Changed:connect(function(v51)
            local l_v28_Speaker_1 = v28:GetSpeaker(v50.Name);
            if l_v28_Speaker_1 and (not (v51 ~= "TeamColor" and v51 ~= "Neutral") or v51 == "Team") then
                local v53 = "NameColor";
                local l_l_v28_Speaker_1_Player_0 = l_v28_Speaker_1:GetPlayer();
                l_v28_Speaker_1:SetExtraData(v53, if not not l_l_v28_Speaker_1_Player_0 and l_l_v28_Speaker_1_Player_0.Team ~= nil then l_l_v28_Speaker_1_Player_0.TeamColor.Color else v29[(v35(l_v28_Speaker_1.Name) + 0) % #v29 + 1]);
            end;
        end);
    end);
    l_Players_0.PlayerRemoving:connect(function(v55)
        local v56 = v49[v55];
        if v56 then
            v56:Disconnect();
        end;
        v49[v55] = nil;
    end);
end;
