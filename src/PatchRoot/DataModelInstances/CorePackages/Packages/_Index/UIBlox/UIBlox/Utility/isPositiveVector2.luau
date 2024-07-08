local v0 = require(script.Parent.Parent.Parent.t);
return (v0.intersection(v0.Vector2, function(v1)
    if not (v1.X >= 0) or v1.Y < 0 then
        return false, ("each component of the Vector2 must be >= 0; component values are: %d, %d"):format(v1.X, v1.Y);
    else
        return true;
    end;
end));
