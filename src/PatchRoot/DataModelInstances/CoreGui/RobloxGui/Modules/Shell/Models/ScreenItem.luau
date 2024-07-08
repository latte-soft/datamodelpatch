return {
    Priority = {
        Default = 1, 
        Overlay = 2, 
        Elevated = 3, 
        Immediate = 4
    }, 
    new = function(v0, v1, v2)
        return {
            id = v0, 
            priority = v1, 
            createdAt = tick(), 
            data = v2
        };
    end
};
