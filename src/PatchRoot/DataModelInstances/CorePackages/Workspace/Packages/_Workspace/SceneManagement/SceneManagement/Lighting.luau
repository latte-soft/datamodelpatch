local l_Lighting_0 = game:GetService("Lighting");
local l_Object_0 = require(script:FindFirstAncestor("SceneManagement").Parent.LuauPolyfill).Object;
local v2 = {
    LightingConfig = {
        Brightness = 1, 
        ColorShift_Bottom = Color3.fromRGB(232, 255, 146), 
        ColorShift_Top = Color3.fromRGB(85, 136, 167), 
        OutdoorAmbient = Color3.fromRGB(0, 0, 0), 
        Ambient = Color3.fromRGB(170, 170, 170), 
        ClockTime = 12, 
        GeographicLatitude = 41.733, 
        TimeOfDay = "12:00:00", 
        FogColor = Color3.fromRGB(45, 46, 49), 
        FogEnd = 92, 
        FogStart = 20
    }, 
    SkyConfig = {
        CelestialBodiesShown = false, 
        StarCount = 0, 
        SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png"
    }, 
    BloomEnabled = false, 
    BloomConfig = {
        Intensity = 0.3, 
        Size = 12, 
        Threshold = 0.95
    }, 
    ColorCorrectionEnabled = false, 
    ColorCorrectionConfig = {
        Brightness = 0, 
        Contrast = 0, 
        Saturation = 0
    }
};
local function v5(v3)
    local v4 = l_Object_0.assign({}, v2.LightingConfig, v3 or {});
    l_Lighting_0.Brightness = v4.Brightness;
    l_Lighting_0.ColorShift_Bottom = v4.ColorShift_Bottom;
    l_Lighting_0.ColorShift_Top = v4.ColorShift_Top;
    l_Lighting_0.OutdoorAmbient = v4.OutdoorAmbient;
    l_Lighting_0.Ambient = v4.Ambient;
    l_Lighting_0.ClockTime = v4.ClockTime;
    l_Lighting_0.GeographicLatitude = v4.GeographicLatitude;
    l_Lighting_0.TimeOfDay = v4.TimeOfDay;
    l_Lighting_0.FogColor = v4.FogColor;
    l_Lighting_0.FogEnd = v4.FogEnd;
    l_Lighting_0.FogStart = v4.FogStart;
end;
local function _()
    local l_Sky_0 = l_Lighting_0:FindFirstChild("Sky");
    if l_Sky_0 == nil then
        l_Sky_0 = Instance.new("Sky");
        l_Sky_0.Parent = l_Lighting_0;
    end;
    return l_Sky_0;
end;
local function v11(v8, v9)
    local v10 = l_Object_0.assign({}, v2.SkyConfig, v9 or {});
    v8.CelestialBodiesShown = v10.CelestialBodiesShown;
    v8.StarCount = v10.StarCount;
    v8.SkyboxBk = v10.SkyboxAssetLocation;
    v8.SkyboxDn = v10.SkyboxAssetLocation;
    v8.SkyboxFt = v10.SkyboxAssetLocation;
    v8.SkyboxLf = v10.SkyboxAssetLocation;
    v8.SkyboxRt = v10.SkyboxAssetLocation;
    v8.SkyboxUp = v10.SkyboxAssetLocation;
end;
local function _()
    return (l_Lighting_0:FindFirstChild("Bloom"));
end;
local function _()
    local l_Bloom_0 = l_Lighting_0:FindFirstChild("Bloom");
    if l_Bloom_0 == nil then
        l_Bloom_0 = Instance.new("BloomEffect");
        l_Bloom_0.Parent = l_Lighting_0;
    end;
    return l_Bloom_0;
end;
local function v18(v15, v16)
    local v17 = l_Object_0.assign({}, v2.BloomConfig, v16 or {});
    v15.Enabled = true;
    v15.Intensity = v17.Intensity;
    v15.Size = v17.Size;
    v15.Threshold = v17.Threshold;
end;
local function _()
    return (l_Lighting_0:FindFirstChild("ColorCorrection"));
end;
local function _()
    local l_ColorCorrection_0 = l_Lighting_0:FindFirstChild("ColorCorrection");
    if l_ColorCorrection_0 == nil then
        l_ColorCorrection_0 = Instance.new("ColorCorrectionEffect");
        l_ColorCorrection_0.Parent = l_Lighting_0;
    end;
    return l_ColorCorrection_0;
end;
local function v25(v22, v23)
    local v24 = l_Object_0.assign({}, v2.ColorCorrectionConfig, v23 or {});
    v22.Enabled = true;
    v22.Brightness = v24.Brightness;
    v22.Contrast = v24.Contrast;
    v22.Saturation = v24.Saturation;
end;
return {
    configure = function(v26)
        local v27 = (v2.BloomEnabled or v26 and v26.BloomEnabled) or false;
        local v28 = (v2.ColorCorrectionEnabled or v26 and v26.ColorCorrectionEnabled) or false;
        local v29 = if not v26 then nil else v26.LightingConfig;
        local v30 = if not v26 then nil else v26.SkyConfig;
        local v31 = if not v26 then nil else v26.BloomConfig;
        local v32 = if not v26 then nil else v26.ColorCorrectionConfig;
        v5(v29);
        local l_Sky_1 = l_Lighting_0:FindFirstChild("Sky");
        if l_Sky_1 == nil then
            l_Sky_1 = Instance.new("Sky");
            l_Sky_1.Parent = l_Lighting_0;
        end;
        v11(l_Sky_1, v30);
        if not v27 then
            l_Sky_1 = l_Lighting_0:FindFirstChild("Bloom");
            if l_Sky_1 ~= nil then
                l_Sky_1.Enabled = false;
            end;
        else
            local l_Bloom_1 = l_Lighting_0:FindFirstChild("Bloom");
            if l_Bloom_1 == nil then
                l_Bloom_1 = Instance.new("BloomEffect");
                l_Bloom_1.Parent = l_Lighting_0;
            end;
            v18(l_Bloom_1, v31);
        end;
        if not v28 then
            l_Sky_1 = l_Lighting_0:FindFirstChild("ColorCorrection");
            if l_Sky_1 ~= nil then
                l_Sky_1.Enabled = false;
            end;
            return ;
        else
            local l_ColorCorrection_1 = l_Lighting_0:FindFirstChild("ColorCorrection");
            if l_ColorCorrection_1 == nil then
                l_ColorCorrection_1 = Instance.new("ColorCorrectionEffect");
                l_ColorCorrection_1.Parent = l_Lighting_0;
            end;
            v25(l_ColorCorrection_1, v32);
            return ;
        end;
    end
};
