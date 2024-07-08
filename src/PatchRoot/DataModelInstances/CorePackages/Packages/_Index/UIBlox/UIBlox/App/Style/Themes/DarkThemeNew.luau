local v0 = require(script.Parent.Parent.Parent.Parent.Common.Style.ColorSystem);
return {
    BackgroundDefault = {
        Color = v0.Gray[130], 
        Transparency = 0
    }, 
    BackgroundContrast = {
        Color = v0.Gray[110], 
        Transparency = 0
    }, 
    BackgroundMuted = {
        Color = v0.Gray[90], 
        Transparency = 0
    }, 
    BackgroundUIDefault = {
        Color = v0.Gray[90], 
        Transparency = 0
    }, 
    BackgroundUIContrast = {
        Color = v0.Gray[100], 
        Transparency = 0
    }, 
    BackgroundOnHover = {
        Color = v0.White, 
        Transparency = 0.9
    }, 
    BackgroundOnPress = {
        Color = v0.Black, 
        Transparency = 0.7
    }, 
    CellOnHover = {
        Color = v0.Gray[110], 
        Transparency = 0
    }, 
    UIDefault = {
        Color = v0.Gray[70], 
        Transparency = 0
    }, 
    UIMuted = {
        Color = v0.Gray[100], 
        Transparency = 0
    }, 
    UIEmphasis = {
        Color = v0.Gray[80], 
        Transparency = 0
    }, 
    TextDefault = {
        Color = v0.Gray[50], 
        Transparency = 0
    }, 
    TextMuted = {
        Color = v0.Gray[60], 
        Transparency = 0
    }, 
    TextEmphasis = {
        Color = v0.Gray[0], 
        Transparency = 0
    }, 
    TextOnHover = {
        Color = v0.Gray[10], 
        Transparency = 0
    }, 
    TextLink = {
        Color = v0.Blue[50], 
        Transparency = 0
    }, 
    IconDefault = {
        Color = v0.Gray[0], 
        Transparency = 0
    }, 
    IconEmphasis = {
        Color = v0.Gray[0], 
        Transparency = 0
    }, 
    IconOnHover = {
        Color = v0.Gray[0], 
        Transparency = 0
    }, 
    ContextualPrimaryDefault = {
        Color = v0.Green[50], 
        Transparency = 0
    }, 
    ContextualPrimaryOnHover = {
        Color = v0.Green[40], 
        Transparency = 0
    }, 
    ContextualPrimaryContent = {
        Color = v0.Gray[130], 
        Transparency = 0
    }, 
    SystemPrimaryDefault = {
        Color = v0.Gray[0], 
        Transparency = 0
    }, 
    SystemPrimaryOnHover = {
        Color = v0.Gray[40], 
        Transparency = 0
    }, 
    SystemPrimaryContent = {
        Color = v0.Gray[130], 
        Transparency = 0
    }, 
    SecondaryDefault = {
        Color = v0.Gray[0], 
        Transparency = 0
    }, 
    SecondaryOnHover = {
        Color = v0.Gray[40], 
        Transparency = 0
    }, 
    SecondaryContent = {
        Color = v0.Gray[0], 
        Transparency = 0
    }, 
    Divider = {
        Color = v0.White, 
        Transparency = 0.92
    }, 
    Overlay = {
        Color = v0.Black, 
        Transparency = 0.6
    }, 
    NavigationBar = {
        Color = v0.Gray[110], 
        Transparency = 0
    }, 
    Badge = {
        Color = v0.Gray[0], 
        Transparency = 0
    }, 
    BadgeContent = {
        Color = v0.Gray[130], 
        Transparency = 0
    }, 
    Loading = {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, v0.Gray[0]), 
            ColorSequenceKeypoint.new(0.5, v0.Gray[0]), 
            ColorSequenceKeypoint.new(1, v0.Gray[0])
        }), 
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1), 
            NumberSequenceKeypoint.new(0.5, 0.7), 
            NumberSequenceKeypoint.new(1, 1)
        }), 
        Rotation = 45
    }, 
    PlaceHolder = {
        Color = v0.Gray[100], 
        Transparency = 0
    }, 
    OnlineStatus = {
        Color = v0.Green[50], 
        Transparency = 0
    }, 
    OfflineStatus = {
        Color = v0.Gray[50], 
        Transparency = 0
    }, 
    SelectionCursor = {
        Color = v0.Gray[0], 
        Transparency = 0, 
        AnimatedColor = v0.White, 
        GradientRotationSpeed = 2, 
        GradientColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, v0.Gray[0]), 
            ColorSequenceKeypoint.new(1, v0.Gray[70])
        }), 
        GradientTransparencySequence = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(1, 0)
        }), 
        Rotation = 45
    }, 
    Alert = {
        Color = v0.Red[50], 
        Transparency = 0
    }, 
    Success = {
        Color = v0.Green[50], 
        Transparency = 0
    }, 
    Caution = {
        Color = v0.Yellow[50], 
        Transparency = 0
    }, 
    DropShadow = {
        Color = v0.Black, 
        Transparency = 0.2
    }, 
    PlayerBackgroundDefault = {
        Color = v0.Gray[0], 
        Transparency = 0, 
        Image = "component_assets/avatarBG_dark"
    }, 
    ItemBackgroundDefault = {
        Color = v0.Gray[130], 
        Transparency = 0, 
        Image = "component_assets/itemBG_dark"
    }
};
