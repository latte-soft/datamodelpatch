local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.RoactRodux);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Images_0 = v7.App.ImageSet.Images;
local l_LoadableImage_0 = v7.App.Loading.LoadableImage;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.PageButton);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_LoadingSpinner_0 = v7.App.Loading.LoadingSpinner;
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v16.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v16.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_AvatarThumbnailRequests_0 = v16.Utils.AvatarThumbnailRequests;
local v20 = require(l_CorePackages_0.Packages.t);
local v21 = nil;
local v22 = nil;
assert(l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON ~= nil, "AvatarThumbnailRequests.CUSTOMIZE_BUTTON should exist. Silence type checker.");
assert(l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON[1] ~= nil, "AvatarThumbnailRequests.CUSTOMIZE_BUTTON[1] should exist. Silence type checker.");
local v23 = l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON[1];
v21 = l_Constants_0.RbxThumbnailSizeToNumberSize[v23.thumbnailSize];
v22 = l_Constants_0.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v23.thumbnailType];
local v24 = l_Images_0["icons/menu/customize_large"];
local v25 = v5.PureComponent:extend("AvatarPageButton");
v25.validateProps = v20.strictInterface({
    transparencyModifier = v20.number, 
    NextSelectionLeft = v20.optional(v20.table), 
    NextSelectionRight = v20.optional(v20.table), 
    NextSelectionUp = v20.optional(v20.table), 
    NextSelectionDown = v20.optional(v20.table), 
    onActivated = v20.callback, 
    forwardRef = v20.optional(v20.table), 
    localUserId = v20.string
});
v25.defaultProps = {
    transparencyModifier = 0
};
v25.init = function(v26)
    v26.state = {
        style = string.lower(l_NotificationService_0.SelectedTheme)
    };
    v26.getLoadingImage = function(v27)
        return v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }, (v4.Dictionary.join(v27 or {}, {
            LoadingSpinner = v5.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromScale(0.7, 0.7), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            }), 
            AspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1, 
                AspectType = Enum.AspectType.ScaleWithParentSize
            })
        })));
    end;
    v26.getThumbnail = function(v28, v29, v30, v31, v32, _)
        if not (v26.props.localUserId ~= nil) or v26.props.localUserId == "" then
            return nil;
        else
            return v5.createElement(l_LoadableImage_0, {
                Position = v28, 
                Size = v29, 
                BackgroundTransparency = 1, 
                Image = l_getRbxthumbWithTypeSizeAndOptions_0(v26.props.localUserId, v22, v21), 
                useShimmerAnimationWhileLoading = false, 
                renderOnLoading = v26.getLoadingImage, 
                ZIndex = v32, 
                cornerRadius = UDim.new(0, v15.PageButtonCornerRadius), 
                ImageRectOffset = v30, 
                ImageRectSize = v31, 
                shouldHandleReloads = true
            });
        end;
    end;
end;
v25.render = function(v34)
    local l_style_0 = v34.state.style;
    local l_transparencyModifier_0 = v34.props.transparencyModifier;
    local l_NextSelectionLeft_0 = v34.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v34.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v34.props.NextSelectionUp;
    local l_NextSelectionDown_0 = v34.props.NextSelectionDown;
    local v41 = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png";
    if l_style_0 == "dark" then
        v41 = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png";
    end;
    local l_forwardRef_0 = v34.props.forwardRef;
    return l_withLocalization_0({
        avatarEditorText = "Feature.Catalog.Action.Customize"
    })(function(v43)
        return v5.createElement(v12, {
            Size = UDim2.new(1, 0, 1, 0), 
            backgroundImage = v41, 
            getThumbnail = v34.getThumbnail, 
            thumbnailSize = v21, 
            thumbnailZoom = 2, 
            thumbnailImageYInsetScale = 0.05, 
            icon = v24, 
            text = v43.avatarEditorText, 
            transparencyModifier = l_transparencyModifier_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            NextSelectionDown = l_NextSelectionDown_0, 
            [v5.Ref] = l_forwardRef_0, 
            onActivated = v34.props.onActivated
        });
    end);
end;
v25.didMount = function(v44)
    v44.themeChangedConn = l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
        v44:setState({
            style = string.lower(l_NotificationService_0.SelectedTheme)
        });
    end);
end;
v25.willUnmount = function(v45)
    if v45.themeChangedConn then
        v45.themeChangedConn:Disconnect();
        v45.themeChangedConn = nil;
    end;
end;
v25 = v8.connect(function(v46)
    return {
        localUserId = v46.LocalUserId
    };
end)(v25);
return v5.forwardRef(function(v47, v48)
    return v5.createElement(v25, v4.Dictionary.join(v47, {
        forwardRef = v48
    }));
end);
