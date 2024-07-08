local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v6 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ShimmerPanel_0 = v3.App.Loading.ShimmerPanel;
local v9 = require(script.Parent.Parent.Parent.Constants);
local l_CharacterUtility_0 = require(l_CorePackages_0.Thumbnailing).CharacterUtility;
local l_CameraUtility_0 = require(l_CorePackages_0.Thumbnailing).CameraUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Thumbnailing).CFrameUtility;
local l_EmoteUtility_0 = require(l_CorePackages_0.Thumbnailing).EmoteUtility;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local v16 = l_Images_0["icons/actions/previewExpand"];
local v17 = l_Images_0["component_assets/dropshadow_25"];
local v18 = UDim2.new(0.4, 50, 0.15, 10);
local v19 = UDim2.new(0.5, 0, 1, 0);
local v20 = v2.PureComponent:extend("ObjectViewport");
v20.validateProps = v6.strictInterface({
    model = v6.optional(v6.instanceOf("Model")), 
    fieldOfView = v6.optional(v6.number), 
    isLoading = v6.optional(v6.boolean), 
    useFullBodyCameraSettings = v6.optional(v6.boolean), 
    openPreviewView = v6.optional(v6.callback), 
    LayoutOrder = v6.optional(v6.number)
});
v20.createCamera = function(v21)
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.CameraType = Enum.CameraType.Scriptable;
    l_Camera_0.Parent = v21.worldModelRef:getValue();
    return l_Camera_0;
end;
v20.init = function(v23)
    v23.worldModelRef = v2.createRef();
    local v24, v25 = v2.createBinding(nil);
    v23.camera = v24;
    v23.updateCamera = v25;
    v23.isMounted = false;
end;
v20.setupViewport = function(v26)
    local v27 = v26.props.model:Clone();
    assert(v27.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera");
    v27.Parent = v26.worldModelRef:getValue();
    v27:MoveTo((Vector3.new(0, 0, 0)));
    local l_useFullBodyCameraSettings_0 = v26.props.useFullBodyCameraSettings;
    if l_useFullBodyCameraSettings_0 then
        l_EmoteUtility_0.SetPlayerCharacterPoseWithMoodFallback(v27);
        l_RunService_0.PostSimulation:Wait();
        if not v26.isMounted then
            return ;
        end;
    end;
    local v29 = v26:createCamera();
    local v30 = nil;
    if not l_useFullBodyCameraSettings_0 then
        v30 = v27.PrimaryPart.CFrame;
    else
        local v31 = l_CFrameUtility_0.CalculateTargetCFrame(v27.Head.CFrame);
        v30 = (v31 - v31.Position) + v27.PrimaryPart.CFrame.Position;
    end;
    local v32, v33 = l_CharacterUtility_0.CalculateModelExtents(v27, v30);
    local v34 = {
        optFieldOfView = not v26.props.fieldOfView and 30 or v26.props.fieldOfView, 
        targetCFrame = v30, 
        minExtent = v32, 
        maxExtent = v33, 
        extentScale = 1
    };
    if not l_useFullBodyCameraSettings_0 then
        v34.optCameraYRot = 25;
    else
        v34.optCameraXRot = l_CameraUtility_0.XRotForFullBody;
        v34.optCameraDistanceScale = l_CameraUtility_0.DistanceScaleForFullBody;
        v34.extentScale = l_CameraUtility_0.DefaultBodyMarginScale;
    end;
    l_CameraUtility_0.SetupCamera(v29, v34);
    v26.updateCamera(v29);
end;
v20.didMount = function(v35)
    v35.isMounted = true;
    task.spawn(function()
        if not v35.props.isLoading then
            v35:setupViewport();
        end;
    end);
end;
v20.didUpdate = function(v36, v37)
    if v37.isLoading and not v36.props.isLoading then
        task.spawn(function()
            v36:setupViewport();
        end);
    end;
end;
v20.render = function(v38)
    return l_withStyle_0(function(v39)
        local l_Theme_0 = v39.Theme;
        if v38.props.isLoading then
            return v2.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, v9.PromptSidePadding * 2, 0, 240), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = v38.props.LayoutOrder
            });
        else
            return v2.createElement("Frame", {
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                BackgroundTransparency = 0, 
                Size = UDim2.new(1, v9.PromptSidePadding * 2, 0, 240), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = v38.props.LayoutOrder
            }, {
                ViewportFrame = v2.createElement("ViewportFrame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    LightColor = v9.ViewportLightColor, 
                    Ambient = v9.ViewportLightAmbient, 
                    LightDirection = v9.ViewportLightDirection, 
                    CurrentCamera = v38.camera
                }, {
                    WorldModel = v2.createElement("WorldModel", {
                        [v2.Ref] = v38.worldModelRef
                    })
                }), 
                ExpandPreviewButton = v38.props.openPreviewView and v2.createElement(l_IconButton_0, {
                    position = UDim2.new(1, -v9.PromptSidePadding, 1, 0), 
                    anchorPoint = Vector2.new(1, 1), 
                    icon = v16, 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v38.props.openPreviewView
                }), 
                Gradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Theme_0.BackgroundMuted.Color), 
                        ColorSequenceKeypoint.new(1, l_Theme_0.BackgroundMuted.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.7, 0.75), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                }), 
                DropShadow = v2.createElement(l_ImageSetLabel_0, {
                    Position = v19, 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Image = v17, 
                    BackgroundTransparency = 1, 
                    ImageTransparency = 0.5, 
                    Size = v18, 
                    ZIndex = 0
                })
            });
        end;
    end);
end;
v20.willUnmount = function(v41)
    v41.isMounted = false;
end;
return v20;
