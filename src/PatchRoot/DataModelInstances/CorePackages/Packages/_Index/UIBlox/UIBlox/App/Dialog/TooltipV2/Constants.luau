local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_1.Tooltip.Enum.TooltipOrientation);
local v5 = require(l_Parent_2.ImageSet.Images);
local v6 = UDim2.fromOffset(16, 8);
local v7 = v6.Y.Offset - 1;
return table.freeze({
    DEFAULT_PADDING = 12, 
    DEFAULT_LIST_PADDING = 8, 
    CORNER_RADIUS = UDim.new(0, 8), 
    CARET_DISTANCE = 4, 
    CONTENT_TO_CARET_TIP = v7, 
    CONTENT_TO_CARET_CENTER = v7 - v6.Y.Offset / 2, 
    MAX_WIDTH = 240, 
    HOTKEY_PADDING = 6, 
    CARET_IMAGE = v5["component_assets/triangleDown_16"], 
    CARET_ROTATION = {
        [v4.Top] = 0, 
        [v4.Bottom] = 180, 
        [v4.Right] = 90, 
        [v4.Left] = 270
    }, 
    CARET_SIZE = v6, 
    CLOSE_BUTTON_SIZE = 24, 
    CLOSE_BUTTON_PADDING = 4, 
    DropShadow = {
        Small = {
            IMAGE = v5["component_assets/dropshadow_17_4"], 
            SLICE_CENTER = Rect.new(12, 12, 13, 13), 
            OFFSET = {
                [v4.Top] = 2, 
                [v4.Bottom] = 6, 
                [v4.Right] = 4, 
                [v4.Left] = 4
            }
        }, 
        Large = {
            IMAGE = v5["component_assets/dropshadow_17_16"], 
            SLICE_CENTER = Rect.new(36, 36, 37, 37), 
            OFFSET = {
                [v4.Top] = 28, 
                [v4.Bottom] = 28, 
                [v4.Right] = 28, 
                [v4.Left] = 28
            }
        }
    }, 
    ORIENTATION_VECTOR = {
        [v4.Top] = Vector2.new(0, -1), 
        [v4.Bottom] = Vector2.new(0, 1), 
        [v4.Left] = Vector2.new(-1, 0), 
        [v4.Right] = Vector2.new(1, 0)
    }, 
    OPPOSITE_ORIENTATION = {
        [v4.Top] = v4.Bottom, 
        [v4.Bottom] = v4.Top, 
        [v4.Right] = v4.Left, 
        [v4.Left] = v4.Right
    }, 
    DISTANCE_TO_CONTENT = 4 + v7, 
    SCREEN_MARGIN = 12, 
    MIN_DISTANCE_TO_CARET_MIDDLE = 12 + v6.X.Offset / 2, 
    INACTIVE_ANIMATION_TARGETS = {
        distanceOffset = -4, 
        transparency = 1
    }, 
    ACTIVE_ANIMATION_TARGETS = {
        distanceOffset = 0, 
        transparency = 0
    }, 
    ANIMATION_OPTIONS = {
        frequency = 5
    }, 
    DEFAULT_DELAY_TIME = 0.4
});
