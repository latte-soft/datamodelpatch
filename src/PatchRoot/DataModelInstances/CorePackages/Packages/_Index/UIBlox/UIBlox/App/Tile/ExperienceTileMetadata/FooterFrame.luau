local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = {
    size = UDim2.fromScale(1, 1)
};
return function(v4)
    local v5 = v2.Dictionary.join(v3, v4);
    return v1.createElement("Frame", {
        Size = v5.size, 
        Position = v5.position, 
        AnchorPoint = v5.anchorPoint, 
        LayoutOrder = v5.layoutOrder, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, v5.children);
end;
