local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v9 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useNavigationFocus_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigationFocus;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v13 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_selectTopBarHeight_0 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar).selectTopBarHeight;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.Refinement.RefinementEntryButton);
local v17 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.AvatarRefinementButtons);
local v18 = require(l_Modules_0.AvatarExperience.UniversalAppCamera.Components.UniversalAppCameraToggle);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.AXProfilePictureQuickButton);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v21 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v22 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v23 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAccessoryAdjustmentEnabled);
local function v26(v25)
    return v3.createElement(v19, {
        isUIFullView = v25.isUIFullView, 
        isSceneFullView = v25.isSceneFullView, 
        layoutOrder = v25.layoutOrder, 
        ref = v25.profilePictureButtonRef, 
        NextSelectionLeft = v25.NextSelectionLeft, 
        NextSelectionDown = v25.refinementButtonsRef
    });
end;
local function v33(v27)
    local v28 = v9();
    local v29 = nil;
    if not v24() then
        v29 = true;
    else
        local v30 = v5[v28.opaque.name];
        v29 = not not v30 and not v30.isRefinementPage;
    end;
    local v31 = v21.useTestVariables(v22.EnabledForUser);
    local l_v29_0 = v29;
    if l_v29_0 then
        if not v24() then
            l_v29_0 = v3.createElement(v4.Focusable[v17], {
                isUIFullView = v27.isUIFullView, 
                isSceneFullView = v27.isSceneFullView, 
                layoutOrder = v27.layoutOrder, 
                ref = v27.refinementButtonsRef, 
                NextSelectionUp = if not v31 then nil else v27.profilePictureButtonRef, 
                NextSelectionLeft = v27.NextSelectionLeft
            });
        else
            return (v3.createElement(v16, {
                layoutOrder = v27.layoutOrder, 
                ref = v27.refinementButtonsRef, 
                NextSelectionUp = if not v31 then nil else v27.profilePictureButtonRef, 
                NextSelectionLeft = v27.NextSelectionLeft
            }));
        end;
    end;
    return l_v29_0;
end;
local function v35(v34)
    if not v21.useTestVariables(v23.EnabledForUser) or l_IsVRAppBuild_0() then
        return nil;
    else
        return (v3.createElement(v18, {
            isUIFullView = v34.isUIFullView, 
            isSceneFullView = v34.isSceneFullView, 
            layoutOrder = v34.layoutOrder
        }));
    end;
end;
return (v3.forwardRef(function(v36, v37)
    local v38 = v9();
    local v39 = v7.isAvatarSceneButtonsVisible(v38, l_useNavigationFocus_0(), v36.isUIFullView, v36.isSceneFullView, (l_useNavigation_0()));
    local v41 = v13(function(v40)
        return v40.getAllowCameraMovements();
    end);
    local v42 = l_useSelector_0(v14);
    local v43 = l_useSelector_0(l_selectTopBarHeight_0);
    local v44 = if not v42 then v6.LandscapeNavWidth else 0;
    local l_name_0 = v38.opaque.name;
    local v46 = v21.useTestVariables(v22.EnabledForUser);
    local v47 = v3.useRef(nil);
    local v48 = v3.useRef(nil);
    return v3.createElement(v4.Focusable.Frame, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(v44, 24, 0, v43 + 4), 
        Size = UDim2.fromOffset(44, 0), 
        Visible = v39, 
        ref = v37, 
        defaultChild = if not not v46 and (not (l_name_0 ~= v8.AvatarEditor) or l_name_0 == v8.Catalog) then v47 else v48
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        }), 
        ProfilePictureButton = if not not v46 and v41 then v3.createElement(v26, v2.Dictionary.join(v36, {
            layoutOrder = 1, 
            profilePictureButtonRef = v47, 
            refinementButtonsRef = v48
        })) else nil, 
        RefinementEntryButton = v3.createElement(v33, v2.Dictionary.join(v36, {
            layoutOrder = 2, 
            profilePictureButtonRef = v47, 
            refinementButtonsRef = v48
        })), 
        UniversalAppCameraButton = v3.createElement(v35, v2.Dictionary.join(v36, {
            layoutOrder = 3
        }))
    });
end));
