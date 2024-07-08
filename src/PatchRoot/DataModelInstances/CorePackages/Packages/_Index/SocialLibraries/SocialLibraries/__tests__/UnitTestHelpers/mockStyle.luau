local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_UIBlox_0 = v0.UIBlox;
local l_Roact_0 = v0.Roact;
return function(v3)
    return l_Roact_0.createElement(l_UIBlox_0.App.Style.AppStyleProvider, {
        style = {
            themeName = "Dark", 
            fontName = "Gotham"
        }
    }, {
        TestElement = v3
    });
end;
