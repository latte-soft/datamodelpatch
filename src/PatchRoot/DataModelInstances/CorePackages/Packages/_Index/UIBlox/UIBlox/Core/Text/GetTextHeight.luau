local v0 = require(script.Parent.GetTextSize);
return function(v1, v2, v3, v4)
    return v0(v1, v3, v2, (Vector2.new(v4, 10000))).Y;
end;
