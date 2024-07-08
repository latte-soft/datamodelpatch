local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_ImageSetLabel_0 = require(l_Parent_0.DiscoveryUiBloxApi).ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v5 = require(l_script_FirstAncestor_0.Footer.FriendIcon);
local l_SourceSans_0 = Enum.Font.SourceSans;
local v7 = Color3.fromRGB(117, 117, 117);
local function v10(v8)
    local l_size_0 = v8.size;
    return v2.createElement(l_ImageSetLabel_0, {
        Size = UDim2.new(0, l_size_0, 0, l_size_0), 
        LayoutOrder = v8.layoutOrder, 
        Image = l_GetImageData_0("LuaApp/graphic/gr-counter-slot-32x32") or "LuaApp/graphic/gr-counter-slot-32x32", 
        BackgroundTransparency = 1
    }, {
        Count = v2.createElement("TextLabel", {
            Size = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Font = l_SourceSans_0, 
            TextSize = 15, 
            Text = "+" .. v8.count, 
            TextColor3 = v7, 
            BackgroundTransparency = 1
        })
    });
end;
local v11 = v2.PureComponent:extend("UserIconList");
v11.defaultProps = {
    users = {}
};
v11.render = function(v12)
    local l_width_0 = v12.props.width;
    local l_height_0 = v12.props.height;
    local l_layoutOrder_0 = v12.props.layoutOrder;
    local l_users_0 = v12.props.users;
    local v17 = #l_users_0;
    local v18 = 0;
    local l_maskColor_0 = v12.props.maskColor;
    if v17 <= 0 then
        return nil;
    else
        local function _(v20, v21)
            return (math.floor((v21 + 3) / (v20 + 3)));
        end;
        local v23 = nil;
        v23 = (l_height_0 >= 32 and math.floor((l_width_0 + 3) / 35) >= 3) and 32 or (l_height_0 >= 24 and 24 or l_height_0);
        local v24 = {};
        local v25 = math.floor((l_width_0 + 3) / (v23 + 3));
        if v25 > 0 then
            if v25 < v17 then
                v18 = v17 - (v25 - 1);
            end;
            v24.ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 3)
            });
            local v26 = v18 > 0 and v25 - 1 or math.min(v25, v17);
            for v27 = 1, v26 do
                v24["UserIcon" .. v27] = v2.createElement(v5, {
                    user = l_users_0[v27], 
                    itemSize = v23, 
                    layoutOrder = v27, 
                    maskColor = l_maskColor_0
                });
            end;
            local v28 = false;
            if v18 > 0 then
                v28 = v2.createElement(v10, {
                    size = v23, 
                    layoutOrder = v25, 
                    count = v18
                });
            end;
            v24.NumberedIcon = v28;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_width_0, 0, l_height_0), 
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1
        }, v24);
    end;
end;
return v11;
