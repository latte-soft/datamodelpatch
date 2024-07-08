local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v11 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v12 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v17 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.scene");
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAccessoryAdjustmentEnabled);
local function _(v19)
    local v20 = v19.UserInputType == Enum.UserInputType.Touch;
    local v21 = v19.UserInputType == Enum.UserInputType.MouseButton1;
    local v22 = v19.UserInputType == Enum.UserInputType.MouseButton2;
    return v20, v21 or v22, v21, v22;
end;
local function _(v24)
    if v18() and v24 == v15.AccessoryAdjustment then
        return true;
    else
        local v25 = true;
        if v24 ~= v15.AvatarEditor then
            v25 = true;
            if v24 ~= v15.Catalog then
                v25 = true;
                if v24 ~= v15.ProfilePictureEditorEmotes then
                    v25 = v24 == v15.CatalogSearch;
                end;
            end;
        end;
        return v25;
    end;
end;
local v27 = v6.PureComponent:extend("SharedInteractionFrame");
v27.validateProps = v9.interface({
    panByPixels = v9.callback, 
    rotateByPixels = v9.callback, 
    setAngularVelocityByPixels = v9.callback, 
    zoomToPoint = v9.callback, 
    Size = v9.optional(v9.UDim2), 
    Position = v9.optional(v9.UDim2), 
    ZIndex = v9.optional(v9.number), 
    fullView = v9.optional(v9.userdata), 
    setFullView = v9.callback, 
    analytics = v9.table
});
v27.disconnectEvents = function(v28)
    v28.inputChangedConnection:Disconnect();
    v28.inputEndedConnection:Disconnect();
    v28.renderSteppedConnection:Disconnect();
    v28.inputChangedConnection = nil;
    v28.inputEndedConnection = nil;
    v28.renderSteppedConnection = nil;
end;
v27.getActiveInput = function(v29, v30)
    local v31 = v30.UserInputType == Enum.UserInputType.Touch;
    local v32 = v30.UserInputType == Enum.UserInputType.MouseButton1 or v30.UserInputType == Enum.UserInputType.MouseButton2;
    local l_v31_0 = v31;
    local v34 = v30.UserInputType == Enum.UserInputType.MouseMovement or v32;
    if v34 or l_v31_0 then
        local v35 = nil;
        if not v34 then
            if l_v31_0 then
                v35 = v29.activeTouchInputs[v30];
            end;
            return v35;
        else
            return v29.activeMouseInput;
        end;
    else
        return ;
    end;
end;
v27.removeActivePointerInput = function(v36, v37, v38)
    if not v38 then
        v36.activeTouchInputs[v37] = nil;
        v36.numActiveTouchInputs = v36.numActiveTouchInputs - 1;
    elseif l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        return ;
    else
        v36.activeMouseInput = nil;
    end;
    v36.numActiveInputs = v36.numActiveInputs - 1;
    if v36.numActiveInputs == 0 then
        v36:disconnectEvents();
    end;
end;
v27.doubleTapToggleFullView = function(v39)
    local l_name_0 = v39.props.avatarRoute.opaque.name;
    local v41;
    if v18() and l_name_0 == v15.AccessoryAdjustment then
        v41 = true;
    else
        v41 = true;
        if l_name_0 ~= v15.AvatarEditor then
            v41 = true;
            if l_name_0 ~= v15.Catalog then
                v41 = true;
                if l_name_0 ~= v15.ProfilePictureEditorEmotes then
                    v41 = l_name_0 == v15.CatalogSearch;
                end;
            end;
        end;
    end;
    if v41 then
        v39.props.setFullView(v39.props.analytics, l_name_0, v39.props.fullView == v12.None and v12.SceneFullView or v12.None);
        return ;
    else
        return ;
    end;
end;
v27.handleDoubleTap = function(v42, v43, v44)
    if v42.lastPrimaryPointerInputBeganPosition then
        local v45 = v42.lastPrimaryPointerInputBeganPosition - v43.Position;
        local v46 = v44 - v42.lastPrimaryPointerInputBeganTime;
        if v45.Magnitude < 30 and v46 < 0.25 then
            v42:doubleTapToggleFullView();
        end;
    end;
    v42.lastPrimaryPointerInputBeganPosition = v43.Position;
    v42.lastPrimaryPointerInputBeganTime = v44;
end;
v27.addActivePointerInput = function(v47, v48, v49, v50)
    if not v47:getActiveInput(v48) then
        local v51 = {
            lastPosition = v48.Position, 
            lastTime = v50
        };
        if not v49 then
            v47.activeTouchInputs[v48] = v5.Dictionary.join(v51, {
                lastDeltaTime = 0, 
                lastDeltaPosition = Vector3.new(0, 0, 0)
            });
            v47.numActiveTouchInputs = v47.numActiveTouchInputs + 1;
        else
            v47.activeMouseInput = v51;
        end;
        v47.numActiveInputs = v47.numActiveInputs + 1;
        if v47.numActiveInputs == 1 then
            v47.props.setAngularVelocityByPixels(0);
            v47.inputChangedConnection = l_UserInputService_0.InputChanged:Connect(v47.onInputChanged);
            v47.inputEndedConnection = l_UserInputService_0.InputEnded:Connect(v47.onInputEnded);
            v47.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(v47.setInputNotChanged);
        end;
        return ;
    else
        return ;
    end;
end;
v27.init = function(v52)
    v52.inputChangedConnection = nil;
    v52.inputEndedConnection = nil;
    v52.frameRef = v6.createRef();
    v52.lastPinchDistance = 1;
    v52.lastPanTime = 0;
    v52.lastPrimaryPointerInputBeganTime = 0;
    v52.lastPrimaryPointerInputBeganPosition = nil;
    v52.activeTouchInputs = {};
    v52.numActiveTouchInputs = 0;
    v52.activeMouseInput = nil;
    v52.numActiveInputs = 0;
    v52.handleScroll = function(_, v54)
        if v54.UserInputType == Enum.UserInputType.MouseWheel then
            v52.props.zoomToPoint(-v54.Position.Z, l_UserInputService_0:GetMouseLocation());
        end;
    end;
    v52.setInputNotChanged = function(_)
        for _, v57 in v52.activeTouchInputs, nil, nil do
            v57.changedThisFrame = false;
        end;
    end;
    v52.onInputChanged = function(v58, _)
        local v60 = v58.UserInputType == Enum.UserInputType.MouseMovement;
        local v61 = v58.UserInputType == Enum.UserInputType.Touch;
        if v60 or v61 then
            local v62 = v52:getActiveInput(v58);
            if v62 then
                local v63 = tick();
                local v64 = v63 - v62.lastTime;
                local v65 = v58.Position - v62.lastPosition;
                local v66 = Vector2.new(v65.X, v65.Y) * Vector2.new(-1, 1);
                local v67 = l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
                local v68 = l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
                local v69 = v63 - v52.lastPanTime > 0.1;
                if not (not (v60 and v67 or v61 and v52.numActiveTouchInputs == 1) or not v69) then
                    v52.props.rotateByPixels(-v66.X);
                end;
                if v60 and v68 or v61 and v52.numActiveTouchInputs == 2 then
                    v52.props.panByPixels(v66 / v52.numActiveInputs);
                    v52.lastPanTime = v63;
                end;
                v62.lastPosition = v58.Position;
                v62.lastTime = v63;
                if v61 then
                    if not v62.changedThisFrame then
                        v62.lastDeltaPosition = v65;
                        v62.lastDeltaTime = v64;
                        v62.changedThisFrame = true;
                    else
                        v62.lastDeltaPosition = v65 + v62.lastDeltaPosition;
                        v62.lastDeltaTime = v64 + v62.lastDeltaTime;
                        return ;
                    end;
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v52.onInputEnded = function(v70, _)
        local v72 = v70.UserInputType == Enum.UserInputType.Touch;
        local v73 = v70.UserInputType == Enum.UserInputType.MouseButton1;
        local v74 = v73 or v70.UserInputType == Enum.UserInputType.MouseButton2;
        local l_v72_0 = v72;
        local l_v74_0 = v74;
        local l_v73_0 = v73;
        if l_v72_0 or l_v74_0 then
            v73 = v52:getActiveInput(v70);
            if v73 then
                local v78 = tick();
                v74 = v78 - v52.lastPanTime;
                local v79 = l_v72_0 and v73.changedThisFrame;
                local v80 = false;
                if v52.numActiveInputs == 1 then
                    v80 = v74 > 0.1;
                end;
                if not (not v79 and not l_v73_0 or not v80) then
                    local v81 = nil;
                    local v82 = nil;
                    if not l_v73_0 then
                        v81 = v73.lastDeltaPosition;
                        v82 = v73.lastDeltaTime;
                    else
                        v81 = v70.Position - v73.lastPosition;
                        v82 = v78 - v73.lastTime;
                    end;
                    v52.props.setAngularVelocityByPixels(v81.X / v82);
                end;
                v52:removeActivePointerInput(v70, l_v74_0);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v52.onInputBegan = function(v83, v84)
        v52.handleScroll(v83, v84);
        local v85 = v84.UserInputType == Enum.UserInputType.Touch;
        local v86 = v84.UserInputType == Enum.UserInputType.MouseButton1;
        local v87 = v86 or v84.UserInputType == Enum.UserInputType.MouseButton2;
        local l_v85_0 = v85;
        local l_v87_0 = v87;
        local l_v86_0 = v86;
        if l_v85_0 or l_v87_0 then
            v86 = l_v85_0 or l_v86_0;
            local v91 = tick();
            if v86 then
                v52:handleDoubleTap(v84, v91);
            end;
            v52:addActivePointerInput(v84, l_v87_0, v91);
            return ;
        else
            return ;
        end;
    end;
    v52.onTouchPinch = function(_, v93, _, _, v96)
        if v93[2] == nil then
            return ;
        elseif v96 == Enum.UserInputState.Begin then
            v52.lastPinchDistance = (v93[1] - v93[2]).Magnitude;
            return ;
        else
            local l_Magnitude_0 = (v93[1] - v93[2]).Magnitude;
            local v98 = l_Magnitude_0 - v52.lastPinchDistance;
            v52.lastPinchDistance = l_Magnitude_0;
            v52.props.zoomToPoint(v98 * -0.05, (v93[1] + v93[2]) / 2);
            return ;
        end;
    end;
end;
v27.willUnmount = function(v99)
    if v99.inputChangedConnection then
        v99:disconnectEvents();
    end;
end;
v27.shouldBeVisible = function(v100)
    local v101 = v13[v100.props.avatarRoute.current.name];
    if (not v101 or not v101.coversSceneWhenExpanded) or not v100.props.itemDetailsExpanded then
        return true;
    else
        return false;
    end;
end;
v27.render = function(v102)
    local v103 = v102:shouldBeVisible();
    v17:trace("SharedInteractionFrame visible: {}", v103);
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v102.props.Size or UDim2.new(1, 0, 1, 0), 
        Position = v102.props.Position, 
        ZIndex = v102.props.ZIndex, 
        Visible = v103, 
        Active = true, 
        [v6.Event.InputBegan] = v102.onInputBegan, 
        [v6.Event.InputChanged] = v102.handleScroll, 
        [v6.Event.TouchPinch] = v102.onTouchPinch, 
        [v6.Ref] = v102.frameRef
    }, v102.props[v6.Children]);
end;
return (v16((l_RoactServices_0.connect({
    analytics = v10
})((v7.connect(function(v104, v105)
    return {
        fullView = v14(v104, v105.avatarRoute.opaque.name), 
        itemDetailsExpanded = v104.AvatarExperience.Common.ItemDetailsExpanded
    };
end, function(v106)
    return {
        setFullView = function(v107, v108, v109)
            v106(v11(v107, v108, v109));
        end
    };
end)(v27))))));
