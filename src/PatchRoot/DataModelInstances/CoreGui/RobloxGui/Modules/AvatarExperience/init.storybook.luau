local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperience");
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = require(game:GetService("CorePackages").Packages.Roact), 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};
