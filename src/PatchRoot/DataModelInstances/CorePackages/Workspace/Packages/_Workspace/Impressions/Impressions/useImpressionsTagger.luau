local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v3 = require(script.Parent.ImpressionsTagUtility);
return function(v4, v5, v6)
    v1.useEffect(function()
        v3.AddTag(v4, v5, v6);
        return function()
            v3.RemoveTag(v4, v5, v6);
        end;
    end, l_dependencyArray_0(v4, v5, v6));
end;
