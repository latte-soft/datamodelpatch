local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.HttpRequest);
local v2 = require(l_script_FirstAncestor_0.Parent.RoduxNetworking);
local v3 = require(l_script_FirstAncestor_0.Parent.NetworkingVirtualEvents);
local v4 = require(l_script_FirstAncestor_0.Parent.NetworkingGames);
local v5 = require(l_script_FirstAncestor_0.logger);
local v11 = v2.config({
    keyPath = "VirtualEvents.networkStatus", 
    networkImpl = v1.config({
        requestFunction = function(v6, v7, v8)
            v5:debug("GET {}", v6);
            return v1.requestFunctions.RequestInternal(v6, v7, v8);
        end, 
        postRequestFunction = function(v9, v10)
            v5:debug("{} {} {}", v9.StatusCode, v10.url, v9.Body);
        end, 
        maxRetryCount = game:DefineFastInt("VirtualEventsHttpRetryCount", 3)
    })
});
return {
    RoduxNetworking = v11, 
    NetworkingVirtualEvents = v3.config({
        roduxNetworking = v11
    }), 
    NetworkingGames = v4.config({
        roduxNetworking = v11
    })
};
