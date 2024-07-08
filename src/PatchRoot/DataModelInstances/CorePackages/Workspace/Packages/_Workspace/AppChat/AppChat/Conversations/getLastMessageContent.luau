local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
return function(v5)
    local v6 = v2(v5, "messages.keys");
    local v7 = v2(v5, "messages.values");
    if not (not v6 or not v7) then
        local v8 = v7[v6[#v6]];
        if v8 then
            if v8.messageType == v4.Link then
                return l_Url_0.WWW_URL .. "games/" .. v8.gameLink.universeId;
            else
                return (tostring(v8.content));
            end;
        end;
    end;
    return nil;
end;
