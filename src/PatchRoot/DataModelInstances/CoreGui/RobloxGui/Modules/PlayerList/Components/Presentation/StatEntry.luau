local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.GameTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_WithLayoutValues_0 = require(l_Parent_0.Connection.LayoutValues).WithLayoutValues;
local v8 = require(l_Parent_0.Parent.FormatStatString);
local v9 = v2.PureComponent:extend("StatEntry");
v9.validateProps = v3.strictInterface({
    statName = v3.string, 
    statValue = v3.optional(v3.any), 
    isTitleEntry = v3.boolean, 
    isTeamEntry = v3.boolean, 
    layoutOrder = v3.integer, 
    backgroundStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number
    }), 
    overlayStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number
    }), 
    doubleOverlay = v3.boolean, 
    textStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number, 
        StrokeColor = v3.optional(v3.Color3), 
        StrokeTransparency = v3.optional(v3.number)
    }), 
    onActivated = v3.optional(v3.callback), 
    onSelectionGained = v3.optional(v3.callback), 
    onSelectionLost = v3.optional(v3.callback), 
    onMouseEnter = v3.optional(v3.callback), 
    onMouseLeave = v3.optional(v3.callback), 
    onMouseDown = v3.optional(v3.callback), 
    onInputEnded = v3.optional(v3.callback)
});
v9.render = function(v10)
    return l_WithLayoutValues_0(function(v11)
        return l_withStyle_0(function(v12)
            local v13 = v5:TranslateGameText(l_CoreGui_0, v10.props.statName);
            local v14 = nil;
            local v15 = nil;
            if v11.IsTenFoot then
                v15 = v11.StatTextSize;
                v14 = v11.StatFont;
                if not v10.props.isTitleEntry then
                    if v10.props.isTeamEntry then
                        v14 = v11.TeamStatFont;
                    end;
                else
                    v14 = v11.TitleStatFont;
                end;
            else
                v14 = v12.Font.CaptionHeader.Font;
                v15 = v12.Font.CaptionHeader.RelativeSize * v12.Font.BaseSize;
            end;
            local v16 = v8(v10.props.statValue);
            local v17 = {};
            if v11.IsTenFoot then
                v17.Shadow = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v11.ShadowImage, 
                    Position = UDim2.new(0, -v11.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v11.ShadowSize * 2, 1, v11.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v11.ShadowSliceRect
                });
            end;
            v17.StatText = v2.createElement("TextLabel", {
                Size = not not v10.props.isTitleEntry and UDim2.new(1, 0, 0.5, 0) or UDim2.new(1, 0, 1, 0), 
                Position = not not v10.props.isTitleEntry and UDim2.new(0, 0, 0.5, 0) or UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = v14, 
                TextSize = v15, 
                TextColor3 = v10.props.textStyle.Color, 
                TextTransparency = v10.props.textStyle.Transparency, 
                TextStrokeColor3 = v10.props.textStyle.StrokeColor, 
                TextStrokeTransparency = v10.props.textStyle.StrokeTransparency, 
                Text = v16, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Active = true
            }, {
                v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v11.StatTextPadding)
                }) or nil
            });
            if v10.props.isTitleEntry then
                v17.StatName = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0.5, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    Font = v11.StatNameFont, 
                    TextSize = v15, 
                    TextColor3 = v10.props.textStyle.Color, 
                    TextTransparency = v10.props.textStyle.Transparency, 
                    TextStrokeColor3 = v10.props.textStyle.StrokeColor, 
                    TextStrokeTransparency = v10.props.textStyle.StrokeTransparency, 
                    Text = v13, 
                    Active = true, 
                    ClipsDescendants = true
                });
            end;
            return v2.createElement("TextButton", {
                Text = "", 
                LayoutOrder = v10.props.layoutOrder, 
                Size = UDim2.new(0, v11.StatEntrySizeX, 1, 0), 
                BackgroundTransparency = v10.props.backgroundStyle.Transparency, 
                BackgroundColor3 = v10.props.backgroundStyle.Color, 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                AutoButtonColor = false, 
                Selectable = false, 
                [v2.Event.Activated] = v10.props.onActivated, 
                [v2.Event.SelectionGained] = v10.props.onSelectionGained, 
                [v2.Event.SelectionLost] = v10.props.onSelectionLost, 
                [v2.Event.MouseEnter] = v10.props.onMouseEnter, 
                [v2.Event.MouseLeave] = v10.props.onMouseLeave, 
                [v2.Event.MouseButton1Down] = v10.props.onMouseDown, 
                [v2.Event.MouseButton1Up] = v10.props.onInputEnded, 
                [v2.Event.InputEnded] = function(_, v19)
                    if v19.UserInputType == Enum.UserInputType.Touch then
                        if v10.props.onMouseLeave then
                            v10.props.onMouseLeave();
                        end;
                        if v10.props.onInputEnded then
                            v10.props.onInputEnded();
                        end;
                    end;
                end
            }, {
                DoubleOverLay = v2.createElement("Frame", {
                    ZIndex = 1, 
                    Visible = v10.props.doubleOverlay, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v10.props.overlayStyle.Transparency, 
                    BackgroundColor3 = v10.props.overlayStyle.Color, 
                    BorderSizePixel = 0
                }), 
                OverlayFrame = v2.createElement("Frame", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v10.props.overlayStyle.Transparency, 
                    BackgroundColor3 = v10.props.overlayStyle.Color, 
                    BorderSizePixel = 0
                }, v17)
            });
        end);
    end);
end;
return v9;
