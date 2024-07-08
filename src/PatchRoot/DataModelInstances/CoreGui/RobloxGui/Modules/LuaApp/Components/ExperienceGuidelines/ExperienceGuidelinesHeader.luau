local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = v2.PureComponent:extend("ExperienceGuidelinesHeader");
v7.validateProps = v6.strictInterface({
    ageSummary = v6.string
});
v7.init = function(_)
end;
v7.render = function(v9)
    local l_ageSummary_0 = v9.props.ageSummary;
    return l_withStyle_0(function(v11)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5)
        }, {
            AgeDescription = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v11.Font.SubHeader1, 
                colorStyle = v11.Theme.TextDefault, 
                size = UDim2.new(1, 0, 0, 0), 
                fluidSizing = false, 
                textXAlignment = Enum.TextXAlignment.Right, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.XY, 
                text = l_ageSummary_0
            })
        });
    end);
end;
return v7;
