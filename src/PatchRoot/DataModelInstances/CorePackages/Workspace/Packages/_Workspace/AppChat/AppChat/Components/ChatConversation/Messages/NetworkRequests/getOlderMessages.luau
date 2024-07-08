local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local l_GET_MESSAGES_0 = require(l_script_FirstAncestor_0.Constants).PageSize.GET_MESSAGES;
local v3 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local function _(v5, v6, v7)
    if not v3() then
        return function(v8)
            return v8:dispatch(v4.GetMessages.API(v5, l_GET_MESSAGES_0, v6)):catch(function(v9)
                warn("NetworkingChat failure in getOlderMessages, Status: " .. tostring(v9));
            end);
        end;
    else
        return function(v10)
            return v10:dispatch(v1.rodux.GetOlderMessages.API(v5, v7)):catch(function(v11)
                warn("AppChatNetworking failure in getOlderMessages, Status: " .. tostring(v11));
            end);
        end;
    end;
end;
return function(...)
    local v13, v14, v15 = ...;
    if not v3() then
        return function(v16)
            return v16:dispatch(v4.GetMessages.API(v13, l_GET_MESSAGES_0, v14)):catch(function(v17)
                warn("NetworkingChat failure in getOlderMessages, Status: " .. tostring(v17));
            end);
        end;
    else
        return function(v18)
            return v18:dispatch(v1.rodux.GetOlderMessages.API(v13, v15)):catch(function(v19)
                warn("AppChatNetworking failure in getOlderMessages, Status: " .. tostring(v19));
            end);
        end;
    end;
end;
