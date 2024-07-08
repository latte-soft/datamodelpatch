local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local l_getConversationDisplayTitle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation.getConversationDisplayTitle;
return function(v3, v4, v5)
    if not v3 or not v3.isDefaultTitle then
        return l_getConversationDisplayTitle_0(v3);
    elseif v4 then
        if not v1.isEmpty(v4) then
            return table.concat(v1.List.map(v1.List.sort(v4, function(v6, v7)
                return string.lower(v6.names.combinedName) < string.lower(v7.names.combinedName);
            end), function(v8)
                return v8.names.combinedName;
            end), ", ");
        else
            return v5;
        end;
    else
        return "";
    end;
end;
