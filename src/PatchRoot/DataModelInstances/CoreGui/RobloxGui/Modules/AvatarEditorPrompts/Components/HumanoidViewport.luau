local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Promise);
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local l_EmptyState_0 = v5.App.Indicator.EmptyState;
local v9 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v10 = CFrame.fromEulerAnglesXYZ(0.3490658503988659, 0.2617993877991494, 0.6981317007977318);
local v11 = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000);
local v12 = v3.PureComponent:extend("HumanoidViewport");
v12.validateProps = v4.strictInterface({
    humanoidDescription = v4.optional(v4.instanceOf("HumanoidDescription")), 
    loadingFailed = v4.boolean, 
    retryLoadDescription = v4.callback, 
    rigType = v4.optional(v4.enum(Enum.HumanoidRigType))
});
v12.init = function(v13)
    v13:setState({
        loading = true, 
        loadingFailed = false
    });
    v13.cameraRef = v3.createRef();
    v13.worldModelRef = v3.createRef();
    local v14, v15 = v3.createBinding(CFrame.new());
    v13.cameraCFrameBinding = v14;
    v13.updateCameraCFrameBinding = v15;
    v14, v15 = v3.createBinding(CFrame.new());
    v13.cameraFocusBinding = v14;
    v13.updateCameraFocusBinding = v15;
    v13.humanoidModel = nil;
    v13.mounted = false;
    v13.onRetryLoading = function()
        v13:setState({
            loading = true, 
            loadingFailed = false
        });
        if not v13.props.humanoidDescription then
            v13.props.retryLoadDescription();
            return ;
        else
            v13:loadHumanoidModel();
            return ;
        end;
    end;
end;
local function v18(v16)
    local l_v16_0 = v16;
    return (CFrame.new(Vector3.new(0, 0, 0), if math.abs(l_v16_0.Y) > 0.95 then Vector3.new(0, 0, -1) else Vector3.new(l_v16_0.X, 0, l_v16_0.Z).unit) * v10).lookVector;
end;
local function _(v19, v20)
    return (math.max(v20.X, v20.Y) / 2) * (1 / math.tan(math.rad(v19) / 2)) + v20.Z / 2;
end;
local function _(v22, v23, v24)
    local l_p_0 = v22:GetModelCFrame().p;
    local l_v22_ExtentsSize_0 = v22:GetExtentsSize();
    return ((v24 - v24.p) + l_p_0) + v23 * (((math.max(l_v22_ExtentsSize_0.X, l_v22_ExtentsSize_0.Y) / 2) * 1.4281480067421146 + l_v22_ExtentsSize_0.Z / 2) * 1);
end;
v12.positionCamera = function(v28)
    local l_humanoidModel_0 = v28.humanoidModel;
    local l_l_humanoidModel_0_ModelCFrame_0 = l_humanoidModel_0:GetModelCFrame();
    local l_lookVector_0 = l_l_humanoidModel_0_ModelCFrame_0.lookVector;
    local l_HumanoidRootPart_0 = l_humanoidModel_0:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        l_lookVector_0 = l_HumanoidRootPart_0.CFrame.lookVector;
    end;
    l_lookVector_0 = v18(l_lookVector_0);
    local v33 = CFrame.new(l_l_humanoidModel_0_ModelCFrame_0.p + l_lookVector_0 * 5, l_l_humanoidModel_0_ModelCFrame_0.p);
    local l_l_lookVector_0_0 = l_lookVector_0;
    local l_v33_0 = v33;
    local l_p_1 = l_humanoidModel_0:GetModelCFrame().p;
    local l_l_humanoidModel_0_ExtentsSize_0 = l_humanoidModel_0:GetExtentsSize();
    v28.updateCameraCFrameBinding(((l_v33_0 - l_v33_0.p) + l_p_1) + l_l_lookVector_0_0 * (((math.max(l_l_humanoidModel_0_ExtentsSize_0.X, l_l_humanoidModel_0_ExtentsSize_0.Y) / 2) * 1.4281480067421146 + l_l_humanoidModel_0_ExtentsSize_0.Z / 2) * 1));
    v28.updateCameraFocusBinding(l_l_humanoidModel_0_ModelCFrame_0);
end;
v12.loadIdleAnimation = function(_, v39)
    local l_Humanoid_0 = v39:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0.HumanoidDescription.IdleAnimation == 0 then
        return ;
    else
        local l_Animate_0 = v39:FindFirstChild("Animate");
        if l_Animate_0 then
            local l_idle_0 = l_Animate_0:FindFirstChild("idle");
            if l_idle_0 then
                local l_Animation_0 = l_idle_0:FindFirstChildOfClass("Animation");
                if l_Animation_0 then
                    local v44 = l_Humanoid_0:LoadAnimation(l_Animation_0);
                    v44.Looped = true;
                    v44:Play();
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v12.loadHumanoidModel = function(v45)
    local l_humanoidDescription_0 = v45.props.humanoidDescription;
    local l_rigType_0 = v45.props.rigType;
    coroutine.wrap(function()
        local v48 = nil;
        pcall(function()
            v48 = l_Players_0:CreateHumanoidModelFromDescription(l_humanoidDescription_0, l_rigType_0);
        end);
        if v45.mounted then
            if v45.props.humanoidDescription ~= l_humanoidDescription_0 then
                return ;
            elseif v45.props.rigType ~= l_rigType_0 then
                return ;
            elseif v48 == nil then
                v45:setState({
                    loadingFailed = true
                });
                return ;
            else
                v45.humanoidModel = v48;
                if v45.worldModelRef:getValue() then
                    v45.humanoidModel.Parent = v45.worldModelRef:getValue();
                end;
                if #l_humanoidDescription_0:GetAccessories(false) > 0 then
                    v6.race({
                        v6.fromEvent(v48.Humanoid.ClusterCompositionFinished), 
                        v6.delay(v11 * 0.001)
                    }):await();
                end;
                if v45.mounted then
                    v45:positionCamera();
                    v45:loadIdleAnimation(v48);
                    v45:setState({
                        loading = false, 
                        loadingFailed = false
                    });
                    return ;
                else
                    return ;
                end;
            end;
        else
            return ;
        end;
    end)();
end;
v12.render = function(v49)
    local v50 = v49.props.loadingFailed or v49.state.loadingFailed;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        AspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ShimmerFrame = (not v50 and v49.state.loading) and v3.createElement(l_ShimmerPanel_0, {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }), 
        LoadingFailed = v50 and v3.createElement(l_EmptyState_0, {
            text = v9:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"), 
            size = UDim2.fromScale(1, 1), 
            onActivated = v49.onRetryLoading
        }), 
        ViewportFrame = v3.createElement("ViewportFrame", {
            Visible = not (v50 or v49.state.loading), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = Color3.fromRGB(240, 240, 240), 
            Ambient = Color3.fromRGB(240, 240, 240), 
            CurrentCamera = v49.cameraRef
        }, {
            Camera = v3.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 70, 
                CFrame = v49.cameraCFrameBinding, 
                Focus = v49.cameraFocusBinding, 
                [v3.Ref] = v49.cameraRef
            }), 
            WorldModel = v3.createElement("WorldModel", {
                [v3.Ref] = v49.worldModelRef
            })
        })
    });
end;
v12.didMount = function(v51)
    v51.mounted = true;
    if v51.props.humanoidDescription then
        v51:loadHumanoidModel();
    end;
end;
v12.didUpdate = function(v52, v53)
    if not (not v52.worldModelRef:getValue() or not v52.humanoidModel) then
        v52.humanoidModel.Parent = v52.worldModelRef:getValue();
    end;
    local v54 = v52.props.humanoidDescription ~= v53.humanoidDescription;
    local v55 = v52.props.rigType ~= v53.rigType;
    local v56 = false;
    if v52.props.rigType ~= nil then
        v56 = false;
        if v52.props.humanoidDescription ~= nil then
            v56 = v54 or v55;
        end;
    end;
    if v56 then
        v52:setState({
            loading = true
        });
        if v52.props.humanoidDescription ~= nil then
            v52:loadHumanoidModel();
        end;
    end;
end;
v12.willUnmount = function(v57)
    v57.mounted = false;
end;
return v12;
