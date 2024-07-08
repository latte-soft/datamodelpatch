local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v5 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Reducers/" .. script.Name);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.ChatInputBarActivatedTeamMode);
local v8 = require(l_Actions_0.ChatInputBarActivatedWhisperMode);
local v9 = require(l_Actions_0.ChatInputBarResetTargetChannel);
local v10 = require(l_Actions_0.ClientAppLoaded);
local v11 = require(l_Actions_0.LocalTeamChanged);
local v12 = require(l_Actions_0.TargetTextChannelPropertyChanged);
local v13 = require(l_Actions_0.TextChannelCreated);
local v14 = require(l_Actions_0.TextChannelRemoved);
local v15 = require(l_Actions_0.PlayerRemoved);
local v16 = {
    allTextChannels = {}, 
    targetTextChannel = nil, 
    currentTeam = nil
};
local function _(v17, v18)
    local v19 = "RBXTeam" .. v18.TeamColor.Name;
    for v20, v21 in pairs(v17) do
        if v20 == v19 then
            return v21;
        end;
    end;
    return nil;
end;
local function _(v23, v24)
    for v25, v26 in pairs(v23) do
        if v25 == v24 then
            return v26;
        end;
    end;
    return nil;
end;
return v2.createReducer(v16, {
    [v10.name] = function(v28, v29)
        return l_Dictionary_0.join(v28, {
            currentTeam = if v29.team == nil then l_None_0 else v29.team
        });
    end, 
    [v13.name] = function(v30, v31)
        v5:trace("TextChannelCreated: {}", v31.textChannel.Name);
        return l_Dictionary_0.join(v30, {
            allTextChannels = l_Dictionary_0.join(v30.allTextChannels, {
                [v31.textChannel.Name] = v31.textChannel
            })
        });
    end, 
    [v14.name] = function(v32, v33)
        return l_Dictionary_0.join(v32, {
            allTextChannels = l_Dictionary_0.removeKey(v32.allTextChannels, v33.textChannel.Name)
        });
    end, 
    [v12.name] = function(v34, v35)
        v5:trace("TargetTextChannelPropertyChanged dispatched");
        return l_Dictionary_0.join(v34, {
            targetTextChannel = if v35.textChannel == nil then l_None_0 else v35.textChannel
        });
    end, 
    [v11.name] = function(v36, v37)
        if not v37.team then
            v5:trace("LocalTeamChanged dispatched with no team");
            return l_Dictionary_0.join(v36, {
                currentTeam = l_None_0, 
                targetTextChannel = v36.allTextChannels.RBXGeneral or l_None_0
            });
        else
            v5:trace("LocalTeamChanged dispatched with team: {}", v37.team.Name);
            if not v36.targetTextChannel or not string.find(v36.targetTextChannel.Name, "^RBXTeam") then
                return l_Dictionary_0.join(v36, {
                    currentTeam = v37.team
                });
            else
                local l_allTextChannels_0 = v36.allTextChannels;
                local v39 = "RBXTeam" .. v37.team.TeamColor.Name;
                local v40;
                for v41, v42 in pairs(l_allTextChannels_0) do
                    if v41 == v39 then
                        v40 = v42;
                        goto label0 --[[  true, false  ]];
                    end;
                end;
                v40 = nil;
                ::label0::;
                return l_Dictionary_0.join(v36, {
                    currentTeam = v37.team, 
                    targetTextChannel = if v40 == nil then v36.allTextChannels.RBXGeneral else v40
                });
            end;
        end;
    end, 
    [v7.name] = function(v43, _)
        if v43.currentTeam == nil then
            v5:trace("ChatInputBarActivatedTeamMode but not on a team");
            return v43;
        else
            assert(v43.currentTeam, "This should be unreachable");
            local l_allTextChannels_1 = v43.allTextChannels;
            local v46 = "RBXTeam" .. v43.currentTeam.TeamColor.Name;
            local v47;
            for v48, v49 in pairs(l_allTextChannels_1) do
                if v48 == v46 then
                    v47 = v49;
                    goto label1 --[[  true, false  ]];
                end;
            end;
            v47 = nil;
            ::label1::;
            v5:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", not not v47 and v47.Name or "nil");
            return l_Dictionary_0.join(v43, {
                targetTextChannel = if v47 == nil then l_None_0 else v47
            });
        end;
    end, 
    [v9.name] = function(v50, _)
        return l_Dictionary_0.join(v50, {
            targetTextChannel = v50.allTextChannels.RBXGeneral or l_None_0
        });
    end, 
    [v8.name] = function(v52, v53)
        local l_allTextChannels_2 = v52.allTextChannels;
        local l_channelName_0 = v53.channelName;
        local v56;
        for v57, v58 in pairs(l_allTextChannels_2) do
            if v57 == l_channelName_0 then
                v56 = v58;
                goto label2 --[[  true, false  ]];
            end;
        end;
        v56 = nil;
        ::label2::;
        v5:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", not not v56 and v56.Name or "nil");
        return l_Dictionary_0.join(v52, {
            targetTextChannel = if v56 == nil then l_None_0 else v56
        });
    end, 
    [v15.name] = function(v59, v60)
        local function _(v61)
            return string.find(v61, "RBXWhisper:") and string.find(v61, v60.userId);
        end;
        local l_targetTextChannel_0 = v59.targetTextChannel;
        if l_targetTextChannel_0 then
            local l_Name_0 = l_targetTextChannel_0.Name;
            if string.find(l_Name_0, "RBXWhisper:") and string.find(l_Name_0, v60.userId) then
                l_targetTextChannel_0 = v59.allTextChannels.RBXGeneral;
            end;
        end;
        return l_Dictionary_0.join(v59, {
            targetTextChannel = l_targetTextChannel_0, 
            allTextChannels = l_Dictionary_0.filter(v59.allTextChannels, function(_, v66)
                return not (string.find(v66, "RBXWhisper:") and string.find(v66, v60.userId));
            end)
        });
    end
});
