local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.App.Style.AppStyleProvider);
return function(v3)
    return v1.createElement(v2, {
        style = {
            themeName = "Dark", 
            fontName = "Gotham"
        }
    }, {
        Content = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0)
        }, v3)
    });
end;
