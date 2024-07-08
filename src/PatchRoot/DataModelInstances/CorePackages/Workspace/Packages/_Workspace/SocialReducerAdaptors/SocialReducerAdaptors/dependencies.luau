local l_Parent_0 = script.Parent.Parent;
return {
    Players = game:GetService("Players"), 
    llama = require(l_Parent_0.LuaSocialLibrariesDeps).llama, 
    Rodux = require(l_Parent_0.Rodux)
};
