return (setmetatable({
    isEnabled = false
}, {
    __call = function(_, ...)
    end
}));
