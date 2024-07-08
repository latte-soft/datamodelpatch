local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Packages.t);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetPeekabooLayoutDetails);
local v9 = require(l_CorePackages_0.UIBlox);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.SharedInteractionFrame);
local v12 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget);
local l_withStyle_0 = v9.Style.withStyle;
local v14 = v2.PureComponent:extend("PeekabooWidget");
v14.validateProps = v6.strictInterface({
    viewportYScale = v6.number, 
    viewportXScale = v6.number, 
    topMarginYScale = v6.number, 
    renderBottomContents = v6.callback, 
    renderMiddleContents = v6.callback, 
    panByPixels = v6.optional(v6.callback), 
    rotateByPixels = v6.optional(v6.callback), 
    setAngularVelocityByPixels = v6.optional(v6.callback), 
    zoomToPoint = v6.optional(v6.callback), 
    globalGuiInset = if not v12 then v6.strictInterface({
        left = v6.integer, 
        top = v6.integer, 
        right = v6.integer, 
        bottom = v6.integer
    }) else nil, 
    screenSize = if not v12 then v6.Vector2 else nil, 
    containerSize = if not v12 then nil else v6.Vector2, 
    setPeekabooLayoutDetails = v6.callback, 
    navigation = v6.table
});
v14.init = function(v15)
    v15:deriveDetailsFromProps(v15.props);
    v15.panByPixels = function(v16)
        if v15.props.panByPixels then
            v15.props.panByPixels(v16);
        end;
    end;
    v15.rotateByPixels = function(v17)
        if v15.props.rotateByPixels then
            v15.props.rotateByPixels(v17);
        end;
    end;
    v15.setAngularVelocityByPixels = function(v18)
        if v15.props.setAngularVelocityByPixels then
            v15.props.setAngularVelocityByPixels(v18);
        end;
    end;
    v15.zoomToPoint = function(v19, v20)
        if v15.props.zoomToPoint then
            v15.props.zoomToPoint(v19, v20);
        end;
    end;
end;
v14.postToRodux = function(v21)
    v21.props.setPeekabooLayoutDetails(v21.props.navigation.state.routeName, v21.safeAreaSize.Y.Offset, v21.topYPix, v21.viewportSizePix);
end;
v14.getFrameDetails = function(v22, v23)
    local v24 = v22.safeAreaSize.X.Offset * v23.viewportXScale;
    local v25 = v22.safeAreaSize.Y.Offset * v23.viewportYScale;
    if v24 < v25 then
        v22.viewportSizePix = math.floor(v24 + 0.5);
    else
        v22.viewportSizePix = math.floor(v25 + 0.5);
    end;
    v22.topYPix = math.floor(v22.safeAreaSize.Y.Offset * v23.topMarginYScale + 0.5);
    v22.sideXPix = math.floor((v22.safeAreaSize.X.Offset - v22.viewportSizePix) / 2 + 0.5);
end;
v14.deriveDetailsFromProps = function(v26, v27)
    local l_screenSize_0 = v27.screenSize;
    local l_globalGuiInset_0 = v27.globalGuiInset;
    local l_containerSize_0 = v27.containerSize;
    v26.safeAreaSize = if not v12 then l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0) else UDim2.fromOffset(l_containerSize_0.X, l_containerSize_0.Y);
    v26:getFrameDetails(v27);
    v26:postToRodux();
end;
v14.willUpdate = function(v31, v32, _)
    v31:deriveDetailsFromProps(v32);
end;
v14.renderWithProviders = function(v34, v35)
    local l_Theme_0 = v35.Theme;
    return v2.createFragment({
        TopFrame = v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = 0, 
            Size = UDim2.new(1, 0, 0, v34.topYPix), 
            Position = UDim2.fromOffset(0, 0)
        }), 
        LeftMiddleFrame = v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = 0, 
            Size = UDim2.new(0, v34.sideXPix, 0, v34.viewportSizePix), 
            Position = UDim2.fromOffset(0, v34.topYPix)
        }), 
        MiddleFrame = v2.createElement(v11, {
            ZIndex = -1, 
            Size = UDim2.new(0, v34.viewportSizePix, 0, v34.viewportSizePix), 
            Position = UDim2.fromOffset(v34.sideXPix, v34.topYPix), 
            panByPixels = v34.panByPixels, 
            rotateByPixels = v34.rotateByPixels, 
            setAngularVelocityByPixels = v34.setAngularVelocityByPixels, 
            zoomToPoint = v34.zoomToPoint
        }, {
            Contents = v34.props.renderMiddleContents()
        }), 
        RightMiddleFrame = v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = 0, 
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, (v34.safeAreaSize.X.Offset - v34.sideXPix) - v34.viewportSizePix, 0, v34.viewportSizePix), 
            Position = UDim2.new(1, 0, 0, v34.topYPix)
        }), 
        BottomFrame = v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0, 1), 
            Size = UDim2.new(1, 0, 0, (v34.safeAreaSize.Y.Offset - v34.topYPix) - v34.viewportSizePix), 
            Position = UDim2.fromScale(0, 1)
        }, {
            Contents = v34.props.renderBottomContents()
        })
    });
end;
v14.render = function(v37)
    return l_withStyle_0(function(v38)
        return v37:renderWithProviders(v38);
    end);
end;
v14 = l_withNavigation_0(v4.connect(not v12 and function(v39, _)
    return {
        globalGuiInset = v39.GlobalGuiInset, 
        screenSize = v39.ScreenSize
    };
end or nil, function(v41)
    return {
        setPeekabooLayoutDetails = function(v42, v43, v44, v45)
            v41(v8(v42, v43, v44, v45));
        end
    };
end)(v14), nil);
return if not v12 then v14 else function(v46)
    local v47, v48 = v3.useState(Vector2.zero);
    local v49 = v3.useRef(nil);
    local v51 = v3.useCallback(function(v50)
        v48(v50.AbsoluteSize);
    end, {});
    v3.useLayoutEffect(function()
        v51(v49.current);
    end, {
        v51
    });
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v49, 
        [v3.Change.AbsoluteSize] = v51
    }, {
        PeekabooWidget = v3.createElement(v14, v5.Dictionary.join(v46, {
            containerSize = v47
        }))
    });
end;
