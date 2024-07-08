local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.Validator.validateFont);
local v3 = require(script.Parent.FontLoader);
local _ = require(l_Parent_0.StyleTypes);
return function(v5, v6, v7)
    local v8 = {
        [v1.FontName.Gotham:lower()] = v3.new(v6, v7):loadFont()
    };
    local v9 = nil;
    if v5 ~= nil and #v5 > 0 then
        v9 = v8[v5:lower()];
    end;
    if v9 == nil then
        v9 = v8[v1.DefaultFontName:lower()];
    end;
    assert(v2(v9));
    return v9;
end;
