local v0 = {};
local v1 = {
    __index = v0
};
v0.new = function()
    return (setmetatable({
        _lines = {}
    }, v1));
end;
v0.write = function(v2, v3, ...)
    if select("#", ...) == 0 then
        table.insert(v2._lines, v3);
        return v2;
    else
        table.insert(v2._lines, v3:format(...));
        return v2;
    end;
end;
v0.verticalSpace = function(v4)
    if #v4._lines ~= 0 then
        table.insert(v4._lines, "");
    end;
    return v4;
end;
v0.toString = function(v5)
    return table.concat(v5._lines, "\n");
end;
return v0;
