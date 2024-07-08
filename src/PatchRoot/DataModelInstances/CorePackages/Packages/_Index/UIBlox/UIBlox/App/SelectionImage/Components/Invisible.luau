local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Roact);
return function(v1)
    return v0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v0.Ref] = v1.cursorRef
    });
end;
