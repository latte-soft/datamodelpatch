local l_Parent_0 = script:FindFirstAncestor("QRCodeDisplay").Parent;
local v1 = require(l_Parent_0.React);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
return function(v3)
    local v4 = math.max(math.floor(v3.sideLength / #v3.qrCodeMatrix), 1);
    local v5 = math.max((v3.sideLength - v4 * #v3.qrCodeMatrix) / 2, 0);
    local function _(v6)
        return (v6 - 1) * v4 + v5;
    end;
    local v8 = {};
    l_Array_0.forEach(v3.qrCodeMatrix, function(v9, v10)
        l_Array_0.forEach(v9, function(v11, v12)
            if v11 > 0 then
                table.insert(v8, v1.createElement("Frame", {
                    BackgroundColor3 = v3.pixelColor3, 
                    BackgroundTransparency = v3.pixelTransparency, 
                    BorderSizePixel = 0, 
                    Position = UDim2.fromOffset((v10 - 1) * v4 + v5, (v12 - 1) * v4 + v5), 
                    Size = UDim2.fromOffset(v4, v4)
                }));
            end;
        end);
    end);
    return v8;
end;
