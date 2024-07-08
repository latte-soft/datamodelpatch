local v0 = require(script.Parent.Parent.Parent.Parent.Parent.React);
local v1 = require(script.Parent.Parent.CursorComponent);
local v2 = UDim.new(0, 8);
return v0.forwardRef(function(v3, v4)
    return v0.createElement(v1, {
        isVisible = v3.isVisible, 
        cornerRadius = v2, 
        offset = 6, 
        borderWidth = 3, 
        ref = v4
    });
end);
