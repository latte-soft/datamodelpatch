local v0 = require(script.Parent.getOlderMessages);
local _ = function(v1)
    for v2, v3, _ in v1:CreateReverseIterator() do
        if v3.previousMessageId == nil then
            return v2;
        end;
    end;
    return v1.keys[1];
end;
return function(v6, v7)
    return function(v8)
        v7 = v7 or v8:getState().ChatAppReducer.conversations;
        for v9, v10 in pairs(v7) do
            if v10.fetchingOlderMessages then
                local l_messages_0 = v10.messages;
                local v12;
                for v13, v14, _ in l_messages_0:CreateReverseIterator() do
                    if v14.previousMessageId == nil then
                        v12 = v13;
                        goto label0 --[[  true, false  ]];
                    end;
                end;
                v12 = l_messages_0.keys[1];
                ::label0::;
                v8:dispatch(v0(v9, v12, v10.nextCursor, v6));
            end;
        end;
    end;
end;
