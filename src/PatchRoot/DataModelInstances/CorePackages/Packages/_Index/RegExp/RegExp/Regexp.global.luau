local v0 = require(script.Parent.RegEx);
local v1 = {};
local v3 = {
    __index = v1, 
    __tostring = function(v2)
        return (tostring(v2._innerRegEx));
    end
};
v1.exec = function(v4, v5)
    local v6 = v4._innerRegEx:match(v5);
    if v6 then
        local v7 = v6:span();
        local v8 = v6:grouparr();
        local v9 = {
            v8[0]
        };
        for v10 = 1, v8.n do
            v9[v10 + 1] = v8[v10];
        end;
        v9.n = v8.n + 1;
        v9.index = v7;
        v9.input = v5;
        return v9;
    else
        return nil;
    end;
end;
v1.test = function(v11, v12)
    return v11:exec(v12) ~= nil;
end;
return (setmetatable(v1, {
    __call = function(_, v14, v15)
        v15 = v15 or "";
        return (setmetatable({
            source = v14, 
            ignoreCase = v15:find("i") ~= nil, 
            global = v15:find("g") ~= nil, 
            multiline = v15:find("m") ~= nil, 
            _innerRegEx = v0.new(v14, v15)
        }, v3));
    end
}));
