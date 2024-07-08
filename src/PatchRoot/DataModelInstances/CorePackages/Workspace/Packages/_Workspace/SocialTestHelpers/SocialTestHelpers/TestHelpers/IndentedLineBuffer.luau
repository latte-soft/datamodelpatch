local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {
        linePrefix = "", 
        lines = {}
    };
    setmetatable(v1, v0);
    return v1;
end;
v0.addLine = function(v2, v3)
    table.insert(v2.lines, v2.linePrefix .. (v3 or ""));
end;
v0.indent = function(v4)
    v4.linePrefix = v4.linePrefix .. "   ";
end;
v0.unindent = function(v5)
    v5.linePrefix = v5.linePrefix:sub(1 + ("   "):len());
end;
v0.__tostring = function(v6)
    return table.concat(v6.lines, "\n") .. "\n";
end;
return v0;
