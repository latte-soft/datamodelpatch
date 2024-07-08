local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.ScreenshotFlowStepHandler);
local v2 = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local v3 = v0.PureComponent:extend("ScreenshotFlowStepHandlerContainer");
v3.render = function(v4)
    return v2({
        ScreenshotFlowStepHandlerContainer = v0.createElement(v1, v4.props)
    });
end;
return v3;
