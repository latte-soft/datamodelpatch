local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local v1 = require(l_script_FirstAncestor_0.Constants);
local v2 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Views.Constants);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.SceneManagement);
local l_Lighting_0 = v4.Lighting;
local l_BackgroundScene_0 = v4.BackgroundScene;
local v7 = require(l_Parent_0.Otter);
local l_BACKGROUND_MODEL_NAME_0 = v1.BACKGROUND_MODEL_NAME;
local v9 = {
    BackgroundConfigs = {
        BackgroundModelName = l_BACKGROUND_MODEL_NAME_0, 
        PositionOffset = Vector3.new(10, 0, 0), 
        RotationOffset = Vector3.new(0, 50, 0), 
        DistanceToCamera = v2.DEFAULT_BACKGROUND_DISTANCE_TO_CAMERA
    }, 
    CameraConfigs = {
        FieldOfView = 50, 
        Position = v1.CAMERA_POSITION
    }
};
local v10 = {
    positionX = v7.createSingleMotor(0), 
    positionZ = v7.createSingleMotor(0)
};
local v11 = {};
local function v14()
    for _, v13 in v11, nil, nil do
        v13();
    end;
    table.clear(v11);
end;
local function v21(v15)
    for _, v17 in v11, nil, nil do
        v17();
    end;
    table.clear(v11);
    local l_Position_0 = v15:GetPivot().Position;
    v11 = {
        v10.positionX:onStep(function(v19)
            l_BackgroundScene_0.updateXPosition(l_BACKGROUND_MODEL_NAME_0, l_Position_0.X + v19);
        end), 
        v10.positionZ:onStep(function(v20)
            l_BackgroundScene_0.updateZPosition(l_BACKGROUND_MODEL_NAME_0, l_Position_0.Z + v20);
        end)
    };
end;
return {
    initialize = function(v22)
        l_Lighting_0.configure();
        v10 = v22 or v10;
        local v23, v24 = l_BackgroundScene_0.initialize(v9);
        v21(v23);
        return v23, v24;
    end, 
    deinitialize = v14, 
    updateXPosition = function(v25)
        v10.positionX:setGoal(v7.spring(v25, v2.X_DIRECTION_ANIMATION_SPRING_CONFIG));
    end, 
    updateZPosition = function(v26)
        v10.positionZ:setGoal(v7.spring(v26, v2.Z_DIRECTION_ANIMATION_SPRING_CONFIG));
    end, 
    getBackgroundInstance = function()
        return l_BackgroundScene_0.getBackgroundInstance(l_BACKGROUND_MODEL_NAME_0);
    end
};
