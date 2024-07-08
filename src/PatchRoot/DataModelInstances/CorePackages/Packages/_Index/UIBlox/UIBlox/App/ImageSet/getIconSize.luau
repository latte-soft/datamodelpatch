local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Parent.Parent.App.Style.StyleTypes);
local v2 = require(l_Parent_0.Enum.IconSize);
local v3 = {
    [v2.Small] = 16, 
    [v2.Medium] = 36, 
    [v2.Large] = 48, 
    [v2.XLarge] = 96, 
    [v2.XXLarge] = 192
};
return function(v4, v5)
    assert(v2.isEnumValue(v4));
    if v5 ~= nil and v5.Tokens ~= nil then
        if v4 == v2.Small then
            return v5.Tokens.Semantic.Icon.Size.Small;
        elseif v4 == v2.Medium then
            return v5.Tokens.Semantic.Icon.Size.Medium;
        elseif v4 == v2.Large then
            return v5.Tokens.Semantic.Icon.Size.Large;
        elseif v4 == v2.XLarge then
            return v5.Tokens.Semantic.Icon.Size.XLarge;
        elseif v4 == v2.XXLarge then
            return v5.Tokens.Semantic.Icon.Size.XXLarge;
        else
            return nil;
        end;
    else
        return v3[v4];
    end;
end;
