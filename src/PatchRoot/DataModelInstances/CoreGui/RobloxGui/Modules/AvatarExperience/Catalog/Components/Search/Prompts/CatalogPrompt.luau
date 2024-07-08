local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v11 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v11.Style.withStyle;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v11.App.Dialog.Modal.PartialPageModal;
local v15 = v3.PureComponent:extend("CatalogPrompt");
v15.init = function(v16)
    v16.state = {
        apply = false
    };
    v16.buttonStackRef = v3.createRef();
end;
v15.validateProps = v6.strictInterface({
    title = v6.string, 
    onApply = v6.callback, 
    contentPadding = v6.optional(v6.UDim), 
    [v3.Children] = v6.table, 
    secondaryButtonProps = v6.optional(v6.table), 
    forwardRef = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    disablePrimaryButton = v6.optional(v6.boolean), 
    overlayFocusController = v6.optional(v6.table), 
    isPortrait = v6.boolean, 
    screenSize = v6.Vector2, 
    navigation = v6.table
});
v15.defaultProps = {
    contentPadding = UDim.new(0, 0), 
    disablePrimaryButton = false
};
v15.onClose = function(v17, v18)
    if v18 then
        v17.props.onApply();
    end;
    v10.closeOverlay(v17.props.navigation);
end;
v15.render = function(v19)
    return l_withStyle_0(function(_)
        return l_withLocalization_0({
            apply = "CommonUI.Messages.Action.Apply"
        })(function(v21)
            local v22 = nil;
            local v23 = nil;
            if not v19.props.isPortrait then
                v22 = UDim2.new(0.5, 0, 0.5, 0);
                v23 = Vector2.new(0.5, 0.5);
            else
                v22 = UDim2.new(0.5, 0, 1, 0);
                v23 = Vector2.new(0.5, 1);
            end;
            local v24 = {};
            if v19.props.secondaryButtonProps then
                table.insert(v24, v19.props.secondaryButtonProps);
            end;
            table.insert(v24, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    isDisabled = v19.props.disablePrimaryButton, 
                    onActivated = function()
                        v19:onClose(true);
                    end, 
                    text = v21.apply
                }
            });
            return v3.createElement(l_Focusable_0.Frame, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                [v3.Ref] = v19.props.forwardRef, 
                defaultChild = v19.buttonStackRef
            }, {
                PartialPageModal = v3.createElement(l_PartialPageModal_0, {
                    title = v19.props.title, 
                    screenSize = v19.props.screenSize, 
                    position = v22, 
                    anchorPoint = v23, 
                    contentPadding = v19.props.contentPadding, 
                    buttonStackProps = {
                        buttons = v24, 
                        frameRef = v19.buttonStackRef, 
                        NextSelectionUp = v19.props.NextSelectionUp
                    }, 
                    onCloseClicked = function()
                        v19:onClose();
                    end
                }, v19.props[v3.Children])
            });
        end);
    end);
end;
v15 = l_withNavigation_0((v5.connect(function(v25)
    return {
        isPortrait = v25.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        screenSize = v25.ScreenSize
    };
end, nil)(v15)));
return v3.forwardRef(function(v26, v27)
    return v3.createElement(v15, v2.Dictionary.join(v26, {
        forwardRef = v27
    }));
end);
