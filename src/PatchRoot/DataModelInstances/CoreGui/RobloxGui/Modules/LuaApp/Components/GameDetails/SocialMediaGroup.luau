local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local v3 = require(l_Modules_0.LuaApp.Components.GameDetails.SocialMediaButton);
local v4 = v1.PureComponent:extend("SocialMediaGroup");
v4.render = function(v5)
    local l_LayoutOrder_0 = v5.props.LayoutOrder;
    local l_socialLinks_0 = v5.props.socialLinks;
    if not l_socialLinks_0 or #l_socialLinks_0 == 0 then
        return nil;
    else
        local v8 = {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            })
        };
        for v9, v10 in ipairs(v5.props.socialLinks) do
            v8["SocialButton_" .. v10.type] = v1.createElement(v3, {
                Size = UDim2.new(0, 44, 0, 44), 
                LayoutOrder = v9, 
                socialType = v10.type, 
                socialUrl = v10.url
            });
        end;
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 44), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, v8);
    end;
end;
return v2.connect(function(v11, v12)
    local v13 = v11.GameSocialLinks[v12.universeId];
    return {
        socialLinks = v13 and v13.externalLinks
    };
end)(v4);
