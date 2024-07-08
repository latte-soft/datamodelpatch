local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v2 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.responses.SharedTypes);
return require(script.Parent.RoduxNetworking).POST(script, function(v4, v5, v6)
    return v4(v1):path("v1"):path("record-modal-sequence-response"):body({
        action_type = v5, 
        modal_sequence = v2.UnfilteredThreadsModalSequence, 
        modal_variant = v6
    }):setStatusIds({
        v2.UnfilteredThreadsModalSequence
    });
end);
