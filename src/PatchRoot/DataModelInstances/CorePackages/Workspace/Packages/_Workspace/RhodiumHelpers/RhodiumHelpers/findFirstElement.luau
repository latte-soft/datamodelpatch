local l_Parent_0 = script.Parent.Parent;
local l_Element_0 = require(l_Parent_0.Rhodium).Element;
local l_findFirstInstance_0 = require(l_Parent_0.TestUtils).findFirstInstance;
return function(v3, v4)
    local v5 = l_findFirstInstance_0(v3, v4);
    if not v5 then
        return nil;
    else
        return l_Element_0.new("game." .. v5:GetFullName());
    end;
end;
