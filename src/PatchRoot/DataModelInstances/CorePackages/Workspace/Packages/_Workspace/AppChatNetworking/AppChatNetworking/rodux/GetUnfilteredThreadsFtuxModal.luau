local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v2 = require(l_script_FirstAncestor_0.Constants);
return require(script.Parent.RoduxNetworking).POST(script, function(v3)
    return v3(v1):path("v1"):path("get-modal-sequence"):body({
        modal_sequence = v2.UnfilteredThreadsModalSequence
    }):setStatusIds({
        v2.UnfilteredThreadsModalSequence
    });
end);
