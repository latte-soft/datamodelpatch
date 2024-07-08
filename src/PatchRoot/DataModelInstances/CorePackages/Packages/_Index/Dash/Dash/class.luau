local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local function _(v2)
    require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v2);
end;
local function v4(v5, v6)
    v6 = v6 or function()
        return {};
    end;
    local v7 = {
        name = v5
    };
    v7.new = function(...)
        local v8 = v6(...);
        setmetatable(v8, {
            __index = v7, 
            __tostring = v7.toString, 
            __eq = v7.equals, 
            __lt = v7.__lt, 
            __le = v7.__le, 
            __add = v7.__add, 
            __sub = v7.__sub, 
            __mul = v7.__mul, 
            __div = v7.__div, 
            __mod = v7.__mod
        });
        v8.Class = v7;
        v8:_init(...);
        return v8;
    end;
    v7._init = function(_)
    end;
    v7.isInstance = function(v10)
        local l_status_0, l_result_0 = pcall(function()
            local v11 = getmetatable(v10);
            while true do
                if not v11 then
                    return false;
                elseif v11.__index == v7 then
                    return true;
                else
                    v11 = getmetatable(v11.__index);
                end;
            end;
        end);
        return l_status_0 and l_result_0;
    end;
    v7.extend = function(v14, v15, v16)
        local v17 = v4(v15, v16 or v7.new);
        setmetatable(v17, {
            __index = v14
        });
        return v17;
    end;
    v7.toString = function(v18)
        return v18.name;
    end;
    v7.equals = function(v19, v20)
        return (rawequal(v19, v20));
    end;
    v7.__lt = function(_, _)
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({
            methodName = "__lt", 
            className = v5
        });
    end;
    v7.__le = function(_, _)
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({
            methodName = "__le", 
            className = v5
        });
    end;
    v7.__add = function(_)
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({
            methodName = "__add", 
            className = v5
        });
    end;
    v7.__sub = function(_)
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({
            methodName = "__sub", 
            className = v5
        });
    end;
    v7.__mul = function(_)
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({
            methodName = "__mul", 
            className = v5
        });
    end;
    v7.__div = function(_)
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({
            methodName = "__div", 
            className = v5
        });
    end;
    v7.__mod = function(_)
        require(l_Parent_0.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({
            methodName = "__mod", 
            className = v5
        });
    end;
    return v7;
end;
return v4;
