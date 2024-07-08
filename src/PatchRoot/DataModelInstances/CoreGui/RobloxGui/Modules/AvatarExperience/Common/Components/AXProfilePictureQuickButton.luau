local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useSelectionCursor_0 = v6.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_IconSize_0 = v6.App.Constant.IconSize;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v13 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v15 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v15.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v15.Utils.getRbxthumbWithTypeSizeAndOptions;
local v18 = UDim.new(0, 8);
local v19 = UDim.new(0, v18.Offset - (44 - l_IconSize_0.Regular) / 2);
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v21 = {
    [v12.AvatarEditor] = true, 
    [v12.Catalog] = true
};
local function _(v22, v23)
    return (v21[v23.opaque.name] ~= nil and not v22.isUIFullView) and not v22.isSceneFullView;
end;
return (v2.forwardRef(function(v25, v26)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v28 = v13();
    local v29 = l_useNavigation_0();
    local v31 = l_useSelector_0(function(v30)
        return v30.Navigation.history;
    end);
    return v2.createElement(v3.Focusable.Frame, {
        Size = UDim2.fromOffset(44, 44), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        Visible = (v21[v28.opaque.name] ~= nil and not v25.isUIFullView) and not v25.isSceneFullView, 
        LayoutOrder = v25.layoutOrder, 
        NextSelectionUp = v25.NextSelectionUp, 
        NextSelectionDown = v25.NextSelectionDown, 
        NextSelectionLeft = v25.NextSelectionLeft, 
        NextSelectionRight = v25.NextSelectionRight, 
        ref = v26
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = v18
        }), 
        Button = v2.createElement(v3.Focusable[l_ImageSetButton_0], {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = l_getRbxthumbWithTypeSizeAndOptions_0(l_useSelector_0(function(v32)
                return v32.LocalUserId;
            end), l_AvatarHeadShot_0, 150), 
            ZIndex = 2, 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect), 
            [v2.Event.Activated] = v2.useCallback(function()
                v29.navigate(v12.ProfilePictureEditorEmotes, {
                    prevNavPage = v28.opaque.name, 
                    prevNavHistory = v31
                });
            end, {
                v29, 
                v28, 
                v31
            })
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = v19
            })
        })
    });
end));
