local v0 = require(script.Parent.Parent.ArgCheck);
return function(v1, v2)
    assert(typeof(v1) == "Vector2", "getSafeAreaSize expects screenSize to be a Vector2");
    assert(type(v2) == "table", "getSafeAreaSize expects guiInset to be a table");
    v0.isNonNegativeNumber(v2.left, "getSafeAreaSize: guiInset.left");
    v0.isNonNegativeNumber(v2.right, "getSafeAreaSize: guiInset.right");
    v0.isNonNegativeNumber(v2.top, "getSafeAreaSize: guiInset.top");
    v0.isNonNegativeNumber(v2.bottom, "getSafeAreaSize: guiInset.bottom");
    local v3 = (v1.X - v2.left) - v2.right;
    local v4 = (v1.Y - v2.top) - v2.bottom;
    v0.isNonNegativeNumber(v3, "getSafeAreaSize: safeAreaWidth");
    v0.isNonNegativeNumber(v4, "getSafeAreaSize: safeAreaHeight");
    return UDim2.new(0, v3, 0, v4);
end;
