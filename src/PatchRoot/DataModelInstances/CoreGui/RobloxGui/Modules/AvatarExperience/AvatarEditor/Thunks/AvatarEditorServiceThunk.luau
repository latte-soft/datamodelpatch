local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Symbol);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = {};
local v4 = v1.named("AvatarEditorServiceThunkTag");
v3.middleware = function(v5)
    return function(v6, v7)
        return function(v8)
            if typeof(v8) == "table" and v8[v4] == true then
                return v8(v7, v5);
            else
                return v6(v8);
            end;
        end;
    end;
end;
v3.new = function(v9, v10)
    v2.isNonEmptyString(v9, "name");
    v2.isType(v10, "function", "onInvoke");
    return (setmetatable({
        [v4] = true, 
        type = v9
    }, {
        __call = function(_, ...)
            return v10(...);
        end
    }));
end;
v3.test = function(v12, v13, v14)
    local l_assert_0 = v2.assert;
    local v16 = false;
    if type(v12) == "table" then
        v16 = v12[v4] == true;
    end;
    l_assert_0(v16, "'thunk' must be a valid AvatarEditorServiceThunk");
    return v12(v13, v14);
end;
return v3;
