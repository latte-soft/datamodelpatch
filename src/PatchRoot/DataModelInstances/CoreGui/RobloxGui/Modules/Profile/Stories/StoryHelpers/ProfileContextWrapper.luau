local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = v1.Roact;
local l_Dash_0 = v1.Dash;
local v5 = require(l_Parent_0.ProfileContext);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v7 = require(l_Parent_0.TestHelpers.mockContext);
return function(v8, v9, v10)
    return l_Roact_0.createElement(v5.Provider, {
        value = l_Dash_0.join(v7({
            abbreviateCount = function(v11)
                return l_NumberLocalization_0.abbreviate(v11, "en-us", nil);
            end
        }), v10)
    }, {
        l_Roact_0.createElement(v8, v9)
    });
end;
