local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.App.ImageSet.scaleSliceToResolution);
return function(v3, v4)
    assert(v4 > 0, "resolutionScale for ImageSet must be greater than 0 got " .. tostring(v4));
    return v1.forwardRef(function(v5, v6)
        local v7 = {
            [v1.Ref] = v6, 
            [v1.Children] = v5[v1.Children]
        };
        local v8 = nil;
        local v9 = false;
        for v10, v11 in pairs(v5) do
            if v10 == "Image" and typeof(v11) == "table" then
                v9 = true;
                v8 = v11;
            else
                v7[v10] = v11;
            end;
        end;
        if v9 then
            for v12, v13 in pairs(v8) do
                if v7[v12] then
                    if v12 == "ImageRectOffset" then
                        v7[v12] = v13 + v7[v12] * v4;
                    elseif v12 == "ImageRectSize" then
                        v7[v12] = v7[v12] * v4;
                    end;
                else
                    v7[v12] = v13;
                end;
            end;
        end;
        if v9 then
            v7 = v2(v7, v4);
        end;
        return v1.createElement(v3, v7);
    end);
end;
