local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_CorePackages_0.Roact);
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.PageButton);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.ThumbnailSide);
local v11 = l_Images_0["icons/menu/profilepicture_large"];
local v12 = Vector2.new(40, 0);
local v13 = Vector2.new(0, 0);
local v14 = Vector2.new(382 - v12.X, 340);
local v15 = Vector2.new(228 - v13.X, 360);
local v16 = v7.PureComponent:extend("ProfilePictureEditorPageButton");
v16.validateProps = v4.strictInterface({
    transparencyModifier = v4.number, 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    onActivated = v4.callback, 
    forwardRef = v4.optional(v4.table)
});
v16.defaultProps = {
    transparencyModifier = 0
};
v16.init = function(v17)
    v17:setState({
        style = string.lower(l_NotificationService_0.SelectedTheme)
    });
end;
v16.render = function(v18)
    return l_withLocalization_0({
        ppeButtonText = "Feature.Avatar.Action.EditProfilePicture"
    })(function(v19)
        return v18:renderWithProviders(v19);
    end);
end;
v16.renderWithProviders = function(v20, v21)
    local l_transparencyModifier_0 = v20.props.transparencyModifier;
    local l_NextSelectionLeft_0 = v20.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v20.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v20.props.NextSelectionUp;
    local l_NextSelectionDown_0 = v20.props.NextSelectionDown;
    local l_forwardRef_0 = v20.props.forwardRef;
    local l_style_0 = v20.state.style;
    local v29 = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png";
    if l_style_0 == "dark" then
        v29 = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png";
    end;
    return v7.createElement(v9, {
        Size = UDim2.new(1, 0, 1, 0), 
        backgroundImage = v29, 
        icon = v11, 
        text = v21.ppeButtonText, 
        transparencyModifier = l_transparencyModifier_0, 
        ignoreThumbnail = true, 
        iconBeforeText = true, 
        NextSelectionLeft = l_NextSelectionLeft_0, 
        NextSelectionRight = l_NextSelectionRight_0, 
        NextSelectionUp = l_NextSelectionUp_0, 
        NextSelectionDown = l_NextSelectionDown_0, 
        [v7.Ref] = l_forwardRef_0, 
        extraThumbnails = {
            {
                side = v10.Left, 
                image = "rbxasset://textures/ui/AvatarExperience/Avatar1_PPEButton.png", 
                imageRectSize = v14, 
                imageRectOffset = v12, 
                paddingTopScale = 0.04, 
                paddingBottomScale = 0, 
                paddingSideScale = 0.02
            }, 
            {
                side = v10.Right, 
                image = "rbxasset://textures/ui/AvatarExperience/Avatar2_PPEButton.png", 
                imageRectSize = v15, 
                imageRectOffset = v13, 
                paddingTopScale = 0.04, 
                paddingBottomScale = 0, 
                paddingSideScale = 0.04
            }
        }, 
        onActivated = v20.props.onActivated
    });
end;
v16.didMount = function(v30)
    v30.themeChangedConn = l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
        v30:setState({
            style = string.lower(l_NotificationService_0.SelectedTheme)
        });
    end);
end;
v16.willUnmount = function(v31)
    if v31.themeChangedConn then
        v31.themeChangedConn:Disconnect();
        v31.themeChangedConn = nil;
    end;
end;
return v7.forwardRef(function(v32, v33)
    return v7.createElement(v16, v3.Dictionary.join(v32, {
        forwardRef = v33
    }));
end);
