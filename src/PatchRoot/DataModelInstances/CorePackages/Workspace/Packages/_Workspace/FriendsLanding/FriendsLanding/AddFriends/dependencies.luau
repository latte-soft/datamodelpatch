local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
return v2.llama.Dictionary.join(v2, {
    Signal = require(l_Parent_0.AppCommonLib).Signal
});
