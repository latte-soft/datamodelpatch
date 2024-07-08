local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v4 = require(l_Parent_0.ArgCheck);
return function(v5, v6)
    v4.isType(v5, "table", "formatMessages.messages");
    v4.isType(v6, "table", "formatMessages.messageData");
    return v2.List.map(v5, function(v7)
        if not v7.placeId then
            return v2.Dictionary.join(v6, v7);
        else
            return v2.Dictionary.join(v6, v7, {
                messageType = v3.Link, 
                content = v2.None
            });
        end;
    end);
end;
