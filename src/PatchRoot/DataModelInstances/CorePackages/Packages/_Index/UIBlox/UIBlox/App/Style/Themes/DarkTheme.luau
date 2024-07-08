local v0 = require(script.Parent.Parent.Colors);
return {
    BackgroundDefault = {
        Color = v0.Slate, 
        Transparency = 0
    }, 
    BackgroundContrast = {
        Color = v0.Carbon, 
        Transparency = 0
    }, 
    BackgroundMuted = {
        Color = v0.Obsidian, 
        Transparency = 0
    }, 
    BackgroundUIDefault = {
        Color = v0.Flint, 
        Transparency = 0
    }, 
    BackgroundUIContrast = {
        Color = v0.Black, 
        Transparency = 0.3
    }, 
    BackgroundOnHover = {
        Color = v0.White, 
        Transparency = 0.9
    }, 
    BackgroundOnPress = {
        Color = v0.Black, 
        Transparency = 0.7
    }, 
    UIDefault = {
        Color = v0.Graphite, 
        Transparency = 0
    }, 
    UIMuted = {
        Color = v0.Obsidian, 
        Transparency = 0.2
    }, 
    UIEmphasis = {
        Color = v0.White, 
        Transparency = 0.7
    }, 
    ContextualPrimaryDefault = {
        Color = v0.Green, 
        Transparency = 0
    }, 
    ContextualPrimaryOnHover = {
        Color = v0.Green, 
        Transparency = 0
    }, 
    ContextualPrimaryContent = {
        Color = v0.White, 
        Transparency = 0
    }, 
    SystemPrimaryDefault = {
        Color = v0.White, 
        Transparency = 0
    }, 
    SystemPrimaryOnHover = {
        Color = v0.White, 
        Transparency = 0
    }, 
    SystemPrimaryContent = {
        Color = v0.Flint, 
        Transparency = 0
    }, 
    SecondaryDefault = {
        Color = v0.White, 
        Transparency = 0.3
    }, 
    SecondaryOnHover = {
        Color = v0.White, 
        Transparency = 0
    }, 
    SecondaryContent = {
        Color = v0.White, 
        Transparency = 0.3
    }, 
    IconDefault = {
        Color = v0.White, 
        Transparency = 0.3
    }, 
    IconEmphasis = {
        Color = v0.White, 
        Transparency = 0
    }, 
    IconOnHover = {
        Color = v0.White, 
        Transparency = 0
    }, 
    TextEmphasis = {
        Color = v0.White, 
        Transparency = 0
    }, 
    TextDefault = {
        Color = v0.Pumice, 
        Transparency = 0
    }, 
    TextMuted = {
        Color = v0.White, 
        Transparency = 0.3
    }, 
    TextLink = {
        Color = v0.Blue, 
        Transparency = 0
    }, 
    Divider = {
        Color = v0.White, 
        Transparency = 0.8
    }, 
    Overlay = {
        Color = v0.Black, 
        Transparency = 0.5
    }, 
    DropShadow = {
        Color = v0.Black, 
        Transparency = 0.5
    }, 
    NavigationBar = {
        Color = v0.Carbon, 
        Transparency = 0
    }, 
    PlaceHolder = {
        Color = v0.Flint, 
        Transparency = 0.5
    }, 
    OnlineStatus = {
        Color = v0.Green, 
        Transparency = 0
    }, 
    OfflineStatus = {
        Color = v0.White, 
        Transparency = 0.3
    }, 
    Success = {
        Color = v0.Green, 
        Transparency = 0
    }, 
    Alert = {
        Color = v0.Red, 
        Transparency = 0
    }, 
    Badge = {
        Color = v0.White, 
        Transparency = 0
    }, 
    BadgeContent = {
        Color = v0.Flint, 
        Transparency = 0
    }, 
    SelectionCursor = {
        Color = v0.White, 
        Transparency = 0, 
        AnimatedColor = v0.White, 
        GradientRotationSpeed = 2, 
        GradientColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
            ColorSequenceKeypoint.new(1, Color3.new(0.336, 0.336, 0.336))
        }), 
        GradientTransparencySequence = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(1, 0)
        })
    }, 
    PlayerBackgroundDefault = {
        Color = v0.White, 
        Transparency = 0, 
        Image = "component_assets/avatarBG_dark"
    }, 
    ItemBackgroundDefault = {
        Color = v0.Black, 
        Transparency = 0, 
        Image = "component_assets/itemBG_dark"
    }
};
