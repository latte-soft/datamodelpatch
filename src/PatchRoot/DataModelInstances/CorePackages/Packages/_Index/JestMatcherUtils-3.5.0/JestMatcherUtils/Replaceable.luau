local l_getType_0 = require(script.Parent.Parent.JestGetType).getType;
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = {
        object = v2, 
        type = l_getType_0(v2)
    };
    if v3.type ~= "table" then
        error("Type " .. v3.type .. " is not supported in Replaceable");
    end;
    setmetatable(v3, v1);
    return v3;
end;
v1.isReplaceable = function(v4, v5)
    local v6 = l_getType_0(v4);
    local v7 = l_getType_0(v5);
    local v8 = false;
    if v6 == v7 then
        v8 = v6 == "table";
    end;
    return v8;
end;
v1.forEach = function(v9, v10)
    for v11, v12 in pairs(v9.object) do
        v10(v12, v11, v9.object);
    end;
end;
v1.get = function(v13, v14)
    return v13.object[v14];
end;
v1.set = function(v15, v16, v17)
    v15.object[v16] = v17;
end;
return v1;
