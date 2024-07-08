local v0 = {
    ThemeName = {
        Dark = "Dark", 
        Light = "Light"
    }, 
    FontName = {
        Gotham = "Gotham"
    }, 
    DeviceType = {
        Desktop = "Desktop", 
        Tablet = "Tablet", 
        Phone = "Phone", 
        Console = "Console", 
        VR = "VR", 
        Unknown = "Unknown"
    }, 
    Layout = {
        ActionBar = {
            PositionOffset = 24
        }
    }
};
v0.DefaultThemeName = v0.ThemeName.Light;
v0.DefaultFontName = v0.FontName.Gotham;
v0.DefaultDeviceType = v0.DeviceType.Desktop;
v0.DefaultSettings = {
    preferredTransparency = 1, 
    reducedMotion = false
};
return v0;
