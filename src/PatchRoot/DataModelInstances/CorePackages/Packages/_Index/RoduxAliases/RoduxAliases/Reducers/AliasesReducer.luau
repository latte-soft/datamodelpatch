local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Reducers.Aliases.byUserId);
local _ = require(l_Parent_0.RoduxAliasesTypes);
local v3 = {};
return function(v4)
    return function(v5, v6)
        return {
            byUserId = v1(v4)((v5 or v3).byUserId, v6)
        };
    end;
end;
