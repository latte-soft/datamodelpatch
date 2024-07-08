local v0 = require(script.Parent.Parent.Analytics);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4)
    local v5 = false;
    if v3 > 0 then
        v5 = v3 <= 120;
    end;
    assert(v5);
    v5 = false;
    if v4.X > 0 then
        v5 = v4.Y > 0;
    end;
    assert(v5);
    local v6 = {
        mode = not v2 and 2 or 1, 
        imgSize = v4, 
        cameraFov = v3
    };
    setmetatable(v6, v1);
    return v6;
end;
v1.setupViewportFrame = function(v7)
    assert(v7.screenGui);
    assert(v7.worldModel);
    assert(v7.vpfs);
    assert(v7.camera);
    local v8 = Instance.new("ViewportFrame", v7.screenGui);
    v8.BackgroundTransparency = 1;
    v8.BorderSizePixel = 0;
    v8.Size = UDim2.fromOffset(v7.imgSize.X, v7.imgSize.Y);
    v7.worldModel.Parent = v8;
    v7:setCamera(v7.cameraOptions.fill, v7.cameraOptions.maxDim, v7.cameraOptions.dir);
    local l_camera_0 = v7.camera;
    l_camera_0.Parent = v8;
    v8.CurrentCamera = l_camera_0;
    table.insert(v7.vpfs, v8);
end;
v1.setupScreenGui = function(v10)
    local v11 = Instance.new("ScreenGui", game:GetService("CoreGui"));
    local l_WorldModel_0 = Instance.new("WorldModel");
    v10.screenGui = v11;
    v10.worldModel = l_WorldModel_0;
    v10.vpfs = {};
end;
v1.init = function(v13, v14)
    v13.target = v14;
    local l_v14_FirstAncestorWhichIsA_0 = v14:FindFirstAncestorWhichIsA("Model");
    local l_v14_FirstAncestorWhichIsA_1 = v14:FindFirstAncestorWhichIsA("Folder");
    local v17 = nil;
    if not l_v14_FirstAncestorWhichIsA_0 then
        if not l_v14_FirstAncestorWhichIsA_1 then
            v17 = v14;
        else
            v17 = l_v14_FirstAncestorWhichIsA_1;
            v13.ancestor = v17;
        end;
    else
        v17 = l_v14_FirstAncestorWhichIsA_0;
        v13.ancestor = v17;
    end;
    if v13.mode == 2 then
        v13:setupScreenGui();
        v17.Parent = v13.worldModel;
        return ;
    else
        if v13.mode == 1 then
            v17.Parent = workspace;
        end;
        return ;
    end;
end;
v1.setCamera = function(v18, v19, v20, v21)
    assert(v18.target);
    local l_camera_1 = v18.camera;
    local l_cameraFov_0 = v18.cameraFov;
    local l_target_0 = v18.target;
    if not l_camera_1 then
        l_camera_1 = Instance.new("Camera");
        l_camera_1.FieldOfView = l_cameraFov_0;
        if v18.mode == 1 then
            l_camera_1.Name = "ThumbnailCamera";
            l_camera_1.Parent = workspace:GetChildren()[1];
        end;
        v18.camera = l_camera_1;
    end;
    local l_Size_0 = l_target_0.Size;
    local l_Position_0 = l_target_0.CFrame.Position;
    l_camera_1.CFrame = CFrame.lookAt((l_Position_0 + v21 * (v20 / ((v19 * 2) * math.tan((math.rad(l_cameraFov_0 / 2)))))) + (v21 * l_Size_0) / 2, l_Position_0);
    v18.cameraOptions = {
        fill = v19, 
        maxDim = v20, 
        dir = v21
    };
end;
v1.cleanup = function(v27)
    if v27.screenGui then
        v27.screenGui:Destroy();
        v27.screenGui = nil;
        v27.vpfs = nil;
    end;
    if v27.cameraOptions then
        v27.cameraOptions = nil;
    end;
    if v27.target then
        v27.target:Destroy();
        v27.target = nil;
    end;
    if v27.ancestor then
        v27.ancestor:Destroy();
        v27.ancestor = nil;
    end;
    if v27.camera then
        v27.camera:Destroy();
        v27.camera = nil;
    end;
end;
v1.takeSnapshot = function(v28)
    local v29 = os.clock();
    local v30 = nil;
    local v31 = nil;
    if v28.mode == 1 then
        local l_ThumbnailGenerator_0 = game:GetService("ThumbnailGenerator");
        local l_status_0, l_result_0 = pcall(function()
            return l_ThumbnailGenerator_0:Click("Png", v28.imgSize.X, v28.imgSize.Y, true);
        end);
        v30 = l_status_0;
        v31 = l_result_0;
    else
        v28:setupViewportFrame();
        local l_status_1, l_result_1 = pcall(function()
            task.wait(1);
            return v28.vpfs[#v28.vpfs]:CaptureSnapshotAsync();
        end);
        v30 = l_status_1;
        v31 = l_result_1;
    end;
    v0.reportThumbnailing(os.clock() - v29);
    return v30, v31;
end;
return v1;
