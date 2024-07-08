local v0 = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React);
return function(v1)
    local v2 = if not v1.children then {} else table.clone(v1.children);
    local v3 = table.clone(v1);
    v3.cornerRadius = nil;
    v3.padding = nil;
    v3.children = nil;
    local v4 = if typeof(v1.padding) == "number" then {
        PaddingBottom = UDim.new(0, v1.padding), 
        PaddingLeft = UDim.new(0, v1.padding), 
        PaddingRight = UDim.new(0, v1.padding), 
        PaddingTop = UDim.new(0, v1.padding)
    } else if typeof(v1.padding) == "table" then {
        PaddingTop = UDim.new(0, if not not v1.padding and v1.padding[1] then v1.padding[1] else 0), 
        PaddingRight = UDim.new(0, if not not v1.padding and v1.padding[2] then v1.padding[2] else 0), 
        PaddingBottom = UDim.new(0, if not not v1.padding and v1.padding[3] then v1.padding[3] else 0), 
        PaddingLeft = UDim.new(0, if not not v1.padding and v1.padding[4] then v1.padding[4] else 0)
    } else nil;
    if v4 then
        v2.Padding = v0.createElement("UIPadding", v4);
    end;
    if v1.cornerRadius then
        v2.Radius = v0.createElement("UICorner", {
            CornerRadius = v1.cornerRadius
        });
    end;
    return v0.createElement("Frame", v3, v2);
end;
