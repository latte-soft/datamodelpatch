return {
    name = script.Parent.Name, 
    storyRoots = {
        script.Parent.Components
    }, 
    roact = require(script:FindFirstAncestor("VerifiedBadges").Parent.Dev.RoactCompat)
};
