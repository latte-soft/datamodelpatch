local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagDeprecatedSocialLibrariesCells);
local l_Roact_0 = v1.Roact;
local v4 = require(script.Parent.PresenceBubbleCell);
local v5 = require(script:FindFirstAncestor("Components").Style.TestStyle);
local v6 = l_Roact_0.PureComponent:extend("StyledCell");
v6.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    avatarCirclePresenceImage = nil, 
    subTitleText = nil, 
    titleText = "TestUser", 
    secondaryTitleText = nil, 
    thumbnails = {}, 
    childWidth = 0, 
    onActivated = nil, 
    onCircleActivated = nil, 
    style = v5, 
    showDivider = true, 
    boldTitle = true, 
    isLoading = false
};
v6.init = function(_)
    assert(not v2(), "social-libraries Cells are deprecated, please use Cell components from app-chat rotriever package");
end;
v6.render = function(v8)
    local l_style_0 = v8.props.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    local v12 = type(v8.props.avatarCirclePresenceImage) == "table";
    return l_Roact_0.createElement(v4, {
        childWidth = v8.props.childWidth, 
        titleText = v8.props.titleText, 
        secondaryTitleText = v8.props.secondaryTitleText, 
        subTitleText = v8.props.subTitleText, 
        avatarCirclePresenceImage = v8.props.avatarCirclePresenceImage, 
        thumbnails = v8.props.thumbnails, 
        onActivated = v8.props.onActivated, 
        onCircleActivated = v8.props.onCircleActivated, 
        Size = v8.props.Size, 
        isLoading = v8.props.isLoading, 
        showNewPresenceImage = v12, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        avatarCircleBackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCircleDividerColor3 = l_Theme_0.PlaceHolder.Color, 
        avatarCirclePresenceImageColor3 = if not v12 then nil else l_Theme_0.OnlineStatus.Color, 
        avatarCirclePresenceImageTransparency = if not v12 then nil else l_Theme_0.OnlineStatus.Transparency, 
        subTitleTextFont = l_Font_0.CaptionBody.Font, 
        subTitleTextTransparency = l_Theme_0.TextDefault.Transparency, 
        subTitleTextColor3 = l_Theme_0.TextDefault.Color, 
        subTitleTextSize = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize, 
        titleFont = l_Font_0.Header2.Font, 
        titleTextTransparency = not not v8.props.boldTitle and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextDefault.Transparency, 
        titleTextColor3 = not not v8.props.boldTitle and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextDefault.Color, 
        titleTextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
        secondaryTitleFont = l_Font_0.Header2.Font, 
        secondaryTitleTextTransparency = l_Theme_0.TextMuted.Transparency, 
        secondaryTitleTextColor3 = l_Theme_0.TextMuted.Color, 
        secondaryTitleTextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
        showDivider = v8.props.showDivider, 
        dividerTransparency = l_Theme_0.Divider.Transparency, 
        dividerColor3 = l_Theme_0.Divider.Color
    }, v8.props[l_Roact_0.Children]);
end;
return v6;
