local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(script.Parent.LocalizationConsumer);
return function(v4)
    v2.isType(v4, "table", "stringsToBeLocalized passed to withLocalization()");
    return function(v5)
        v2.isType(v5, "function", "render passed to withLocalization()");
        return v1.createElement(v3, {
            render = v5, 
            stringsToBeLocalized = v4
        });
    end;
end;
