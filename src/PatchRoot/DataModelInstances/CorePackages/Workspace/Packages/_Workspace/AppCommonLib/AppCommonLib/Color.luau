local v3 = {
    RgbFromHex = function(v0)
        local v1 = false;
        if v0 >= 0 then
            v1 = v0 <= 16777215;
        end;
        assert(v1, "RgbFromHex: Out of range");
        local v2 = v0 % 256;
        v0 = (v0 - v2) / 256;
        v1 = v0 % 256;
        return (v0 - v1) / 256, v1, v2;
    end
};
v3.Color3FromHex = function(v4)
    return Color3.fromRGB(v3.RgbFromHex(v4));
end;
return v3;
