local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Rodux);
local _ = require(l_Parent_0.SocialCommon);
return v1.makeActionCreator(script.Name, function(v3)
    return {
        entryPoint = v3
    };
end);
