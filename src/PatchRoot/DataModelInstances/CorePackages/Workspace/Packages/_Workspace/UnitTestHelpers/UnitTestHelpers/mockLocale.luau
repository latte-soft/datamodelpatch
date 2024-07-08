local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
return function(v4)
    return v1.createElement(l_LocalizationProvider_0, {
        localization = {
            Format = function(_, v6, _)
                return v6;
            end, 
            changed = l_Signal_0.new()
        }
    }, {
        TestElement1 = v4
    });
end;
