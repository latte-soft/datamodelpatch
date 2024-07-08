return {
    new = function(v0)
        local v1 = {};
        local v2 = v0 or {};
        v1.getLayerData = function(v3)
            return v2[v3];
        end;
        v1.logUserLayerExposure = function(v4)
            return v2[v4];
        end;
        return v1;
    end
};
