local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_Mock_0 = v0.Mock;
local l_LocalizationProvider_0 = v0.LocalizationProvider;
local l_Roact_0 = v0.Roact;
local v4 = l_Mock_0.MagicMock.new({
    name = "Localization"
});
v4.Format = function(_, v6, _)
    return v6;
end;
return function(v8)
    return l_Roact_0.createElement(l_LocalizationProvider_0, {
        localization = v4
    }, {
        TestElement1 = v8
    });
end;
