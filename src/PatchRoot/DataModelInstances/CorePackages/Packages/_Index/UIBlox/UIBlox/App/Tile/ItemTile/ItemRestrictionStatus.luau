local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.Core.Text.GetTextSize);
local v7 = require(l_Parent_1.App.ImageSet.Images);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_0.Enum.ItemTileEnums);
local v10 = v3.PureComponent:extend("ItemRestrictionStatus");
local v11 = Vector2.new(50, 20);
local v12 = Vector2.new(8, 8);
v10.validateProps = v4.strictInterface({
    restrictionTypes = v4.map(v9.Restriction.isEnumValue, v4.boolean), 
    restrictionInfo = v4.optional(v4.table)
});
local function _(v13, v14)
    local v15 = "";
    if v13[v9.Restriction.LimitedUnique] then
        v15 = "#";
    end;
    if not v13[v9.Restriction.Collectible] then
        if not (not v14 or not v14.limitedSerialNumber) then
            v15 = v15 .. " " .. v14.limitedSerialNumber;
        end;
        return v15;
    else
        return "#";
    end;
end;
local function _(v17)
    if not v17[v9.Restriction.Collectible] then
        if not v17[v9.Restriction.Limited] and not v17[v9.Restriction.LimitedUnique] then
            return nil;
        else
            return v7["icons/status/item/limited"];
        end;
    else
        return v7["icons/status/item/limited"];
    end;
end;
v10.render = function(v19)
    return v5(function(v20)
        local l_Theme_0 = v20.Theme;
        local l_Font_0 = v20.Font;
        local l_restrictionInfo_0 = v19.props.restrictionInfo;
        local l_restrictionTypes_0 = v19.props.restrictionTypes;
        local v25 = "";
        if l_restrictionTypes_0[v9.Restriction.LimitedUnique] then
            v25 = "#";
        end;
        local v26;
        if not l_restrictionTypes_0[v9.Restriction.Collectible] then
            if not (not l_restrictionInfo_0 or not l_restrictionInfo_0.limitedSerialNumber) then
                v25 = v25 .. " " .. l_restrictionInfo_0.limitedSerialNumber;
            end;
            v26 = v25;
        else
            v26 = "#";
        end;
        v25 = l_Font_0.CaptionHeader.Font;
        local v27 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
        local v28 = v6(v26, v27, v25, v11);
        local v29 = if not l_restrictionTypes_0[v9.Restriction.Collectible] then if l_restrictionTypes_0[v9.Restriction.Limited] or l_restrictionTypes_0[v9.Restriction.LimitedUnique] then v7["icons/status/item/limited"] else nil else v7["icons/status/item/limited"];
        local v30 = not not v29 and v29.ImageRectSize / v7.ImagesResolutionScale or Vector2.new(0, 0);
        return v3.createElement(v8.Label, {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Image = v7["component_assets/circle_17"], 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Position = UDim2.new(0, 12, 1, -12), 
            Size = UDim2.new(0, (v30.X + v28.X) + v12.X, 0, math.max(v30.Y, v28.Y) + v12.Y)
        }, {
            Icon = v29 and v3.createElement(v8.Label, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v29, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                Position = UDim2.new(0, v12.X / 2, 0.5, 0), 
                Size = UDim2.new(0, v30.X, 0, v30.Y)
            }), 
            Text = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v25, 
                TextSize = v27, 
                Text = v26, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.TextTransparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Position = UDim2.new(0, v30.X, 0, 0), 
                Size = UDim2.new(0, v28.X + 10, 1, 0)
            })
        });
    end);
end;
return v10;
