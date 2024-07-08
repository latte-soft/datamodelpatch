local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v5 = require(script.Parent.processConversations);
return function(v6)
    return function(v7)
        if v2.GetConversations.getStatus(v7:getState(), v6) == v4.Enum.NetworkStatus.Fetching then
            return v3.resolve({});
        else
            return v7:dispatch(v2.GetConversations.API(v6)):andThen(function(v8)
                v7:dispatch(v5(v8.responseBody));
                return v8;
            end):catch(function(v9)
                warn("NetworkingChat failure in DEPRECATED_getConversations, Status: " .. tostring(v9));
            end);
        end;
    end;
end;
