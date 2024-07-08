local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
return function(v3)
    return v2.createElement("Frame", {
        BackgroundColor3 = v3.backgroundColor, 
        BackgroundTransparency = v3.backgroundTransparency, 
        Size = UDim2.new(1, 0, 1, 0)
    }, v1.Dictionary.join({
        Padding = v2.createElement("UIPadding", {
            PaddingRight = UDim.new(0, v3.cornerRadius), 
            PaddingLeft = UDim.new(0, v3.cornerRadius), 
            PaddingTop = UDim.new(0, v3.cornerRadius), 
            PaddingBottom = UDim.new(0, v3.cornerRadius)
        }), 
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v3.cornerRadius)
        })
    }, v3.children));
end;
