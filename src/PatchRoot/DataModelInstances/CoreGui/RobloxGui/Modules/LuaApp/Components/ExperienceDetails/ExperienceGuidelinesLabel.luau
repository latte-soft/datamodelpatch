local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_TextButton_0 = v5.App.Button.TextButton;
local v8 = require(l_Modules_0.LuaApp.Thunks.OpenExperienceGuidelinesExplained);
local v9 = v2.PureComponent:extend("ExperienceGuidelinesLabel");
v9.validateProps = v4.strictInterface({
    universeId = v4.string, 
    guidelinesText = v4.string, 
    openExperienceGuidelinesExplained = v4.optional(v4.callback), 
    layoutOrder = v4.optional(v4.integer)
});
v9.init = function(v10)
    v10.onActivated = function()
        v10.props.openExperienceGuidelinesExplained(v10.props.universeId);
    end;
end;
v9.render = function(v11)
    return l_withStyle_0(function(_)
        return v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = v11.props.layoutOrder or 0
        }, {
            ExperienceGuidelinesFrame = v2.createElement("Frame", {
                Position = UDim2.new(0, -8, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, {
                AgeGuidelinesLabel = v2.createElement(l_TextButton_0, {
                    text = v11.props.guidelinesText, 
                    colorStyleDefault = "TextDefault", 
                    hoverBackgroundEnabled = false, 
                    richText = false, 
                    onActivated = v11.onActivated
                })
            })
        });
    end);
end;
return (v3.connect(function(_, _)
    return nil;
end, function(v15)
    return {
        openExperienceGuidelinesExplained = function(v16)
            v15(v8(v16));
        end
    };
end)(v9));
