local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.ReactOtter);
local l_IconSize_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Enum.IconSize;
local v3 = {
    MouseAndKeyboard = "MouseAndKeyboard", 
    Touch = "Touch", 
    Gamepad = "Gamepad"
};
local v4 = {
    Landscape = "Landscape", 
    Portrait = "Portrait", 
    Sensor = "Sensor"
};
return {
    ICON_CELL_WIDTH = 44, 
    DIVIDER_CELL_WIDTH = 5, 
    ICON_SIZE = 36, 
    SUB_MENU_ROW_HEIGHT = 56, 
    PIN_ICON_SIZE = UDim2.new(0, 18, 0, 18), 
    PIN_BUTTON_SIZE = 40, 
    PIN_RIGHT_PADDING = 13, 
    NEW_BADGE_SIZE = 66, 
    MENU_ANIMATION_SPRING = {
        dampingRatio = 1.1, 
        frequency = 6.666666666666667, 
        restingPositionLimit = 0.1, 
        restingVelocityLimit = 0.05
    }, 
    UNIBAR_KEEP_OUT_AREA_ID = "unibar", 
    WINDOW_HOST_GUI_NAME = "WindowHost", 
    CLOSE_BUTTON_FRAME = UDim2.fromOffset(44, 44), 
    CLOSE_BUTTON_SIZE = UDim2.fromOffset(22, 22), 
    CLOSE_ICON_SIZE = l_IconSize_0.Small, 
    CORNER_RADIUS = UDim.new(0, 8), 
    WINDOW_ACTIVE_SECONDS = 2, 
    DRAG_MAGNITUDE_THRESHOLD = 10, 
    DEFAULT_HEIGHT_LARGE = 324, 
    DEFAULT_WIDTH_LARGE = 150, 
    DEFAULT_HEIGHT = 185, 
    DEFAULT_WIDTH = 86, 
    MAX_HEIGHT_PORTRAIT = 324, 
    MAX_WIDTH_PORTRAIT = 150, 
    MAX_HEIGHT_LANDSCAPE = 240, 
    MAX_WIDTH_LANDSCAPE = 112, 
    HEALTH = {
        RED = Color3.fromRGB(255, 28, 0), 
        YELLOW = Color3.fromRGB(250, 235, 0), 
        GREEN = Color3.fromRGB(27, 252, 107), 
        RED_THRESHOLD = 0.1, 
        YELLOW_THRESHOLD = 0.5, 
        GREEN_THRESHOLD = 0.8
    }, 
    ANALYTICS = {
        SCREEN_ORIENTATION_MAP = {
            [Enum.ScreenOrientation.LandscapeLeft] = v4.Landscape, 
            [Enum.ScreenOrientation.LandscapeRight] = v4.Landscape, 
            [Enum.ScreenOrientation.LandscapeSensor] = v4.Landscape, 
            [Enum.ScreenOrientation.Portrait] = v4.Portrait, 
            [Enum.ScreenOrientation.Sensor] = v4.Sensor
        }, 
        INPUT_TYPE_MAP = {
            [Enum.UserInputType.MouseButton1] = v3.MouseAndKeyboard, 
            [Enum.UserInputType.MouseButton2] = v3.MouseAndKeyboard, 
            [Enum.UserInputType.MouseButton3] = v3.MouseAndKeyboard, 
            [Enum.UserInputType.MouseWheel] = v3.MouseAndKeyboard, 
            [Enum.UserInputType.MouseMovement] = v3.MouseAndKeyboard, 
            [Enum.UserInputType.Keyboard] = v3.MouseAndKeyboard, 
            [Enum.UserInputType.Gamepad1] = v3.Gamepad, 
            [Enum.UserInputType.Gamepad2] = v3.Gamepad, 
            [Enum.UserInputType.Gamepad3] = v3.Gamepad, 
            [Enum.UserInputType.Gamepad4] = v3.Gamepad, 
            [Enum.UserInputType.Gamepad5] = v3.Gamepad, 
            [Enum.UserInputType.Gamepad6] = v3.Gamepad, 
            [Enum.UserInputType.Gamepad7] = v3.Gamepad, 
            [Enum.UserInputType.Gamepad8] = v3.Gamepad, 
            [Enum.UserInputType.Touch] = v3.Touch
        }, 
        UNIBAR_OPENED = "chrome_unibar_opened", 
        UNIBAR_CLOSED = "chrome_unibar_closed", 
        ICON_ACTIVATED = "chrome_unibar_icon_activated", 
        ICON_DRAG_START = "chrome_unibar_icon_drag_started", 
        ICON_DRAG_END = "chrome_unibar_icon_drag_ended", 
        WINDOW_DRAG_START = "chrome_unibar_window_drag_started", 
        WINDOW_DRAG_END = "chrome_unibar_window_drag_ended", 
        WINDOW_RESIZE = "chrome_unibar_window_resized", 
        WINDOW_OPENED = "chrome_unibar_window_opened", 
        WINDOW_CLOSED = "chrome_unibar_window_closed", 
        PIN_ADDED = "chrome_unibar_pin_added", 
        PIN_REMOVED = "chrome_unibar_pin_removed"
    }
};
