local l_UIBlox_0 = require(script:FindFirstAncestor("Style").Parent.SharedFlags).UIBlox;
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = {
        _enableNewFont = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.getDefault = function(v4)
    if not v4._enableNewFont then
        return Enum.Font.Gotham;
    else
        return Enum.Font.BuilderSans;
    end;
end;
v1.getMedium = function(v5)
    if not v5._enableNewFont then
        return Enum.Font.GothamMedium;
    else
        return Enum.Font.BuilderSansMedium;
    end;
end;
v1.getBlack = function(v6)
    if not v6._enableNewFont then
        return Enum.Font.GothamBlack;
    else
        return Enum.Font.BuilderSansExtraBold;
    end;
end;
v1.getBold = function(v7)
    if not v7._enableNewFont then
        return Enum.Font.GothamBold;
    else
        return Enum.Font.BuilderSansBold;
    end;
end;
v1.getSemibold = function(v8)
    if not v8._enableNewFont then
        return Enum.Font.GothamMedium;
    else
        return Enum.Font.BuilderSansMedium;
    end;
end;
v1.default = v1.new(l_UIBlox_0.GetUIBloxEnableFontNameMapping());
return v1;
