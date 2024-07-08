local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v2 = require(l_script_FirstAncestor_0.Conversations.populateConversationWithState);
local function v5(v3, v4)
    if not v3.unixTime or not v4.unixTime then
        if v3.unixTime or v4.unixTime then
            return (v3.unixTime or v4.unixTime) == v3.unixTime;
        else
            return string.lower(v3.title) < string.lower(v4.title);
        end;
    else
        return v4.unixTime < v3.unixTime;
    end;
end;
local v6 = nil;
local v7 = nil;
return function(v8)
    local v9 = v1(v8, "ChatAppReducer.Conversations");
    if v9 then
        local v10 = v1(v8, "ChatAppReducer.ConversationsAsync.latestMessagesIsFetching");
        if not (v9 == v6) then
            if not v10 or not v7 then
                local v11 = {};
                for _, v13 in pairs(v9) do
                    table.insert(v11, (v2(v8, v13)));
                end;
                table.sort(v11, v5);
                v6 = v9;
                v7 = v11;
                return v11;
            else
                return v7;
            end;
        else
            return v7;
        end;
    else
        return {};
    end;
end;
