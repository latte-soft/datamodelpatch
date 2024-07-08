local v0 = {};
local l_Lighting_0 = game:GetService("Lighting");
local v2 = require(script.Parent.ColorUtility);
local v3 = require(script.Parent.VectorUtility);
v0.AddLight = function(v4, v5)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Anchored = true;
    l_Part_0.Transparency = 1;
    l_Part_0.Shape = Enum.PartType.Ball;
    l_Part_0.Color = v4.color;
    l_Part_0.Name = "ThumbnailLightAnchor_" .. tostring(v5);
    l_Part_0.Parent = workspace;
    local l_PointLight_0 = Instance.new("PointLight");
    l_PointLight_0.Color = v4.color;
    l_PointLight_0.Brightness = 3;
    l_PointLight_0.Range = 10;
    l_PointLight_0.Shadows = true;
    l_PointLight_0.Name = "PointLight_" .. tostring(v5);
    l_PointLight_0.Parent = l_Part_0;
    l_Part_0.Position = v4.worldPos;
end;
v0.AddLightsFromExtraParams = function(v8, v9)
    local v10 = false;
    local v11 = v8 and v8.pointLights;
    if v11 then
        for v12, v13 in ipairs(v11) do
            v0.AddLight({
                color = v2.Color3FromString(v13.color), 
                worldPos = v9 * v3.Vector3FromJson(v13.pos)
            }, v12);
            v10 = true;
        end;
    end;
    local v14 = v8 and v8.clockTime;
    if v14 then
        l_Lighting_0.ClockTime = v14;
        v10 = true;
    end;
    local v15 = v8 and v8.brightness;
    if v15 then
        l_Lighting_0.Brightness = v15;
        v10 = true;
    end;
    return v10;
end;
local v16 = Vector3.new(-5, 7, -5);
v0.AddDefaultPointLightRelativeTo = function(v17)
    v0.AddLight({
        color = Color3.new(1, 1, 1), 
        worldPos = v17 * v16
    }, 0);
end;
return v0;
