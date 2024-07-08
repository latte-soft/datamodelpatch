local v0 = {
    SpeedAdjustmentTarget = 0.5, 
    CursorRadius = 40, 
    SelectionRadius = 40, 
    MaxSpeedRelative = 0.7, 
    ThumbstickDeadzone = 0.2, 
    ScrollingRadius = 15, 
    ScrollingSlowDown = 0.25, 
    ScrollingSpeed = 1000
};
setmetatable(v0, {
    __index = function(_, v2)
        error(string.format("%q is not a valid member of properties", (tostring(v2))), 2);
    end
});
return v0;
