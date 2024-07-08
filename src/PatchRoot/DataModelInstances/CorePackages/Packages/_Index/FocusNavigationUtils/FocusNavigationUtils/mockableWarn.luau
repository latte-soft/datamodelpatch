local l_warn_0 = warn;
return (setmetatable({
    mock = function(v1)
        l_warn_0 = v1;
    end, 
    unmock = function()
        l_warn_0 = warn;
    end
}, {
    __call = function(_, ...)
        l_warn_0(...);
    end
}));
