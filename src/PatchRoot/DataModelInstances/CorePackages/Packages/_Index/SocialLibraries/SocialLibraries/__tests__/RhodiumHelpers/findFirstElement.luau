local l_Element_0 = require(script:FindFirstAncestor("Packages").Dev.Rhodium).Element;
local v1 = require(script.Parent.findFirstInstance);
return function(v2, v3)
    local v4 = v1(v2, v3);
    if not v4 then
        return nil;
    else
        return l_Element_0.new("game." .. v4:GetFullName());
    end;
end;
