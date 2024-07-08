return {
    Color3FromString = function(v0)
        local v1, v2, v3 = unpack(v0:split("/"));
        return (Color3.fromRGB(tonumber(v1), tonumber(v2), (tonumber(v3))));
    end
};
