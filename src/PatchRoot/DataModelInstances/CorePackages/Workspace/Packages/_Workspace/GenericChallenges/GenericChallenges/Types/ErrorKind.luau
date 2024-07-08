local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.addRawValueMethodToEnum);
local v3 = require(l_Parent_0.enumerate);
local v4 = {
    Unknown = "Unknown", 
    Invalidated = "Invalidated", 
    Abandoned = "Abandoned", 
    LoadFailed = "LoadFailed"
};
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;
