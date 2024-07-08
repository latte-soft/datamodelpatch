local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v5 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v6 = UDim2.new(1, -360, 1, -72);
local function _(v7)
    return function(v8)
        return v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = v6, 
            Image = "rbxasset://textures/ui/LuaChat/9-slice/modal.png", 
            ImageColor3 = l_useStyle_0().Theme.BackgroundUIDefault.Color, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(5, 5), Vector2.new(6, 6))
        }, {
            padding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 2.5), 
                PaddingLeft = UDim.new(0, 2.5), 
                PaddingRight = UDim.new(0, 2.5), 
                PaddingTop = UDim.new(0, 2.5)
            }), 
            layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            topBar = v5(v8.navigation), 
            overlayContent = v2.createElement(v7, v8)
        });
    end;
end;
return function(v10)
    local v11 = v3.createRobloxStackNavigator(v10);
    local v12 = v2.PureComponent:extend("OverlayNavigatorConnector");
    v12.router = v11.router;
    local function v14(v13)
        return v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = v6, 
            Image = "rbxasset://textures/ui/LuaChat/9-slice/modal.png", 
            ImageColor3 = l_useStyle_0().Theme.BackgroundUIDefault.Color, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(5, 5), Vector2.new(6, 6))
        }, {
            padding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 2.5), 
                PaddingLeft = UDim.new(0, 2.5), 
                PaddingRight = UDim.new(0, 2.5), 
                PaddingTop = UDim.new(0, 2.5)
            }), 
            layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            topBar = v5(v13.navigation), 
            overlayContent = v2.createElement(v11, v13)
        });
    end;
    v12.render = function(v15)
        return v2.createElement(v14, v15.props);
    end;
    return v12;
end;
