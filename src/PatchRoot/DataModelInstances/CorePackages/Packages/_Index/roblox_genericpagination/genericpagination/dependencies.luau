local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
return {
    t = require(l_script_FirstAncestor_0.t), 
    LinkedList = require(l_Parent_0.LinkedList), 
    Promise = require(l_script_FirstAncestor_0.Promise)
};
