local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local v1 = require(l_script_FirstAncestor_0.requests.createCreateVirtualEvent);
local v2 = require(l_script_FirstAncestor_0.requests.createUpdateVirtualEvent);
local v3 = require(l_script_FirstAncestor_0.requests.createDeleteVirtualEvent);
local v4 = require(l_script_FirstAncestor_0.requests.createGetVirtualEvent);
local v5 = require(l_script_FirstAncestor_0.requests.createGetMyVirtualEvents);
local v6 = require(l_script_FirstAncestor_0.requests.createGetActiveVirtualEvents);
local v7 = require(l_script_FirstAncestor_0.requests.createGetVirtualEventRsvps);
local v8 = require(l_script_FirstAncestor_0.requests.createUpdateMyRsvpStatus);
local v9 = require(l_script_FirstAncestor_0.requests.createGetVirtualEventRsvpCounts);
local _ = require(l_script_FirstAncestor_0.types);
return function(v11)
    local l_roduxNetworking_0 = v11.roduxNetworking;
    return {
        CreateVirtualEvent = v1(l_roduxNetworking_0), 
        UpdateVirtualEvent = v2(l_roduxNetworking_0), 
        DeleteVirtualEvent = v3(l_roduxNetworking_0), 
        GetVirtualEvent = v4(l_roduxNetworking_0), 
        GetMyVirtualEvents = v5(l_roduxNetworking_0), 
        GetActiveVirtualEvents = v6(l_roduxNetworking_0), 
        GetVirtualEventRsvps = v7(l_roduxNetworking_0), 
        UpdateMyRsvpStatus = v8(l_roduxNetworking_0), 
        GetVirtualEventRsvpCounts = v9(l_roduxNetworking_0), 
        VirtualEventModel = require(l_script_FirstAncestor_0.models.VirtualEventModel), 
        createMockVirtualEventResponse = require(l_script_FirstAncestor_0.createMockVirtualEventResponse)
    };
end;
