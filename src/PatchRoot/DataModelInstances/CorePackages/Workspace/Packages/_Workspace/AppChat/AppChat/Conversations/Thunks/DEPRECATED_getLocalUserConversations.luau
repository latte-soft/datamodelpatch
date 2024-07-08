local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v5 = require(script.Parent.processConversations);
return function(v6, v7)
    return function(v8)
        if v2.GetUserConversations.getStatus(v8:getState(), v6) == v4.Enum.NetworkStatus.Fetching then
            return v3.resolve();
        else
            return v8:dispatch(v2.GetUserConversations.API(v6, v7)):andThen(function(v9)
                v8:dispatch(v5(v9.responseBody));
            end):catch(function(v10)
                warn("NetworkingChat failure in DEPRECATED_getLocalUserConversations, Status: " .. tostring(v10));
            end);
        end;
    end;
end;
