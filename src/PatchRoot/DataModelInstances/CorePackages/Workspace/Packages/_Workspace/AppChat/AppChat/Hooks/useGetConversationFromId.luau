local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_useSelector_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.RoactRodux.useSelector;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
return function(v3)
    return l_useSelector_0(function(v4)
        return v2(v4, (("ChatAppReducer.Conversations.%*"):format(v3)));
    end);
end;
