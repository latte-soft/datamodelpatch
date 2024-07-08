local v0 = require(script.Parent.GetTextSize);
return function(v1, v2, v3, v4, v5)
    return string.rep(" ", (math.ceil((v4 + v5) / (v0("  ", v2, v3, Vector2.new(0, 0)) - v0(" ", v2, v3, Vector2.new(0, 0))).X))) .. v1;
end;
