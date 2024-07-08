local _ = require(script:FindFirstAncestor("TenFootUiShell").Parent.ReactOtter);
return {
    DEFAULT_SCREEN_DISTANCE_TO_CAMERA = 6, 
    DEFAULT_BACKGROUND_DISTANCE_TO_CAMERA = 50, 
    CANVAS_SIZE = Vector2.new(1920, 1080), 
    TOP_BAR_HEIGHT_RATIO = 0.13333333333333333, 
    TOP_BAR_CANVAS_SIZE = Vector2.new(1920, 144), 
    DEFAULT_CANVAS_SIZE = Vector2.new(1920, 1080), 
    FULLSCREEN_CANVAS_SIZE = Vector2.new(1920, 1080), 
    CONTROLLER_BAR_HEIGHT_RATIO = 0.09074074074074075, 
    CONTROLLER_BAR_CANVAS_SIZE = Vector2.new(1920, 98), 
    PAGE_CONTENT_CANVAS_HEIGHT = 936, 
    PAGE_CONTENT_HEIGHT_RATIO = 0.8666666666666667, 
    X_DIRECTION_ANIMATION_SPRING_CONFIG = {
        stiffness = 150, 
        damping = 20, 
        mass = 1
    }, 
    Z_DIRECTION_ANIMATION_SPRING_CONFIG = {
        stiffness = 710, 
        damping = 40, 
        mass = 1
    }, 
    Z_DIRECTION_ZOOM_FACTOR = 0.1, 
    ADORNEE_DEPTH = 0.01
};
