local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.UIBlox);
local l_Colors_0 = v3.App.Style.Colors;
local l_withStyle_0 = v3.Style.withStyle;
local l_Parent_0 = script.Parent;
local v7 = require(l_Parent_0.Parent.Constants);
local v8 = require(l_Parent_0.SelectionGradient);
local v9 = require(l_Parent_0.SelectionEffect);
local v10 = require(l_Parent_0.WheelText);
local v11 = v1.PureComponent:extend("WheelBackground");
v11.renderContent = function(v12, v13)
    local v14 = v7.Layouts[v12.props.layout];
    return v1.createElement("Folder", {}, {
        BackgroundCircleOverlay = if not v13 then v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = v14.CircleBackground, 
            ZIndex = 1
        }) else v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Colors_0.Flint:Lerp(Color3.new(0, 0, 0), v13), 
            BackgroundTransparency = v7.WheelBackgroundTransparency * v13
        }, {
            v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        BackgroundGradient = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 2
        }, {
            SelectionGradient = v1.createElement(v8)
        }), 
        BackgroundImage = v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = v14.SegmentedCircle, 
            ZIndex = 3
        }), 
        Selection = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 4
        }, {
            SelectionEffect = v1.createElement(v9)
        }), 
        BackgroundText = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 5
        }, {
            MiddleText = v1.createElement(v10)
        })
    });
end;
v11.render = function(v15)
    return l_withStyle_0(function(v16)
        return v15:renderContent(v16.Settings.PreferredTransparency);
    end);
end;
return v2.connect(function(v17)
    return {
        layout = v17.layout
    };
end, nil)(v11);
