local l_Roact_0 = require(script:FindFirstAncestor("SocialTab").dependencies).Roact;
local v1 = require(script.Components.UserCarouselContainer);
return {
    render = function(v2)
        return l_Roact_0.createElement(v1, v2);
    end
};
