local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local v3 = require(script.Parent.LocalizationConsumer);
return function(v4)
    assert(l_t_0.table(v4));
    return function(v5)
        assert(l_t_0.callback(v5));
        return l_Roact_0.createElement(v3, {
            render = v5, 
            stringsToBeLocalized = v4
        });
    end;
end;
