local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.AppChatNetworking);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
return function(v4)
    return function(v5)
        if not v4 or #v4 == 0 then
            return v3.resolve({});
        else
            local v6 = {};
            local l_GET_CONVERSATIONS_0 = v1.Constants.PageSize.GET_CONVERSATIONS;
            for v8 = 1, #v4, l_GET_CONVERSATIONS_0 do
                table.insert(v6, v5:dispatch(v1.rodux.MultiGetConversationDetails.API((v2.List.getRange(v4, v8, (v8 + l_GET_CONVERSATIONS_0) - 1)))));
            end;
            return v3.all(v6):andThen(function(v9)
                return v2.List.foldLeft(v9, function(v10, v11)
                    local v12 = (v11 and v11.responseBody) and v11.responseBody.conversations;
                    if v12 then
                        return v2.List.join(v10, v12);
                    else
                        return v10;
                    end;
                end, {});
            end);
        end;
    end;
end;
