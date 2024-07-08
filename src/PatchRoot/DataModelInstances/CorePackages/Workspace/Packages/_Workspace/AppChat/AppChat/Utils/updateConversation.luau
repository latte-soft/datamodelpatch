local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
local v2 = require(l_script_FirstAncestor_0.Conversations.hasSameParticipants);
local v3 = require(script.Parent.addConversation);
local v4 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
return function(v5, v6)
    local v7 = v5[v6.id];
    if v7 then
        if v6.title ~= v7.title then
            local v8 = l_Immutable_0.JoinDictionaries(v7, {
                lastUpdated = v6.lastUpdated, 
                title = v6.title, 
                isDefaultTitle = v6.isDefaultTitle
            });
            v5 = l_Immutable_0.Set(v5, v6.id, v8);
            if v4() then
                v7 = v8;
            end;
        end;
        if not v2({
            existing = v7.participants, 
            new = v6.participants
        }) then
            local v9 = l_Immutable_0.JoinDictionaries(v7, {
                participants = v6.participants, 
                lastUpdated = v6.lastUpdated, 
                title = v6.title
            });
            v5 = l_Immutable_0.Set(v5, v6.id, v9);
            if v4() then
                v7 = v9;
            end;
        end;
        if not (not v6.hasUnreadMessages or v7.hasUnreadMessages) then
            local v10 = l_Immutable_0.JoinDictionaries(v7, {
                hasUnreadMessages = true, 
                lastUpdated = v6.lastUpdated
            });
            v5 = l_Immutable_0.Set(v5, v6.id, v10);
            if v4() then
                v7 = v10;
            end;
        end;
        if v4() then
            if v7.moderationType ~= v6.moderationType then
                local v11 = l_Immutable_0.JoinDictionaries(v7, {
                    moderationType = v6.moderationType, 
                    lastUpdated = v6.lastUpdated
                });
                v5 = l_Immutable_0.Set(v5, v6.id, v11);
                v7 = v11;
            end;
            if v7.userPendingStatus ~= v6.userPendingStatus then
                local v12 = l_Immutable_0.JoinDictionaries(v7, {
                    userPendingStatus = v6.userPendingStatus, 
                    lastUpdated = v6.lastUpdated
                });
                v5 = l_Immutable_0.Set(v5, v6.id, v12);
                v7 = v12;
            end;
        end;
        return v5;
    else
        return v3(v5, v6);
    end;
end;
