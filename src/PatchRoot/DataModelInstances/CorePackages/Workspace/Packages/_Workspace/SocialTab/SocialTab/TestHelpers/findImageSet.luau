local l_UIBlox_0 = require(script:FindFirstAncestor("SocialTab").dependencies).UIBlox;
return function(v1)
    local v2 = l_UIBlox_0.App.ImageSet.Images[v1];
    return {
        Image = v2.Image, 
        ImageRectSize = v2.ImageRectSize, 
        ImageRectOffset = v2.ImageRectOffset
    };
end;
