local l_Text_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).Text;
local _ = require(script.Parent.StyleTypes);
return function(v2, v3, v4)
    return l_Text_0.GetTextHeight(v2, v3, v4);
end;
