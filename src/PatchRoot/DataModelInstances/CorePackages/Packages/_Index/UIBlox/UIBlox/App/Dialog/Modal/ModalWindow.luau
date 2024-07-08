local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local l_FitFrameVertical_0 = require(l_Parent_2.FitFrame).FitFrameVertical;
local v6 = require(l_Parent_0.ImageSet.Images);
local v7 = require(l_Parent_1.Core.Style.withStyle);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = Rect.new(8, 8, 9, 9);
local v10 = v3.PureComponent:extend("ModalWindow");
v10.validateProps = v4.strictInterface({
    isFullHeight = v4.boolean, 
    screenSize = v4.Vector2, 
    [v3.Children] = v4.table, 
    position = v4.optional(v4.UDim2), 
    anchorPoint = v4.optional(v4.Vector2), 
    distanceFromTop = v4.optional(v4.number)
});
v10.defaultProps = {
    distanceFromTop = 0
};
v10.init = function(v11)
    local v12, v13 = v3.createBinding(Vector2.new(0, 0));
    v11.contentSize = v12;
    v11.changeContentSize = v13;
end;
v10.getWidth = function(v14, v15)
    return not not v14:isFullWidth(v15) and v15 or 540;
end;
v10.isFullWidth = function(_, v17)
    return v17 < 540;
end;
v10.render = function(v18)
    return v7(function(v19)
        local l_Theme_0 = v19.Theme;
        local l_screenSize_0 = v18.props.screenSize;
        local v22 = nil;
        local v23 = nil;
        local v24 = nil;
        local v25 = nil;
        v25 = UDim.new(0, v18:getWidth(l_screenSize_0.X));
        if not v18:isFullWidth(l_screenSize_0.X) then
            v22 = Vector2.new(0.5, 0.5);
            v23 = "component_assets/circle_17";
            v24 = v18.props.position or UDim2.new(0.5, 0, 0.5, 0);
        else
            v22 = Vector2.new(0.5, 1);
            v23 = "component_assets/bullet_17";
            v24 = v18.props.position or UDim2.new(0.5, 0, 1, 0);
        end;
        v22 = v18.props.anchorPoint or v22;
        if not v18.props.isFullHeight then
            return v3.createElement(v8.Button, {
                Position = v24, 
                Size = v18.contentSize:map(function(v26)
                    return UDim2.new(0, v26.X, 0, v26.Y);
                end), 
                AnchorPoint = v22, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v6[v23], 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v9, 
                AutoButtonColor = false, 
                ClipsDescendants = true, 
                Selectable = false
            }, {
                BackgroundImage = v3.createElement(l_FitFrameVertical_0, {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    width = v25, 
                    [v3.Change.AbsoluteSize] = function(v27)
                        v18.changeContentSize(v27.AbsoluteSize);
                    end
                }, v18.props[v3.Children])
            });
        else
            local v28 = nil;
            if v18.props.distanceFromTop > 0 then
                v28 = UDim.new(1, -v18.props.distanceFromTop);
            else
                v28 = UDim.new(1, 0);
                if l_screenSize_0.X >= 540 and l_screenSize_0.Y >= 700 then
                    v28 = UDim.new(0.8, 0);
                end;
            end;
            return v3.createElement(v8.Button, {
                Position = v24, 
                Size = UDim2.new(v25, v28), 
                AnchorPoint = v22, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v6[v23], 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v9, 
                AutoButtonColor = false, 
                ClipsDescendants = true, 
                Selectable = false
            }, {
                BackgroundImage = v3.createElement(v8.Label, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, v18.props[v3.Children])
            });
        end;
    end);
end;
return v10;
