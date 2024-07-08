local v0 = require(script.Parent.Parent.SharedFlags);
local l_GetFFlagAdjustVRFloor_0 = v0.GetFFlagAdjustVRFloor;
local l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0 = v0.GetFIntMaquettesAppPanelDistanceMultiplierPercentage;
local v3 = not l_GetFFlagAdjustVRFloor_0() and 4.8 or -0.2;
local v4 = l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0() / 100;
return {
    MainScreenResolution = Vector2.new(1600, 900), 
    MainScreenSize = Vector2.new(4.5, 2.7) * v4, 
    MainScreenCurvature = 70, 
    MainScreenPosition = Vector3.new(0, v3, -4 * v4), 
    AppSystemBarPosition = Vector3.new(-2.35 * v4, v3, -3.15 * v4), 
    AppSystemBarSize = Vector2.new(0.495, 2.7) * v4, 
    AppSystemBarResolution = Vector2.new(64, 360), 
    CentralOverlayPosition = Vector3.new(0, v3, -3.5 * v4), 
    ToastSize = Vector2.new(2.5, 1.5), 
    ToastPosition = Vector3.new(0, 3.3, -2.8), 
    ToastResolution = Vector2.new(650, 382), 
    ToastCurvature = 50, 
    DefaultCameraPosition = Vector3.new(0, v3, 0), 
    FTUX = {
        UniverseId = "4510252459", 
        PlaceId = "12887241816"
    }, 
    ROUNDED_CORNER_RADIUS = 15, 
    PositionLockedPanelName = "PositionLocked"
};
