return {
    new = function()
        return {};
    end, 
    fromWeb = function(v0)
        local v1 = v0 or {};
        v1.placeId = tostring(v1.placeId);
        return v1;
    end
};
