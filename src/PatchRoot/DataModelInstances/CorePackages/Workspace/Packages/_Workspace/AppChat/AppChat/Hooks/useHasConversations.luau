local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v4 = require(l_Parent_0.Cryo);
return function()
    return l_useSelector_0(function(v5)
        return not v4.isEmpty(v3(v5, "ChatAppReducer.Conversations") or {});
    end);
end;
