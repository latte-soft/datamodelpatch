local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.FitFrame);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v9.Focusable;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_withStyle_0 = v7.Style.withStyle;
local l_getPageMargin_0 = v7.App.Container.getPageMargin;
local l_Images_0 = v7.App.ImageSet.Images;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_FitTextLabel_0 = v8.FitTextLabel;
local v20 = l_Images_0["icons/actions/edit/edit"];
local v21 = l_Images_0["icons/actions/edit/delete"];
local v22 = v3.PureComponent:extend("ManageActionBar");
v22.validateProps = v5.strictInterface({
    gradientFade = v5.optional(v5.boolean), 
    multiSelect = v5.optional(v5.boolean), 
    selectedOutfits = v5.array(v5.string), 
    deleteOutfit = v5.callback, 
    renameOutfit = v5.callback, 
    bottomPadding = v5.optional(v5.number), 
    ZIndex = v5.integer, 
    NextSelectionUp = v5.optional(v5.table), 
    forwardRef = v5.optional(v5.table), 
    showCustomOutfitNames = v5.boolean, 
    isPortrait = v5.boolean
});
v22.defaultProps = {
    gradientFade = false, 
    multiSelect = false
};
v22.init = function(v23)
    v23.renameButtonRef = v3.createRef();
    v23.deleteButtonRef = v3.createRef();
    local v24, v25 = v3.createBinding(UDim.new(0, 24));
    v23.marginBinding = v24;
    v23.updateMarginBinding = v25;
    v23.absoluteSizeChanged = function(v26)
        v23.updateMarginBinding(UDim.new(0, (l_getPageMargin_0(v26.AbsoluteSize.X))));
    end;
end;
v22.renderBarItems = function(v27, v28, v29, _)
    local v31 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = v27.marginBinding, 
            PaddingRight = v27.marginBinding
        })
    };
    local l_Theme_0 = v29.Theme;
    if v27.props.gradientFade then
        v31.UIGradient = v3.createElement("UIGradient", {
            Rotation = 270, 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(0.8, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(1, 1)
            })
        });
    end;
    if not v27.props.multiSelect then
        if v27.props.showCustomOutfitNames then
            v31.RenameButton = v3.createElement(l_IconButton_0, {
                anchorPoint = Vector2.new(0, 0.5), 
                position = UDim2.fromScale(0, 0.5), 
                size = UDim2.new(0, 44, 1, 0), 
                icon = v20, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                onActivated = v27.props.renameOutfit, 
                buttonRef = v27.renameButtonRef, 
                NextSelectionRight = v27.deleteButtonRef
            });
        end;
    else
        local l_Font_0 = v29.Font.Header2.Font;
        local v34 = v29.Font.BaseSize * v29.Font.Header2.RelativeSize;
        local l_selectItem_0 = v28.selectItem;
        if #v27.props.selectedOutfits > 0 then
            l_selectItem_0 = v28.countSelected;
        end;
        v31.SelectedCountTextLabel = v3.createElement(l_FitTextLabel_0, {
            width = l_FitTextLabel_0.Width.FitToText, 
            BackgroundTransparency = 1, 
            Text = l_selectItem_0, 
            Font = l_Font_0, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            TextColor3 = v29.Theme.TextEmphasis.Color, 
            TextSize = v34
        });
    end;
    local v36 = #v27.props.selectedOutfits > 0;
    v31.DeleteButton = v3.createElement(l_IconButton_0, {
        anchorPoint = Vector2.new(1, 0.5), 
        position = UDim2.fromScale(1, 0.5), 
        size = UDim2.new(0, 44, 1, 0), 
        icon = v21, 
        iconSize = l_IconSize_0.Medium, 
        iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
        iconTransparency = not not v36 and l_Theme_0.SystemPrimaryDefault.Transparency or 0.5, 
        onActivated = not not v36 and v27.props.deleteOutfit or nil, 
        buttonRef = v27.deleteButtonRef, 
        NextSelectionLeft = not v27.props.multiSelect and v27.renameButtonRef or nil
    });
    return v31;
end;
v22.renderWithProviders = function(v37, v38, v39, v40)
    local l_Theme_1 = v39.Theme;
    local v42 = 64;
    if v37.props.isPortrait then
        v42 = v42 + 24;
    end;
    if v37.props.bottomPadding then
        v42 = v42 + v37.props.bottomPadding;
    end;
    local v43 = v37:renderBarItems(v38, v39, v40);
    local l_deleteButtonRef_0 = v37.deleteButtonRef;
    if not (v37.props.multiSelect or not v37.props.showCustomOutfitNames) then
        l_deleteButtonRef_0 = v37.renameButtonRef;
    end;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v42), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = v37.props.ZIndex, 
        [v3.Change.AbsoluteSize] = v37.absoluteSizeChanged, 
        defaultChild = l_deleteButtonRef_0, 
        NextSelectionUp = v37.props.NextSelectionUp, 
        [v3.Ref] = v37.props.forwardRef
    }, {
        Background = v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 64)
        }, v43), 
        GapFiller = v37.props.isPortrait and v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 24), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        })
    });
end;
v22.render = function(v45)
    return l_withLocalization_0({
        countSelected = {
            "Feature.Avatar.Label.CountSelected"; 
            itemCount = #v45.props.selectedOutfits
        }, 
        selectItem = "Feature.Avatar.Label.SelectItem"
    })(function(v46)
        return l_withStyle_0(function(v47)
            return v9.withFocusController(function(v48)
                return v45:renderWithProviders(v46, v47, v48);
            end);
        end);
    end);
end;
v22 = v4.connect(function(v49, _)
    return {
        isPortrait = v49.DeviceOrientation == l_DeviceOrientationMode_0.Portrait
    };
end, nil)((l_RoactAppPolicy_0.connect(function(v51, _)
    return {
        showCustomOutfitNames = v51.getCustomOutfitNames()
    };
end)(v22)));
return v3.forwardRef(function(v53, v54)
    return v3.createElement(v22, v2.Dictionary.join(v53, {
        forwardRef = v54
    }));
end);
