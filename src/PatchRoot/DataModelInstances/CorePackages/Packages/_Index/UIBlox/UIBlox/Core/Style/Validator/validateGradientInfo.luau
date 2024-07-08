local v0 = require(script.Parent.Parent.Parent.Parent.Parent.t);
return v0.strictInterface({
    Color = v0.ColorSequence, 
    Transparency = v0.NumberSequence, 
    Rotation = v0.number, 
    Offset = v0.optional(v0.Vector2)
});
