local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v3 = require(script.Parent.processConversations);
return function(v4)
    v2:info("Fetching conversations by page with cursor {}", v4 or "nil");
    return function(v5)
        return v5:dispatch(v1.rodux.GetUserConversations.API(v4)):tap(function(v6)
            v5:dispatch(v3(v6.responseBody.conversations));
        end):andThen(function(v7)
            local l_responseBody_0 = v7.responseBody;
            if not (not l_responseBody_0 or not l_responseBody_0.next_cursor) and l_responseBody_0.next_cursor ~= "" then
                v2:debug("Next cursor found: {}", l_responseBody_0.next_cursor);
                return v4, l_responseBody_0.next_cursor;
            else
                v2:debug("No next cursor found");
                return v4, "";
            end;
        end):catch(function(v9)
            v2:warning("Error in GetUserConversations request. Error: {}", (tostring(v9)));
        end);
    end;
end;
