local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Symbol);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = {};
local v4 = v1.named("PaginatedFetchThunkTag");
v3.middleware = function(v5, v6)
    v2.isType(v5, "table", "pageObjectManager");
    v2.isInTypes(v6, {
        "table", 
        "Instance"
    }, "avatarEditorService");
    return function(v7, v8)
        return function(v9)
            if typeof(v9) == "table" and v9[v4] == true then
                return v9(v8, v5, v6);
            else
                return v7(v9);
            end;
        end;
    end;
end;
v3.new = function(v10, v11)
    v2.isNonEmptyString(v10, "name");
    v2.isType(v11, "function", "onInvoke");
    return (setmetatable({
        [v4] = true, 
        type = v10
    }, {
        __call = function(_, ...)
            return v11(...);
        end
    }));
end;
v3.test = function(v13, v14, v15, v16)
    local l_assert_0 = v2.assert;
    local v18 = false;
    if type(v13) == "table" then
        v18 = v13[v4] == true;
    end;
    l_assert_0(v18, "'thunk' must be a valid PaginatedFetchThunk");
    return v13(v14, v15, v16);
end;
return v3;
