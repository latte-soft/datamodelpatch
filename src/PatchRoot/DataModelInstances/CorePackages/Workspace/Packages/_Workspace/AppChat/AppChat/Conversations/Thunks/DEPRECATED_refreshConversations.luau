local v0 = require(script.Parent.DEPRECATED_refreshChangedConversations);
return function(v1)
    return function(v2)
        local v3 = if not not v1 and v1.DEPRECATED_refreshChangedConversations then v1.DEPRECATED_refreshChangedConversations else v0;
        if v2:getState().ChatAppReducer.Conversations == nil then
            v3(v2);
            return ;
        else
            v3(v2);
            return ;
        end;
    end;
end;
