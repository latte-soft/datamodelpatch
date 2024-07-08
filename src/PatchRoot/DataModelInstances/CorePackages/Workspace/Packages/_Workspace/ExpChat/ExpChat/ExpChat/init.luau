local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
return {
    roact = require(l_script_FirstAncestor_0.Parent.Roact), 
    mapStory = require(script.storyMiddleware), 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};
