local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local v1 = require(l_script_FirstAncestor_0.Parent.enumerate);
local v2 = require(l_script_FirstAncestor_0.Enum.addRawValueMethodToEnum);
local v3 = {
    Approve = 1, 
    Deny = 2
};
local v4 = v1(script.Name, v3);
v2(v4, v3);
return v4;
