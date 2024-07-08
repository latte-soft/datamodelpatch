local v1 = require(script.Parent.class)("Symbol", function(v0)
    return {
        name = v0
    };
end);
v1.toString = function(v2)
    return ("Symbol(%s)"):format(v2.name);
end;
return v1;
