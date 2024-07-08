local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.UIBloxConfig);
local v3 = require(l_Parent_1.Cryo);
local v4 = {
    Color = Color3.fromRGB(0, 0, 0), 
    Transparency = 0
};
local v5 = {
    Color = Color3.new(0.086, 0.678, 0.847), 
    Transparency = 0, 
    AnimatedColor = Color3.new(1, 1, 1), 
    GradientRotationSpeed = 2, 
    GradientColorSequence = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.514, 0.82, 0.992)), 
        ColorSequenceKeypoint.new(1, Color3.new(0.086, 0.678, 0.847))
    }), 
    GradientTransparencySequence = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(1, 0)
    })
};
local v6 = {
    Color = Color3.fromRGB(0, 0, 0), 
    Transparency = 0, 
    Image = ""
};
local v7 = {
    BackgroundDefault = v4, 
    BackgroundContrast = v4, 
    BackgroundMuted = v4, 
    BackgroundUIDefault = v4, 
    BackgroundUIContrast = v4, 
    BackgroundOnHover = v4, 
    BackgroundOnPress = v4, 
    UIDefault = v4, 
    UIMuted = v4, 
    UIEmphasis = v4, 
    ContextualPrimaryDefault = v4, 
    ContextualPrimaryOnHover = v4, 
    ContextualPrimaryContent = v4, 
    SystemPrimaryDefault = v4, 
    SystemPrimaryOnHover = v4, 
    SystemPrimaryContent = v4, 
    SecondaryDefault = v4, 
    SecondaryOnHover = v4, 
    SecondaryContent = v4, 
    IconDefault = v4, 
    IconEmphasis = v4, 
    IconOnHover = v4, 
    TextEmphasis = v4, 
    TextDefault = v4, 
    TextMuted = v4, 
    TextLink = v4, 
    Divider = v4, 
    Overlay = v4, 
    DropShadow = v4, 
    NavigationBar = v4, 
    PlaceHolder = v4, 
    OnlineStatus = v4, 
    OfflineStatus = v4, 
    Success = v4, 
    Alert = v4, 
    Badge = v4, 
    BadgeContent = v4, 
    SelectionCursor = v5, 
    PlayerBackgroundDefault = v6, 
    ItemBackgroundDefault = v6
};
if v2.useNewThemeColorPalettes then
    v7 = v3.Dictionary.join(v7, {
        CellOnHover = v4, 
        TextOnHover = v4, 
        Loading = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
            }), 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1), 
                NumberSequenceKeypoint.new(1, 0)
            }), 
            Rotation = 0
        }, 
        Caution = v4
    });
    v7.SelectionCursor.Rotation = 0;
end;
local v8 = {
    Font = Enum.Font.GothamMedium, 
    RelativeSize = 1, 
    RelativeMinSize = 1
};
return {
    Theme = v7, 
    Font = {
        BaseSize = 10, 
        Title = v8, 
        Header1 = v8, 
        Header2 = v8, 
        SubHeader1 = v8, 
        Body = v8, 
        CaptionHeader = v8, 
        CaptionSubHeader = v8, 
        CaptionBody = v8, 
        Footer = v8, 
        HeadingLarge = v8, 
        HeadingSmall = v8, 
        TitleLarge = v8, 
        BodyLarge = v8, 
        CaptionLarge = v8, 
        BodySmall = v8, 
        CaptionSmall = v8
    }, 
    Settings = {
        PreferredTransparency = 0.56, 
        ReducedMotion = true
    }
};
