local v0 = require(script.Parent.Parent.Parent.Parent.Parent.t);
return v0.strictInterface({
    Color = v0.Color3, 
    AnimatedColor = v0.Color3, 
    Transparency = v0.numberConstrained(0, 1), 
    GradientRotationSpeed = v0.number, 
    GradientColorSequence = v0.ColorSequence, 
    GradientTransparencySequence = v0.NumberSequence, 
    Rotation = v0.number
});
