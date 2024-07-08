local l_script_FirstAncestor_0 = script:FindFirstAncestor("UIBlox");
local v1 = require(l_script_FirstAncestor_0.Core.ImageSet.ImageSetComponent);
local v2 = require(l_script_FirstAncestor_0.App.ImageSet.Images);
local v3 = require(l_script_FirstAncestor_0.App.Button.Button);
local v4 = require(l_script_FirstAncestor_0.App.Button.Enum.ButtonType);
local v5 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v6 = require(l_script_FirstAncestor_0.Parent.React);
local v7 = UDim2.fromScale(0.4, 0.512);
local v8 = UDim2.fromScale(0.25, 0.33);
local v9 = {
    numItemsShown = 3.5, 
    itemAspectRatio = 1.7777777777777777, 
    itemPadding = 16, 
    borderRadius = UDim.new(0, 8)
};
return function(v10)
    local v11 = v5.Dictionary.join(v9, v10);
    local v12, v13 = v6.useState(Vector2.zero);
    local v16 = v6.useCallback(function(v14)
        local v15 = (v14.AbsoluteSize.X - v11.itemPadding * (v11.numItemsShown - 1)) / v11.numItemsShown;
        v13(Vector2.new(v15, v15 / v11.itemAspectRatio));
    end, {
        v11.itemAspectRatio, 
        v11.numItemsShown
    });
    local v18 = v6.useCallback(function(v17)
        if not v11.onVideoPlayActivated or not v11.items[v17].isVideo then
            if not v11.onPreviewActivated then
                return ;
            else
                return v11.onPreviewActivated(v17);
            end;
        else
            return v11.onVideoPlayActivated(v17);
        end;
    end, {
        v11.items, 
        v11.onVideoPlayActivated, 
        v11.onPreviewActivated
    });
    local v19 = {};
    for v20, v21 in v11.items, nil, nil do
        local l_isVideo_0 = v21.isVideo;
        v19["Item" .. v20] = v6.createElement("ImageButton", {
            LayoutOrder = v20, 
            Size = UDim2.fromOffset(v12.X, v12.Y), 
            Image = v21.imageId, 
            ScaleType = Enum.ScaleType.Crop, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v6.Event.Activated] = function()
                v18(v20);
            end
        }, {
            Corner = v6.createElement("UICorner", {
                CornerRadius = v11.borderRadius
            }), 
            PlayButton = if not l_isVideo_0 then nil else v6.createElement(v3, {
                buttonType = v4.PrimaryContextual, 
                size = v7, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                onActivated = function()
                    v18(v20);
                end
            }), 
            PlayIcon = if not l_isVideo_0 then nil else v6.createElement(v1.Label, {
                Size = v8, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = v2["icons/common/play"], 
                BackgroundTransparency = 1, 
                ZIndex = 2
            })
        });
    end;
    return v6.createElement("ScrollingFrame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        ScrollBarImageTransparency = 1, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ClipsDescendants = false, 
        [v6.Change.AbsoluteSize] = v16
    }, {
        Layout = v6.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v11.itemPadding)
        }), 
        Items = v6.createElement(v6.Fragment, {}, v19)
    });
end;
