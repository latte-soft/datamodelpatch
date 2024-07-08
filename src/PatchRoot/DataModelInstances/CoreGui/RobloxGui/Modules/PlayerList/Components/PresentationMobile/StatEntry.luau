local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_WithLayoutValues_0 = require(l_Parent_0.Connection.LayoutValues).WithLayoutValues;
local v6 = require(l_Parent_0.Parent.FormatStatString);
local v7 = v1.PureComponent:extend("StatEntry");
v7.validateProps = v2.strictInterface({
    statValue = v2.optional(v2.any), 
    isTitleEntry = v2.boolean, 
    isTeamEntry = v2.boolean, 
    layoutOrder = v2.integer, 
    textStyle = v2.strictInterface({
        Color = v2.Color3, 
        Transparency = v2.number, 
        StrokeColor = v2.optional(v2.Color3), 
        StrokeTransparency = v2.optional(v2.number)
    })
});
v7.render = function(v8)
    return l_WithLayoutValues_0(function(v9)
        return l_withStyle_0(function(v10)
            local v11 = nil;
            local v12 = nil;
            if v9.IsTenFoot then
                v12 = v9.StatTextSizeMobile;
                v11 = v9.StatFont;
                if not v8.props.isTitleEntry then
                    if v8.props.isTeamEntry then
                        v11 = v9.TeamStatFont;
                    end;
                else
                    v11 = v9.TitleStatFont;
                end;
            else
                v11 = v10.Font.CaptionHeader.Font;
                v12 = v10.Font.CaptionHeader.RelativeSize * v10.Font.BaseSize;
            end;
            return v1.createElement("TextLabel", {
                Size = UDim2.new(0, v9.StatEntrySizeX, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = v11, 
                LayoutOrder = v8.props.layoutOrder, 
                TextSize = v12, 
                TextColor3 = v8.props.textStyle.Color, 
                TextTransparency = v8.props.textStyle.Transparency, 
                TextStrokeColor3 = v8.props.textStyle.StrokeColor, 
                TextStrokeTransparency = v8.props.textStyle.StrokeTransparency, 
                Text = v6(v8.props.statValue), 
                TextTruncate = Enum.TextTruncate.AtEnd
            });
        end);
    end);
end;
return v7;
