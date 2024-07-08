local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_0.Alert);
local v6 = require(l_Parent_0.Enum.AlertType);
local l_FitFrameOnAxis_0 = require(l_Parent_2.FitFrame).FitFrameOnAxis;
local v8 = require(l_Parent_1.App.Loading.LoadingSpinner);
local v9 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_1.Core.Style.withStyle);
local v11 = v3.PureComponent:extend("LoadingAlert");
v11.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.UDim2), 
    screenSize = v4.Vector2, 
    onMounted = v4.optional(v4.callback), 
    titleIcon = v4.optional(v4.union(v4.table, v4.string)), 
    title = v4.string
});
v11.init = function(v12)
    v12.renderMiddleContent = function()
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1
        }, {
            Spinner = v3.createElement(v8, {
                size = UDim2.fromOffset(48, 48), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            })
        });
    end;
end;
v11.render = function(v13)
    return v10(function(v14)
        local l_Theme_0 = v14.Theme;
        return v3.createElement(v5, {
            anchorPoint = v13.props.anchorPoint, 
            alertType = v6.Loading, 
            margin = {
                top = 0, 
                bottom = 24, 
                left = 24, 
                right = 24
            }, 
            maxWidth = 400, 
            minWidth = 272, 
            middleContent = v13.renderMiddleContent, 
            onMounted = v13.props.onMounted, 
            position = v13.props.position, 
            screenSize = v13.props.screenSize, 
            title = v13.props.title, 
            titleContent = not not v13.props.titleIcon and function()
                return v3.createElement(l_FitFrameOnAxis_0, {
                    BackgroundTransparency = 1, 
                    contentPadding = UDim.new(0, 8), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    margin = {
                        top = 12, 
                        bottom = 0, 
                        left = 0, 
                        right = 0
                    }, 
                    minimumSize = UDim2.new(1, 0, 0, 0)
                }, {
                    Icon = v3.createElement(v9.Label, {
                        BackgroundTransparency = 1, 
                        Image = v13.props.titleIcon, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        Size = UDim2.new(0, 48, 0, 48)
                    })
                });
            end or nil
        });
    end);
end;
return v11;
