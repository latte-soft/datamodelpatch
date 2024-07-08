local v0 = require(script.Parent.Parent.Colors);
return {
    BackgroundDefault = {
        Color = v0.Alabaster, 
        Transparency = 0
    }, 
    BackgroundContrast = {
        Color = v0.Ash, 
        Transparency = 0
    }, 
    BackgroundMuted = {
        Color = v0.Chalk, 
        Transparency = 0
    }, 
    BackgroundUIDefault = {
        Color = v0.White, 
        Transparency = 0
    }, 
    BackgroundUIContrast = {
        Color = v0.White, 
        Transparency = 0.1
    }, 
    BackgroundOnHover = {
        Color = v0.Black, 
        Transparency = 0.9
    }, 
    BackgroundOnPress = {
        Color = v0.Black, 
        Transparency = 0.9
    }, 
    UIDefault = {
        Color = v0.Pumice, 
        Transparency = 0
    }, 
    UIMuted = {
        Color = v0.Black, 
        Transparency = 0.9
    }, 
    UIEmphasis = {
        Color = v0.Black, 
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
        Color = v0.Flint, 
        Transparency = 0
    }, 
    SystemPrimaryOnHover = {
        Color = v0.Flint, 
        Transparency = 0
    }, 
    SystemPrimaryContent = {
        Color = v0.White, 
        Transparency = 0
    }, 
    SecondaryDefault = {
        Color = v0.Black, 
        Transparency = 0.5
    }, 
    SecondaryOnHover = {
        Color = v0.Flint, 
        Transparency = 0
    }, 
    SecondaryContent = {
        Color = v0.Black, 
        Transparency = 0.5
    }, 
    IconDefault = {
        Color = v0.Black, 
        Transparency = 0.4
    }, 
    IconEmphasis = {
        Color = v0.Flint, 
        Transparency = 0
    }, 
    IconOnHover = {
        Color = v0.Flint, 
        Transparency = 0
    }, 
    TextEmphasis = {
        Color = v0.Flint, 
        Transparency = 0
    }, 
    TextDefault = {
        Color = v0.Smoke, 
        Transparency = 0
    }, 
    TextMuted = {
        Color = v0.Black, 
        Transparency = 0.4
    }, 
    TextLink = {
        Color = v0.Blue, 
        Transparency = 0
    }, 
    Divider = {
        Color = v0.Pumice, 
        Transparency = 0
    }, 
    Overlay = {
        Color = v0.Black, 
        Transparency = 0.7
    }, 
    DropShadow = {
        Color = v0.Black, 
        Transparency = 0.7
    }, 
    NavigationBar = {
        Color = v0.White, 
        Transparency = 0
    }, 
    PlaceHolder = {
        Color = v0.Black, 
        Transparency = 0.9
    }, 
    OnlineStatus = {
        Color = v0.Green, 
        Transparency = 0
    }, 
    OfflineStatus = {
        Color = v0.Black, 
        Transparency = 0.5
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
        Color = v0.Flint, 
        Transparency = 0
    }, 
    BadgeContent = {
        Color = v0.White, 
        Transparency = 0
    }, 
    SelectionCursor = {
        Color = v0.XboxBlue, 
        Transparency = 0, 
        AnimatedColor = v0.White, 
        GradientRotationSpeed = 2, 
        GradientColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(0.514, 0.82, 0.992)), 
            ColorSequenceKeypoint.new(1, Color3.new(0.086, 0.678, 0.847))
        }), 
        GradientTransparencySequence = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(1, 0)
        })
    }, 
    PlayerBackgroundDefault = {
        Color = v0.White, 
        Transparency = 0, 
        Image = "component_assets/avatarBG_light"
    }, 
    ItemBackgroundDefault = {
        Color = v0.White, 
        Transparency = 0, 
        Image = "component_assets/itemBG_light"
    }
};
