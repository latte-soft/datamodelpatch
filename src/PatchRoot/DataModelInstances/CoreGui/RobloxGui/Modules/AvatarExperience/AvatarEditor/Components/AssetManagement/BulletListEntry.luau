local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.AvatarExperienceDeps);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_RoactFitComponents_0 = v5.RoactFitComponents;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_withStyle_0 = v4.Style.withStyle;
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local v12 = v2.PureComponent:extend("BulletListEntry");
v12.validateProps = v3.strictInterface({
    text = v3.string, 
    layoutOrder = v3.integer, 
    positionChangedCallback = v3.optional(v3.callback), 
    NextSelectionLeft = v3.optional(v3.table), 
    NextSelectionRight = v3.optional(v3.table), 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    forwardRef = v3.optional(v3.table)
});
v12.renderWithProviders = function(v13, v14, v15)
    local l_Font_0 = v14.Font;
    local l_Theme_0 = v14.Theme;
    local l_Font_1 = l_Font_0.CaptionBody.Font;
    local v19 = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize;
    local v20 = l_Text_0.GetTextWidth("\226\128\162 ", l_Font_1, v19);
    return v2.createElement(l_RoactFitComponents_0.FitFrameVertical, {
        width = UDim.new(1, 0), 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.props.layoutOrder, 
        [v2.Change.AbsolutePosition] = v13.props.positionChangedCallback, 
        SelectionImageObject = v15(l_CursorKind_0.RoundedRect), 
        NextSelectionLeft = v13.props.NextSelectionLeft, 
        NextSelectionRight = v13.props.NextSelectionRight, 
        NextSelectionUp = v13.props.NextSelectionUp, 
        NextSelectionDown = v13.props.NextSelectionDown, 
        [v2.Ref] = v13.props.forwardRef
    }, {
        Bullet = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v20, v19), 
            Text = "\226\128\162 ", 
            Font = l_Font_1, 
            TextSize = v19, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1
        }), 
        Text = v2.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, -v20), 
            BackgroundTransparency = 1, 
            Text = v13.props.text, 
            Font = l_Font_1, 
            TextSize = v19, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2
        })
    });
end;
v12.render = function(v21)
    return l_withStyle_0(function(v22)
        return l_withSelectionCursorProvider_0(function(v23)
            return v21:renderWithProviders(v22, v23);
        end);
    end);
end;
return v2.forwardRef(function(v24, v25)
    return v2.createElement(v12, v1.Dictionary.join(v24, {
        forwardRef = v25
    }));
end);
