local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Lighting_0 = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v6 = require(l_Modules_0.AvatarExperience.Common.Managers.ParticleEffectManager);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_LightUtility_0 = require(l_CorePackages_0.Thumbnailing).LightUtility;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFIntAvatarEditorParticleEmitterRateOverride);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_BackgroundType_0 = v12.BackgroundType;
local l_ParticleType_0 = v12.ParticleType;
local l_PagePlayParticleType_0 = v12.PagePlayParticleType;
local l_PageBackgroundType_0 = v12.PageBackgroundType;
local v17 = {};
v17.__index = v17;
local v18 = {
    Lighting = {
        Brightness = 2, 
        ColorShift_Bottom = Color3.fromRGB(232, 255, 146), 
        ColorShift_Top = Color3.fromRGB(85, 136, 167), 
        OutdoorAmbient = Color3.fromRGB(0, 0, 0), 
        Ambient = Color3.fromRGB(170, 170, 170), 
        ClockTime = 12, 
        GeographicLatitude = 41.733, 
        TimeOfDay = "12:00:00", 
        FogColor = Color3.fromRGB(45, 46, 49), 
        FogEnd = 92, 
        FogStart = 20, 
        Sky = {
            CelestialBodiesShown = true, 
            StarCount = 3000
        }
    }, 
    Bloom = {
        Intensity = 0.3, 
        Size = 12, 
        Threshold = 0.95
    }, 
    ColorCorrection = {
        Brightness = 0, 
        Contrast = 0, 
        Saturation = 0
    }
};
local v19 = {
    Lighting = {
        Brightness = 1, 
        ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
        ColorShift_Top = Color3.fromRGB(0, 0, 0), 
        OutdoorAmbient = Color3.fromRGB(127, 127, 127), 
        Ambient = Color3.fromRGB(127, 127, 127), 
        ClockTime = 14, 
        GeographicLatitude = 41.733, 
        TimeOfDay = "14:00:00", 
        FogColor = Color3.fromRGB(192, 192, 192), 
        FogEnd = 100000, 
        FogStart = 0, 
        Sky = {
            CelestialBodiesShown = true, 
            StarCount = 3000
        }
    }
};
local v20 = {
    LightTheme = {
        BackPanelTextureColor = Color3.fromRGB(213, 213, 213), 
        CloudsTextureColor = Color3.fromRGB(222, 222, 222), 
        LargerShapesTextureColor = Color3.fromRGB(222, 222, 222), 
        BasePlateColor = Color3.fromRGB(213, 213, 213), 
        CharacterSpotLightBrightness = 6, 
        FogColor = Color3.fromRGB(213, 213, 213), 
        SkyboxAssetLocation = "rbxasset://textures/AvatarEditorImages/LightPixel.png", 
        ParticleEmitterColorCatalogToAE = ColorSequence.new(Color3.fromRGB(171, 169, 161), Color3.fromRGB(158, 135, 120)), 
        ParticleEmitterColorAEToCatalog = ColorSequence.new(Color3.fromRGB(158, 135, 120), Color3.fromRGB(171, 169, 161))
    }, 
    DarkTheme = {
        BackPanelTextureColor = Color3.fromRGB(83, 80, 82), 
        CloudsTextureColor = Color3.fromRGB(100, 101, 108), 
        LargerShapesTextureColor = Color3.fromRGB(100, 101, 108), 
        BasePlateColor = Color3.fromRGB(83, 80, 82), 
        CharacterSpotLightBrightness = 12, 
        FogColor = Color3.fromRGB(55, 56, 59), 
        SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png", 
        ParticleEmitterColorCatalogToAE = ColorSequence.new(Color3.fromRGB(79, 75, 79), Color3.fromRGB(51, 49, 52)), 
        ParticleEmitterColorAEToCatalog = ColorSequence.new(Color3.fromRGB(51, 49, 52), Color3.fromRGB(79, 75, 79))
    }
};
local v21 = {
    LargerShapes = {
        TextureWallTransparency = 1, 
        LargerShapesPosition = Vector3.new(-62.898, 6.97, -8.815), 
        CloudsPosition = Vector3.new(-90, 20, 0), 
        BaseplateTransparency = 0
    }, 
    Walls = {
        TextureWallTransparency = 0, 
        LargerShapesPosition = Vector3.new(-62.898, -12.3, -8.815), 
        CloudsPosition = Vector3.new(-90, 80, 0), 
        BaseplateTransparency = 0
    }, 
    NoShapesNoWalls = {
        TextureWallTransparency = 1, 
        LargerShapesPosition = Vector3.new(-62.898, -1000, -8.815), 
        CloudsPosition = Vector3.new(-90, 1000, 0), 
        BaseplateTransparency = 1
    }
};
v17.new = function(v22, v23, v24)
    local v25 = {};
    setmetatable(v25, v17);
    v25.connections = {};
    v25.store = v22;
    v25.networking = v23;
    v25.avatarRoute = v24;
    v25.ParticleEffectManager = v6.new(v22, v24);
    v25.colorCorrection = l_Lighting_0:FindFirstChild("ColorCorrection");
    if not v25.colorCorrection then
        v25.colorCorrection = Instance.new("ColorCorrectionEffect");
        v25.colorCorrection.Parent = l_Lighting_0;
    end;
    v25.bloom = l_Lighting_0:FindFirstChild("Bloom");
    if not v25.bloom then
        v25.bloom = Instance.new("BloomEffect");
        v25.bloom.Parent = l_Lighting_0;
    end;
    v25.newBackgroundScene = l_ReplicatedStorage_0:WaitForChild("AvatarSceneNew");
    v25.particleStorage = {
        [l_ParticleType_0.CatalogToAvatarEditor] = {
            largeParticleEmitter = v25.newBackgroundScene.CatalogToAvatarEditorPFX.BIGBOIS, 
            smallParticleEmitter = v25.newBackgroundScene.CatalogToAvatarEditorPFX.SmolBois
        }, 
        [l_ParticleType_0.AvatarEditorToCatalog] = {
            largeParticleEmitter = v25.newBackgroundScene.AvatarEditorToCatalogPFX.BIGBOIS, 
            smallParticleEmitter = v25.newBackgroundScene.AvatarEditorToCatalogPFX.SmolBois
        }
    };
    v25.newBackgroundScene.BackPanel.Transparency = v21.LargerShapes.TextureWallTransparency;
    v25:setupTweening();
    v25:updateTheme(string.lower(l_NotificationService_0.SelectedTheme or nil));
    return v25;
end;
v17.setupTweening = function(v26)
    local v27 = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0);
    local v28 = TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.In, 0, false, 0);
    local v29 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0);
    local v30 = {
        Transparency = 0
    };
    local v31 = {
        Transparency = 1
    };
    v26.wallAppearTween = l_TweenService_0:Create(v26.newBackgroundScene.BackPanel.TextureWall, v29, v30);
    v26.wallDisappearTween = l_TweenService_0:Create(v26.newBackgroundScene.BackPanel.TextureWall, v29, v31);
    v26.floorAppearTween = l_TweenService_0:Create(v26.newBackgroundScene.BackPanel.TextureFloor, v29, v30);
    v26.floorDisappearTween = l_TweenService_0:Create(v26.newBackgroundScene.BackPanel.TextureFloor, v29, v31);
    v26.largerShapesAppearTween = l_TweenService_0:Create(v26.newBackgroundScene.LargerShapes, v27, {
        Position = v21.LargerShapes.LargerShapesPosition
    });
    v26.largerShapesDisappearTween = l_TweenService_0:Create(v26.newBackgroundScene.LargerShapes, v28, {
        Position = v21.Walls.LargerShapesPosition
    });
    v26.cloudsAppearTween = l_TweenService_0:Create(v26.newBackgroundScene.Clouds, v27, {
        Position = v21.LargerShapes.CloudsPosition
    });
    v26.cloudsDisappearTween = l_TweenService_0:Create(v26.newBackgroundScene.Clouds, v28, {
        Position = v21.Walls.CloudsPosition
    });
    v26.allTweens = {
        v26.wallAppearTween, 
        v26.wallDisappearTween, 
        v26.floorAppearTween, 
        v26.floorDisappearTween, 
        v26.largerShapesAppearTween, 
        v26.largerShapesDisappearTween, 
        v26.cloudsAppearTween, 
        v26.cloudsDisappearTween
    };
end;
v17.updateTheme = function(v32, v33)
    v32.theme = v33;
    local l_LightTheme_0 = v20.LightTheme;
    if v33 == "dark" then
        l_LightTheme_0 = v20.DarkTheme;
    end;
    for _, v36 in v32.newBackgroundScene.BackPanel:GetChildren() do
        v36.Color3 = l_LightTheme_0.BackPanelTextureColor;
    end;
    for _, v38 in v32.newBackgroundScene.Clouds:GetChildren() do
        v38.Color3 = l_LightTheme_0.CloudsTextureColor;
    end;
    for _, v40 in v32.newBackgroundScene.LargerShapes:GetChildren() do
        v40.Color3 = l_LightTheme_0.LargerShapesTextureColor;
    end;
    v32.newBackgroundScene.Baseplate.Color = l_LightTheme_0.BasePlateColor;
    v32.newBackgroundScene.CharacterSpotLight.SpotLight.Brightness = l_LightTheme_0.CharacterSpotLightBrightness;
    l_Lighting_0.FogColor = l_LightTheme_0.FogColor;
    for v41, v42 in v32.particleStorage, nil, nil do
        for _, v44 in v42, nil, nil do
            v44.Color = if v41 == l_ParticleType_0.AvatarEditorToCatalog then l_LightTheme_0.ParticleEmitterColorAEToCatalog else l_LightTheme_0.ParticleEmitterColorCatalogToAE;
        end;
    end;
end;
v17.setLighting = function(v45, v46)
    l_Lighting_0.Brightness = v46.Lighting.Brightness;
    l_Lighting_0.ColorShift_Bottom = v46.Lighting.ColorShift_Bottom;
    l_Lighting_0.ColorShift_Top = v46.Lighting.ColorShift_Top;
    l_Lighting_0.OutdoorAmbient = v46.Lighting.OutdoorAmbient;
    l_Lighting_0.Ambient = v46.Lighting.Ambient;
    l_Lighting_0.ClockTime = v46.Lighting.ClockTime;
    l_Lighting_0.GeographicLatitude = v46.Lighting.GeographicLatitude;
    l_Lighting_0.TimeOfDay = v46.Lighting.TimeOfDay;
    l_Lighting_0.FogEnd = v46.Lighting.FogEnd;
    l_Lighting_0.FogStart = v46.Lighting.FogStart;
    if not v46.Bloom then
        if v45.bloom then
            v45.bloom.Enabled = false;
        end;
    elseif v45.bloom then
        v45.bloom.Enabled = true;
        v45.bloom.Intensity = v46.Bloom.Intensity;
        v45.bloom.Size = v46.Bloom.Size;
        v45.bloom.Threshold = v46.Bloom.Threshold;
    end;
    if not v46.ColorCorrection then
        if v45.colorCorrection then
            v45.colorCorrection.Enabled = false;
        end;
    elseif v45.colorCorrection then
        v45.colorCorrection.Enabled = true;
        v45.colorCorrection.Brightness = v46.ColorCorrection.Brightness;
        v45.colorCorrection.Contrast = v46.ColorCorrection.Contrast;
        v45.colorCorrection.Saturation = v46.ColorCorrection.Saturation;
        return ;
    end;
end;
v17.startLighting = function(v47)
    v47:setLighting(v18);
end;
v17.updateLighting = function(v48, v49)
    if v49 == v8.ProfilePictureEditorFinal then
        v48:setLighting(v19);
        if not game.Workspace:FindFirstChild("ThumbnailLightAnchor_0") then
            local l_CurrentCharacter_0 = v48.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
            if l_CurrentCharacter_0 then
                l_LightUtility_0.AddDefaultPointLightRelativeTo(l_CurrentCharacter_0.HumanoidRootPart.CFrame);
                return ;
            end;
        end;
    else
        v48:setLighting(v18);
        local l_ThumbnailLightAnchor_0_0 = game.Workspace:FindFirstChild("ThumbnailLightAnchor_0");
        if l_ThumbnailLightAnchor_0_0 then
            l_ThumbnailLightAnchor_0_0:Destroy();
        end;
    end;
end;
v17.playParticleEmitters = function(v52, v53)
    if l_PagePlayParticleType_0[v53] == l_ParticleType_0.CatalogToAvatarEditor then
        task.spawn(function()
            for _, v55 in v52.particleStorage[l_ParticleType_0.CatalogToAvatarEditor], nil, nil do
                v55.Parent = v52.newBackgroundScene.CatalogToAvatarEditorPFX;
                v55.Enabled = true;
            end;
            wait(1);
            for _, v57 in v52.particleStorage[l_ParticleType_0.CatalogToAvatarEditor], nil, nil do
                v57.Enabled = false;
            end;
        end);
        return ;
    else
        if l_PagePlayParticleType_0[v53] == l_ParticleType_0.AvatarEditorToCatalog then
            task.spawn(function()
                for _, v59 in v52.particleStorage[l_ParticleType_0.AvatarEditorToCatalog], nil, nil do
                    v59.Parent = v52.newBackgroundScene.AvatarEditorToCatalogPFX;
                    v59.Enabled = true;
                end;
                wait(1);
                for _, v61 in v52.particleStorage[l_ParticleType_0.AvatarEditorToCatalog], nil, nil do
                    v61.Enabled = false;
                end;
            end);
        end;
        return ;
    end;
end;
v17.getCurrentPage = function(v62)
    return v62.avatarRoute.current.name;
end;
v17.animateBackground = function(v63, v64)
    task.spawn(function()
        v63.wallDisappearTween:Play();
        v63.floorDisappearTween:Play();
        v63:playParticleEmitters(v64);
        wait(0.2);
        v63.largerShapesAppearTween:Play();
        wait(0.2);
        v63.cloudsAppearTween:Play();
    end);
end;
v17.transitionWithTweens = function(v65, v66)
    if v66 == v8.AvatarEditor then
        v65:animateBackground(v8.AvatarEditor);
    elseif v66 == v8.ProfilePictureEditorEmotes then
        v65:animateBackground(v8.ProfilePictureEditorEmotes);
    elseif not (v66 ~= v8.Catalog) or v66 == v8.AvatarExperienceLandingPage then
        task.spawn(function()
            if v66 ~= v8.AvatarExperienceLandingPage then
                v65:playParticleEmitters(v8.Catalog);
            end;
            v65.largerShapesDisappearTween:Play();
            wait(0.2);
            v65.cloudsDisappearTween:Play();
            wait(0.1);
            v65.wallAppearTween:Play();
            v65.floorAppearTween:Play();
        end);
    end;
    local v67 = v65:getModelInformationForAppPage(v66);
    if not v67 then
        v65.newBackgroundScene.Baseplate.Transparency = 0;
        return ;
    else
        v65.newBackgroundScene.Baseplate.Transparency = v67.BaseplateTransparency;
        return ;
    end;
end;
v17.getModelInformationForAppPage = function(_, v69)
    if l_PageBackgroundType_0[v69] == l_BackgroundType_0.LargerShapes then
        return v21.LargerShapes;
    elseif l_PageBackgroundType_0[v69] == l_BackgroundType_0.NoShapesNoWalls then
        return v21.NoShapesNoWalls;
    elseif l_PageBackgroundType_0[v69] == l_BackgroundType_0.Walls then
        return v21.Walls;
    else
        return nil;
    end;
end;
v17.transitionInstant = function(v70, v71)
    for _, v73 in v70.allTweens, nil, nil do
        v73:Cancel();
    end;
    if l_PagePlayParticleType_0[v71] == l_ParticleType_0.None then
        for _, v75 in v70.particleStorage, nil, nil do
            for _, v77 in v75, nil, nil do
                v77.Enabled = false;
                v77.Parent = nil;
            end;
        end;
    end;
    local v78 = v70:getModelInformationForAppPage(v71);
    if v78 then
        v70.newBackgroundScene.BackPanel.TextureFloor.Transparency = v78.TextureWallTransparency;
        v70.newBackgroundScene.BackPanel.TextureWall.Transparency = v78.TextureWallTransparency;
        v70.newBackgroundScene.LargerShapes.Position = v78.LargerShapesPosition;
        v70.newBackgroundScene.Clouds.Position = v78.CloudsPosition;
        v70.newBackgroundScene.Baseplate.Transparency = v78.BaseplateTransparency;
    end;
end;
v17.update = function(v79, _, _, v82, v83)
    local l_name_0 = v82.current.name;
    local l_name_1 = v83.current.name;
    local l_name_2 = v83.opaque.name;
    local v87 = nil;
    local v88 = {
        [v8.Catalog] = true, 
        [v8.AvatarEditor] = true, 
        [v8.ProfilePictureEditorEmotes] = true
    };
    v87 = false;
    if v88[l_name_0] then
        if not (l_name_0 ~= l_name_1) or not v88[l_name_1] then
            if not (not (l_name_0 ~= l_name_2) or not v88[l_name_2]) then
                v87 = true;
            end;
        else
            v87 = true;
        end;
    end;
    v79.ParticleEffectManager:setAvatarRoute(v82);
    local v89 = true;
    if l_name_0 ~= v8.AvatarExperienceLandingPage then
        v89 = l_name_1 == v8.AvatarExperienceLandingPage;
    end;
    local v90 = true;
    if l_name_0 ~= v8.AvatarEditor then
        v90 = l_name_1 == v8.AvatarEditor;
    end;
    local v91 = true;
    if l_name_0 ~= v8.Catalog then
        v91 = l_name_1 == v8.Catalog;
    end;
    local v92 = v7.isAvatarBackground(l_name_0);
    local v93 = true;
    if l_name_0 ~= v8.ProfilePictureEditorEmotes then
        v93 = l_name_1 == v8.ProfilePictureEditorEmotes;
    end;
    local v94 = v89 and ((v91 or v90) or v93);
    if l_name_0 ~= l_name_1 then
        if not v87 and not v94 then
            v79:transitionInstant(l_name_0);
            if v92 then
                v79:playParticleEmitters(l_name_0);
            end;
        else
            v79:transitionWithTweens(l_name_0);
        end;
    end;
    if l_name_0 ~= l_name_1 then
        v79:updateLighting(l_name_0);
    end;
end;
v17.start = function(v95)
    v95.colorCorrection.TintColor = Color3.fromRGB(255, 255, 255);
    v95:updateTheme(v95.theme);
    local l_name_3 = v95.avatarRoute.current.name;
    local v97 = string.lower(l_NotificationService_0.SelectedTheme);
    if v95.theme ~= v97 then
        v95:updateTheme(v97);
    end;
    table.insert(v95.connections, v95.store.changed:connect(function(v98, v99)
        local l_avatarRoute_0 = v95.avatarRoute;
        v95:update(v98, v99, l_avatarRoute_0, l_avatarRoute_0);
    end));
    table.insert(v95.connections, l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
        v95:updateTheme(string.lower(l_NotificationService_0.SelectedTheme));
    end));
    local v101 = 20;
    v95.newBackgroundScene.BlobShadow.Decal.Transparency = 0.4;
    local v102 = tonumber(v11());
    if v102 > 0 then
        v101 = v102;
    end;
    for _, v104 in v95.particleStorage, nil, nil do
        for _, v106 in v104, nil, nil do
            v106.Rate = v101;
        end;
    end;
    v95:startLighting();
    v95.newBackgroundScene.Parent = game.Workspace;
    if (not ((l_name_3 ~= v8.AvatarEditor and l_name_3 ~= v8.AvatarExperienceLandingPage) and l_name_3 ~= v8.Catalog) or v7.isAvatarBackground(l_name_3)) or l_name_3 == v8.ProfilePictureEditorEmotes then
        v95:transitionInstant(l_name_3);
    end;
    v95.ParticleEffectManager:start();
    if v7.isAvatarBackground(l_name_3) then
        v95:playParticleEmitters(l_name_3);
    end;
end;
v17.stop = function(v107)
    for _, v109 in v107.connections, nil, nil do
        v109:disconnect();
    end;
    v107.connections = {};
    v107.newBackgroundScene.Parent = l_ReplicatedStorage_0;
    v107.ParticleEffectManager:stop();
    for v110, v111 in v107.particleStorage, nil, nil do
        for _, v113 in v111, nil, nil do
            v113.Parent = if v110 == l_ParticleType_0.AvatarEditorToCatalog then v107.newBackgroundScene.AvatarEditorToCatalogPFX else v107.newBackgroundScene.CatalogToAvatarEditorPFX;
        end;
    end;
end;
v17.onDestroy = function(v114)
    v114.ParticleEffectManager:onDestroy();
end;
v17.updateAvatarRoute = function(v115, v116, v117)
    v115.avatarRoute = v116;
    local v118 = v115.store:getState();
    v115:update(v118, v118, v116, v117);
end;
return v17;
