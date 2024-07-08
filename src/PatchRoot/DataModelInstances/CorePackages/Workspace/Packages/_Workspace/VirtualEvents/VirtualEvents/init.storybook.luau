local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = require(l_script_FirstAncestor_0.Parent.RoactCompat), 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};
