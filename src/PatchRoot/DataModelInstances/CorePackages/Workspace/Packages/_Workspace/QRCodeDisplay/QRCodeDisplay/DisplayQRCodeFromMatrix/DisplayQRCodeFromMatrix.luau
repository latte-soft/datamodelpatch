local l_script_FirstAncestor_0 = script:FindFirstAncestor("QRCodeDisplay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.drawImage);
local v5 = require(script.Parent.generatePixels);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagQrCodeDrawToEditableImage);
local v7 = {
    backgroundColor3 = Color3.fromRGB(255, 255, 255), 
    backgroundTransparency = 0, 
    pixelColor3 = Color3.fromRGB(0, 0, 0), 
    pixelTransparency = 0, 
    sideLength = 200
};
local function _(v8, v9)
    if v9 then
        assert(type(v9) == "number", "rotation must be a number");
        if v9 % 90 == 0 then
            return v8;
        else
            local v10 = math.rad(v9);
            return (math.round(v8 / (math.sin(v10) + math.cos(v10))));
        end;
    else
        return v8;
    end;
end;
return function(v12)
    local v13 = v3.join(v7, v12);
    local v14 = nil;
    if not v6 then
        v14 = v5(v13);
    else
        local v15 = v2.createRef();
        local l_sideLength_0 = v13.sideLength;
        local l_qrCodeRotation_0 = v13.qrCodeRotation;
        local v18;
        if l_qrCodeRotation_0 then
            assert(type(l_qrCodeRotation_0) == "number", "rotation must be a number");
            if l_qrCodeRotation_0 % 90 == 0 then
                v18 = l_sideLength_0;
            else
                local v19 = math.rad(l_qrCodeRotation_0);
                v18 = math.round(l_sideLength_0 / (math.sin(v19) + math.cos(v19)));
            end;
        else
            v18 = l_sideLength_0;
        end;
        l_sideLength_0 = function(v20)
            v15.current = v20;
            if v20 then
                v4(v20, v18, v13.qrCodeMatrix, v13.pixelColor3, v13.pixelTransparency);
                return ;
            else
                return ;
            end;
        end;
        v2.useEffect(function()
            if v15.current then
                v4(v15.current, v18, v13.qrCodeMatrix, v13.pixelColor3, v13.pixelTransparency);
                return ;
            else
                return ;
            end;
        end, {
            v18, 
            v13.qrCodeMatrix, 
            v13.pixelColor3, 
            v13.pixelTransparency
        });
        v14 = {
            ImageLabel = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Rotation = v13.qrCodeRotation, 
                Size = UDim2.fromOffset(v18, v18)
            }, {
                Image = v2.createElement("EditableImage", {
                    ref = l_sideLength_0, 
                    Size = Vector2.new(v18, v18)
                })
            })
        };
    end;
    return v2.createElement("Frame", {
        BackgroundColor3 = v13.backgroundColor3, 
        BackgroundTransparency = v13.backgroundTransparency, 
        BorderSizePixel = 0, 
        Size = UDim2.fromOffset(v13.sideLength, v13.sideLength)
    }, v14);
end;
