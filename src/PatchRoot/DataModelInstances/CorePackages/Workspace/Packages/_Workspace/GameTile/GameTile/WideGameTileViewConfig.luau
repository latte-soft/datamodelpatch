return {
    getTileHeight = function(v0, v1)
        return v1 * 0.5625 + (((v0.Global.Space_250 + v0.Global.Space_250) + v0.Global.Space_100) + v0.Global.Space_50);
    end, 
    getFooterHeight = function(v2)
        return ((v2.Global.Space_250 + v2.Global.Space_250) + v2.Global.Space_100) + v2.Global.Space_50;
    end, 
    getMetadataHeight = function(v3)
        return v3.Global.Space_250;
    end, 
    getPlayButtonHeight = function(v4)
        return v4.Global.Size_450;
    end
};
