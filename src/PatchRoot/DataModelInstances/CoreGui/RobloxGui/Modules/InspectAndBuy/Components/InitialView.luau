local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Parent_0.Components.PlayerNameLabel);
local v5 = require(l_Parent_0.Components.AvatarHeadShot);
local v6 = require(l_Parent_0.Components.AssetList);
local v7 = require(l_Parent_0.Components.InspectAndBuyContext);
local v8 = v2.PureComponent:extend("InitialView");
v8.render = function(v9)
    local l_view_0 = v9.props.view;
    local l_detailsInformation_0 = v9.props.detailsInformation;
    return v2.createElement(v7.Consumer, {
        render = function(v12)
            local v13 = v12[l_view_0];
            return v2.createElement("ScrollingFrame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, v13.BorderPaddingSize, 0, 10), 
                Size = UDim2.new(1, -(2 * v13.BorderPaddingSize), 1, -36), 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Visible = not l_detailsInformation_0.viewingDetails, 
                Selectable = false
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 15), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Top = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v13.TopSizeY), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        Padding = UDim.new(0, 10), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal
                    }), 
                    AvatarHeadShot = v2.createElement(v5), 
                    PlayerNameLabel = v2.createElement(v4)
                }), 
                AssetList = v2.createElement(v6)
            });
        end
    });
end;
return v3.UNSTABLE_connect2(function(v14, _)
    return {
        view = v14.view, 
        detailsInformation = v14.detailsInformation
    };
end)(v8);
