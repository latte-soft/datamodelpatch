local l_CoreGui_0 = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.mutedError);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetAXCameraManagerErrorsEnabled);
local v13 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0);
local v14 = Vector3.new(4, 6, 2);
local v15 = Vector3.new(-3, 2.5, 1.5);
local v16 = CFrame.new(v15, v15 + Vector3.new(1, 0, 0));
local v17 = {
    [l_DeviceOrientationMode_0.Portrait] = {
        cameraCenterScreenPosition = UDim2.new(0, 0, -0.5, 40), 
        baseCameraOrigin = Vector3.new(19.24339867, 0, 0.594265997), 
        landingPageCameraCenterScreenPosition = UDim2.new(0, 0, -0.4, 40), 
        landingPageZoomToFocusHeightRatio = 6.188, 
        zoomToFocusHeightRatio = 8.704, 
        fullViewZoomToFocusHeightRatio = 4.5, 
        defaultVerticalFocusScale = 0.4, 
        minZoomRadius = 5, 
        maxZoomRadius = 30
    }, 
    [l_DeviceOrientationMode_0.Landscape] = {
        cameraCenterScreenPosition = UDim2.new(v8.LandscapeNavWidth, 0, 0, 10), 
        baseCameraOrigin = Vector3.new(9.24339867, 0, 0.594265997), 
        zoomToFocusHeightRatio = 3.84, 
        fullViewZoomToFocusHeightRatio = 3.6, 
        defaultVerticalFocusScale = 0.5, 
        minZoomRadius = 3, 
        maxZoomRadius = 20
    }
};
local function _(v18, v19)
    return v18 - UDim2.new(0, 0, 0, 64 - v19);
end;
local function _(v21)
    local v22 = v21.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
    if not v22.isUnequipped then
        return v22.itemSubType == v8.BundleTypeIdStrings.Animations;
    else
        return false;
    end;
end;
local function v31(v24, v25)
    local v26 = #v25;
    if v26 == 0 then
        return v8.DefaultRigPosition;
    else
        local v27 = Vector3.new();
        for _, v29 in v25, nil, nil do
            if not v29.Attachment then
                v27 = v27 + v6.getPartCFrame(v24, v29.Part).Position;
            else
                local v30 = v6.getAttachmentCFrame(v24, v29.Part, v29.Attachment);
                if v30 == nil then
                    v30 = v6.getPartCFrame(v24, v29.Part);
                end;
                v27 = v27 + v30.Position;
            end;
        end;
        return v27 / v26;
    end;
end;
local v39 = l_memoize_0(function(v32)
    local v33 = " equippedAssets=";
    local v34 = {};
    for _, v36 in v32, nil, nil do
        for v37, _ in v36, nil, nil do
            table.insert(v34, v37);
        end;
    end;
    return v33 .. table.concat(v34, ", ");
end);
local function v53(v40, v41, v42)
    local l_v40_BoundingBox_0, v44 = v40:GetBoundingBox();
    if not v6.isBoundingBoxVectorSane(v44) then
        if v12() then
            v4("(Avatar Experience) size = " .. v44.X .. ", " .. v44.Y .. ", " .. v44.Z .. v39(v42));
        end;
        v44 = v14;
    end;
    if not v6.isBoundingBoxCFrameSane(l_v40_BoundingBox_0) then
        if v12() then
            v4("(Avatar Experience) orientation = " .. l_v40_BoundingBox_0.X .. ", " .. l_v40_BoundingBox_0.Y .. ", " .. l_v40_BoundingBox_0.Z .. v39(v42));
        end;
        l_v40_BoundingBox_0 = v16;
    end;
    if not (not v12() or v6.isBoundingBoxCFrameSane(v41)) then
        v4("(Avatar Experience) cframe = " .. v41.X .. ", " .. v41.Y .. ", " .. v41.Z .. v39(v42));
    end;
    local v45 = v44 / 2;
    local v46 = {
        Vector3.new(-v45.X, -v45.Y, -v45.Z), 
        Vector3.new(v45.X, -v45.Y, -v45.Z), 
        Vector3.new(v45.X, v45.Y, -v45.Z), 
        Vector3.new(-v45.X, v45.Y, -v45.Z), 
        Vector3.new(-v45.X, -v45.Y, v45.Z), 
        Vector3.new(v45.X, -v45.Y, v45.Z), 
        Vector3.new(v45.X, v45.Y, v45.Z), 
        (Vector3.new(-v45.X, v45.Y, v45.Z))
    };
    local l_huge_0 = math.huge;
    local l_huge_1 = math.huge;
    local v49 = -math.huge;
    local v50 = -math.huge;
    for v51 = 1, #v46 do
        local v52 = v41:PointToObjectSpace(l_v40_BoundingBox_0:PointToWorldSpace(v46[v51]));
        l_huge_0 = math.min(l_huge_0, v52.X);
        l_huge_1 = math.min(l_huge_1, v52.Y);
        v49 = math.max(v49, v52.X);
        v50 = math.max(v50, v52.Y);
        if v12() then
            if v49 < l_huge_0 then
                v4("(Avatar Experience) maxX = " .. v49 .. ", minX = " .. l_huge_0);
            end;
            if v50 < l_huge_1 then
                v4("(Avatar Experience) maxY = " .. v50 .. ", minY = " .. l_huge_1);
            end;
        end;
    end;
    return Vector2.new(v49 - l_huge_0, v50 - l_huge_1);
end;
local function _(v54)
    if v54 ~= v7.AvatarExperienceLandingPage and not v6.isAvatarBackground(v54) then
        return true;
    else
        return false;
    end;
end;
local v56 = {};
v56.__index = v56;
v56.calculateFocusPoint = function(v57)
    local v58 = v57.store:getState();
    local v59 = v57:useCenteredSceneView(v58, v57.avatarRoute);
    local v60 = v6.getCategoryInfoFromState(v58, v57.avatarRoute);
    local l_AvatarType_0 = v58.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_CurrentCharacter_0 = v58.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local l_DeviceOrientation_0 = v58.DeviceOrientation;
    local v64 = v8.AvatarTypeFocusGroups[l_AvatarType_0][v60.CameraFocus];
    local _ = nil;
    if not v64 or v59 then
        local v66 = v31(l_CurrentCharacter_0, {
            {
                Part = "HumanoidRootPart"
            }
        });
        local l_Y_0 = (l_CurrentCharacter_0:GetExtentsSize() * v17[l_DeviceOrientation_0].defaultVerticalFocusScale).Y;
        local l_Head_0 = l_CurrentCharacter_0:FindFirstChild("Head");
        if l_Head_0 then
            l_Y_0 = math.min(l_Head_0.Position.Y, l_Y_0);
        end;
        return (Vector3.new(v66.X, l_Y_0, v66.Z));
    else
        return (v31(l_CurrentCharacter_0, v64));
    end;
end;
v56.calculateBaseZoomRadius = function(v69, v70)
    local v71 = v69.store:getState();
    local v72 = v69:useCenteredSceneView(v71, v69.avatarRoute);
    local v73 = nil;
    local l_DeviceOrientation_1 = v71.DeviceOrientation;
    if not v72 then
        local l_name_0 = v69.avatarRoute.current.name;
        local v76 = v6.getCategoryInfoFromState(v71, v69.avatarRoute);
        local l_AvatarType_1 = v71.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v78 = l_name_0 == v7.AvatarExperienceLandingPage;
        local v79 = v8.AvatarTypeFocusGroups[l_AvatarType_1][v76.CameraFocus] or nil;
        local v80 = v71.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
        v73 = if not if not v80.isUnequipped then v80.itemSubType == v8.BundleTypeIdStrings.Animations else false then v76.CameraZoomRadius or 0 else v8.AnimationCategoryCameraZoomRadius;
        if not v79 then
            v73 = v73 + v70.Y * (not not v78 and v17[l_DeviceOrientation_1].landingPageZoomToFocusHeightRatio or v17[l_DeviceOrientation_1].zoomToFocusHeightRatio);
        end;
        return v73;
    else
        return (v71.AvatarExperience.AvatarScene.Character.CurrentCharacter:GetExtentsSize() * 0.5).Y * v17[l_DeviceOrientation_1].fullViewZoomToFocusHeightRatio;
    end;
end;
v56.calculateZoomRadius = function(v81)
    return v81.cachedBaseZoomRadius + v81.zoomOffset;
end;
v56.calculateCameraOrigin = function(v82, v83, v84)
    local v85 = v17[v82.store:getState().DeviceOrientation].baseCameraOrigin - v83;
    return v83 + Vector3.new(v85.x, 0, v85.z).Unit * v84;
end;
v56.calculateHalfFieldsOfView = function(v86)
    local l_ViewportSize_0 = v86.camera.ViewportSize;
    return math.atan((0.4663076581549986 * l_ViewportSize_0.X) / l_ViewportSize_0.Y), 0.4363323129985824;
end;
v56.useCenteredSceneView = function(_, v89, v90)
    return v90.opaque.name == v7.TryOnItem or v6.getIsSceneFullViewFromState(v89, v90);
end;
v56.getPeekViewHeight = function(v91)
    local l_ItemDetailsPeekView_0 = v91.store:getState().AvatarExperience.Common.ItemDetailsPeekView;
    if not (l_ItemDetailsPeekView_0.viewState == l_PeekViewState_0.Brief) or not l_ItemDetailsPeekView_0.briefViewHeight then
        return 0;
    else
        return l_ItemDetailsPeekView_0.briefViewHeight;
    end;
end;
v56.calculateCameraOffsetAngles = function(v93)
    local v94 = v93.store:getState();
    if not v93:useCenteredSceneView(v94, v93.avatarRoute) then
        local l_DeviceOrientation_2 = v94.DeviceOrientation;
        local v96 = (not not (v93.avatarRoute.current.name == v7.AvatarExperienceLandingPage) and v17[l_DeviceOrientation_2].landingPageCameraCenterScreenPosition or v17[l_DeviceOrientation_2].cameraCenterScreenPosition) - UDim2.new(0, 0, 0, 64 - v6.getTopBarHeightAvatarScene(v94));
        local v97, v98 = v93:calculateHalfFieldsOfView();
        local l_ViewportSize_1 = v93.camera.ViewportSize;
        return math.atan(math.tan(v97) * (v96.X.Scale + (2 * v96.X.Offset) / l_ViewportSize_1.X)), (math.atan(math.tan(v98) * (v96.Y.Scale + (2 * v96.Y.Offset) / l_ViewportSize_1.Y)));
    else
        return 0, 0;
    end;
end;
v56.pixelOffsetToPositionOffset = function(v100, v101)
    local v102, v103 = v100:calculateCameraOffsetAngles();
    local v104, v105 = v100:calculateHalfFieldsOfView();
    local l_cachedFocusPoint_0 = v100.cachedFocusPoint;
    local v107 = l_cachedFocusPoint_0 - v100:calculateCameraOrigin(l_cachedFocusPoint_0, (v100:calculateZoomRadius()));
    return (((v101 / v100.camera.ViewportSize) * Vector2.new(math.tan(v104), (math.tan(v105)))) * -(CFrame.new(Vector3.new(), v107) * CFrame.Angles(v103, v102, 0)):VectorToObjectSpace(v107).Z) * 2;
end;
v56.tweenCameraIntoPlace = function(v108, v109, v110, v111)
    local v112, v113 = v108:calculateCameraOffsetAngles();
    local v114 = CFrame.new(Vector3.new(), v110 - v109) * CFrame.Angles(v113, v112, 0);
    local l_panOffset_0 = v108.panOffset;
    local v116 = Vector3.new(0, 1, 0);
    local v117 = CFrame.new(v109 + (v114.LookVector:Cross(v116).Unit * l_panOffset_0.X + v116 * l_panOffset_0.Y)) * v114;
    v108:cancelTween();
    if not v111 then
        local v118 = {
            CFrame = v117
        };
        v108.isTweening = true;
        local v119 = l_TweenService_0:Create(v108.camera, v13, v118);
        v119.Completed:Connect(function()
            v108.isTweening = false;
            v108.tween = nil;
        end);
        v119:Play();
        v108.tween = v119;
        return ;
    else
        v108.camera.CFrame = v117;
        return ;
    end;
end;
v56.boundPanOffset = function(v120)
    local v121 = v120.store:getState();
    local l_CurrentCharacter_1 = v121.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_1 then
        local _, v124 = v120:calculateHalfFieldsOfView();
        local v125, v126 = v120:calculateCameraOffsetAngles();
        local l_cachedFocusPoint_1 = v120.cachedFocusPoint;
        local v128 = v120:calculateCameraOrigin(l_cachedFocusPoint_1, (v120:calculateZoomRadius()));
        local v129 = CFrame.new(v128) * (CFrame.new(Vector3.new(), l_cachedFocusPoint_1 - v128) * CFrame.Angles(v126, v125, 0));
        local v130 = -v120.camera.NearPlaneZ;
        local v131 = math.tan(v124) * v130;
        local v132 = (math.sin(v124 + v126) * math.sqrt(v131 * v131 + v130 * v130) - v128.Y) + 0.01;
        local v133 = v53(l_CurrentCharacter_1, v129, v121.AvatarExperience.AvatarEditor.Character.EquippedAssets) / 2;
        if v12() then
            if v133.X < 0 then
                v4("(Avatar Experience) characterHalf2DBoundingSize.X = " .. v133.X);
            end;
            if v133.Y < 0 then
                v4("(Avatar Experience) characterHalf2DBoundingSize.Y = " .. v133.Y);
            end;
        end;
        local l_panOffset_1 = v120.panOffset;
        v120.panOffset = Vector3.new(math.clamp(v120.panOffset.X, -v133.X, v133.X), math.clamp(v120.panOffset.Y, math.max(v132, -v133.Y), (math.max(v132, v133.Y))), v120.panOffset.Z);
        return l_panOffset_1 ~= v120.panOffset;
    else
        return ;
    end;
end;
v56.calculateZoomOffsetBounds = function(v135)
    local v136 = v17[v135.store:getState().DeviceOrientation];
    local l_cachedBaseZoomRadius_0 = v135.cachedBaseZoomRadius;
    return v136.minZoomRadius - l_cachedBaseZoomRadius_0, v136.maxZoomRadius - l_cachedBaseZoomRadius_0;
end;
v56.boundZoomOffset = function(v138, v139, v140)
    if not (v139 and v140) then
        local v141, v142 = v138:calculateZoomOffsetBounds();
        v139 = v141;
        v140 = v142;
    end;
    local l_zoomOffset_0 = v138.zoomOffset;
    v138.zoomOffset = math.clamp(v138.zoomOffset, v139, v140);
    return l_zoomOffset_0 ~= v138.zoomOffset;
end;
v56.handleCameraChange = function(v144, v145)
    if v144.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
        local l_cachedFocusPoint_2 = v144.cachedFocusPoint;
        v144:tweenCameraIntoPlace(v144:calculateCameraOrigin(l_cachedFocusPoint_2, (v144:calculateZoomRadius())), l_cachedFocusPoint_2, v145);
        return ;
    else
        return ;
    end;
end;
v56.panByDistance = function(v147, v148)
    v147.panOffset = Vector3.new(v147.panOffset.X + v148.X, v147.panOffset.Y + v148.Y, 0);
    v147:boundPanOffset();
    v147:handleCameraChange(true);
end;
v56.panByPixels = function(v149, v150)
    v149:panByDistance((v149:pixelOffsetToPositionOffset(v150)));
end;
v56.zoomStraight = function(v151, v152)
    v151.zoomOffset = v151.zoomOffset + v152;
    v151:boundZoomOffset();
    v151:handleCameraChange(true);
end;
v56.zoomToPoint = function(v153, v154, v155)
    local v156, v157 = v153:calculateCameraOffsetAngles();
    local l_cachedFocusPoint_3 = v153.cachedFocusPoint;
    local v159 = l_cachedFocusPoint_3 - v153:calculateCameraOrigin(l_cachedFocusPoint_3, (v153:calculateZoomRadius()));
    local v160 = CFrame.new(Vector3.new(), v159) * CFrame.Angles(v157, v156, 0);
    local v161 = v160:VectorToObjectSpace(v159);
    local v162 = (v155 - v153.camera.ViewportSize / 2) * Vector2.new(1, -1);
    local v163 = v153:pixelOffsetToPositionOffset(v162);
    local v164 = Vector3.new(v163.X, v163.Y, v161.Z) - v161;
    local v165, v166 = v153:calculateZoomOffsetBounds();
    v153.zoomOffset = v153.zoomOffset + v154;
    v153:boundZoomOffset(v165, v166);
    local v167 = v160:VectorToObjectSpace(l_cachedFocusPoint_3 - v153:calculateCameraOrigin(l_cachedFocusPoint_3, (v153:calculateZoomRadius())));
    local v168 = v153:pixelOffsetToPositionOffset(v162);
    v153.panOffset = (v153.panOffset + v164) - (Vector3.new(v168.X, v168.Y, v161.Z) - v167);
    v153:boundPanOffset();
    v153:handleCameraChange(true);
end;
v56.update = function(v169, v170, v171, v172, v173)
    local l_name_1 = v172.current.name;
    local l_name_2 = v173.current.name;
    local v176 = l_name_1 ~= v7.AvatarExperienceLandingPage and (not v6.isAvatarBackground(l_name_1) or false);
    local v177 = l_name_2 ~= v7.AvatarExperienceLandingPage and (not v6.isAvatarBackground(l_name_2) or false);
    local v178 = not v176 and v177;
    local v179 = v176 and not v177;
    if not v178 then
        if v179 and #v169.interactionConnections == 0 then
            v169:connectInteractionEvents();
        end;
    elseif #v169.interactionConnections > 0 then
        v169:disconnectInteractionEvents();
    end;
    local l_CurrentCharacter_2 = v170.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local v181 = v6.getCategoryInfoFromState(v170, v172);
    if l_CurrentCharacter_2 and v181 then
        local v182 = v169:useCenteredSceneView(v170, v172);
        local v183 = v169:useCenteredSceneView(v171, v173);
        local v184 = v6.getCategoryInfoFromState(v171, v173);
        local l_CharacterModelVersion_0 = v170.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
        local l_CharacterModelVersion_1 = v171.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
        local l_TryOnCharacterModelVersion_0 = v170.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion;
        local l_TryOnCharacterModelVersion_1 = v171.AvatarExperience.AvatarScene.Character.TryOnCharacterModelVersion;
        local v189 = true;
        if l_CharacterModelVersion_0 == l_CharacterModelVersion_1 then
            v189 = l_TryOnCharacterModelVersion_0 ~= l_TryOnCharacterModelVersion_1;
        end;
        local l_CurrentCharacter_3 = v171.AvatarExperience.AvatarScene.Character.CurrentCharacter;
        local v191 = v6.getTopBarHeightAvatarScene(v170);
        local v192 = v6.getTopBarHeightAvatarScene(v171);
        local v193 = v170.DeviceOrientation ~= v171.DeviceOrientation;
        local v194 = v170.ScreenSize ~= v171.ScreenSize;
        local v195 = not (v173.opaque.name == v7.TryOnItem) and v172.opaque.name == v7.TryOnItem;
        local v196 = v8.AvatarTypeFocusGroups[v170.AvatarExperience.AvatarEditor.Character.AvatarType][v181.CameraFocus];
        local v197 = v171.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId ~= v170.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
        local v198 = true;
        if v182 == v183 then
            v198 = v181 ~= v184;
        end;
        if v198 then
            v169.panOffset = Vector3.new();
            v169.zoomOffset = 0;
        end;
        local l_v197_0 = v197;
        if not l_v197_0 then
            l_v197_0 = v198;
            if not l_v197_0 then
                l_v197_0 = true;
                if l_CurrentCharacter_2 == l_CurrentCharacter_3 then
                    l_v197_0 = not v196 and v189;
                end;
            end;
        end;
        if l_v197_0 then
            local l_cachedFocusPoint_4 = v169.cachedFocusPoint;
            v169.cachedFocusPoint = v169:calculateFocusPoint();
            local l_cachedBaseZoomRadius_1 = v169.cachedBaseZoomRadius;
            v169.cachedBaseZoomRadius = v169:calculateBaseZoomRadius(v169.cachedFocusPoint);
            if not v198 then
                if v169.panOffset ~= Vector3.new() then
                    v169.panOffset = v169.panOffset - (v169.cachedFocusPoint - l_cachedFocusPoint_4);
                end;
                if v169.zoomOffset ~= 0 then
                    v169.zoomOffset = v169.zoomOffset - (v169.cachedBaseZoomRadius - l_cachedBaseZoomRadius_1);
                end;
            end;
        end;
        if ((l_v197_0 or v193) or v194) or v191 ~= v192 then
            v169:boundPanOffset();
            v169:boundZoomOffset();
            v169:handleCameraChange(v193 or v195);
        end;
        return ;
    else
        return ;
    end;
end;
v56.updateState = function(v202, v203, v204)
    local l_avatarRoute_0 = v202.avatarRoute;
    v202:update(v203, v204, l_avatarRoute_0, l_avatarRoute_0);
end;
v56.updateAvatarRoute = function(v206, v207, v208)
    v206.avatarRoute = v207;
    if v206.started then
        local v209 = v206.store:getState();
        v206:update(v209, v209, v207, v208);
    end;
end;
v56.connectInteractionEvents = function(v210)
    table.insert(v210.interactionConnections, v210.events.panByDistance:Connect(function(...)
        v210:panByDistance(...);
    end));
    table.insert(v210.interactionConnections, v210.events.panByPixels:Connect(function(...)
        v210:panByPixels(...);
    end));
    table.insert(v210.interactionConnections, v210.events.zoomStraight:Connect(function(...)
        v210:zoomStraight(...);
    end));
    table.insert(v210.interactionConnections, v210.events.zoomToPoint:Connect(function(...)
        v210:zoomToPoint(...);
    end));
end;
v56.disconnectInteractionEvents = function(v211)
    for _, v213 in v211.interactionConnections, nil, nil do
        v213:Disconnect();
    end;
    v211.interactionConnections = {};
end;
v56.new = function(v214, v215, v216)
    local v217 = {};
    setmetatable(v217, v56);
    v217.store = v214;
    v217.avatarRoute = v215;
    v217.events = v216;
    v217.updateConnection = nil;
    v217.interactionConnections = {};
    v217.camera = game.Workspace.CurrentCamera;
    v217.isTweening = false;
    v217.panOffset = Vector3.new();
    v217.zoomOffset = 0;
    v217.cachedFocusPoint = nil;
    v217.cachedBaseZoomRadius = nil;
    v217.started = false;
    return v217;
end;
v56.start = function(v218)
    if not v218.started then
        v218.started = true;
        v218.cachedFocusPoint = v218:calculateFocusPoint();
        v218.cachedBaseZoomRadius = v218:calculateBaseZoomRadius(v218.cachedFocusPoint);
        local v219 = v218.store:getState();
        local l_name_3 = v218.avatarRoute.current.name;
        if l_name_3 ~= v7.AvatarExperienceLandingPage and (not v6.isAvatarBackground(l_name_3) or false) then
            v218:connectInteractionEvents();
        end;
        v218.updateConnection = v218.store.changed:connect(function(...)
            v218:updateState(...);
        end);
        v218.camera.CameraType = Enum.CameraType.Scriptable;
        v218.camera.FieldOfView = 50;
        if v219.AvatarExperience.AvatarScene.Character.CurrentCharacter then
            v218.cachedBaseZoomRadius = v218:calculateBaseZoomRadius(v218.cachedFocusPoint);
            v218:handleCameraChange(true);
        end;
        return ;
    else
        return ;
    end;
end;
v56.cancelTween = function(v221)
    if v221.tween then
        v221.tween:Cancel();
        v221.tween = nil;
        v221.isTweening = false;
    end;
end;
v56.stop = function(v222)
    if v222.started then
        v222.started = false;
        v222:cancelTween();
        v222.updateConnection:disconnect();
        v222:disconnectInteractionEvents();
        return ;
    else
        return ;
    end;
end;
v56.onDestroy = function(_)
end;
return v56;
