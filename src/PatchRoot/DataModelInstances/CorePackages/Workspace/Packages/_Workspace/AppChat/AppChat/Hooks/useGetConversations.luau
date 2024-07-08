local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_useSelector_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.RoactRodux.useSelector;
local v2 = require(l_script_FirstAncestor_0.Components.ChatLanding.Conversations.Selectors.selectConversations);
return function()
    return l_useSelector_0(function(v3)
        return v2(v3);
    end);
end;
