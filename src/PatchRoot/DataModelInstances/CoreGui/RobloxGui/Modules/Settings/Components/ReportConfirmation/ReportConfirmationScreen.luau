local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(script.Parent.ReportConfirmationContainer);
local v4 = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local v5 = v1.PureComponent:extend("ReportConfirmationScreen");
v5.validateProps = v2.interface({
    closeMenu = v2.callback, 
    player = v2.interface({
        DisplayName = v2.string, 
        Name = v2.string, 
        UserId = v2.number
    })
});
v5.render = function(v6)
    return v4({
        reportConfirmationContainer = v1.createElement(v3, v6.props)
    });
end;
return v5;
