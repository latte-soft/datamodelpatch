local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_withStyle_0 = v3.Style.withStyle;
local l_Images_0 = v3.App.ImageSet.Images;
local l_SystemBar_0 = v3.App.Navigation.SystemBar;
local l_Placement_0 = v3.App.Navigation.Enum.Placement;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_Placements_0 = require(l_CorePackages_0.Workspace.Packages.AppSystemBar).Enum.Placements;
local v14 = require(l_Modules_0.LuaApp.Constants);
local v15 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v15.VRReadyWrapper;
local l_VRConstants_0 = v15.VRConstants;
local v18 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v18.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v18.FocusNavigableSurfaceIdentifierEnum;
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local v22 = require(l_Modules_0.LuaApp.Components.StudioCTAButton);
local l_GetFFlagAdjustVRFloor_0 = v5.GetFFlagAdjustVRFloor;
local l_GetFFlagEnableNavBarLabels_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNavBarLabels;
local l_GetFFlagNavBarLabelsVRFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNavBarLabelsVRFix;
local v26 = require(l_Modules_0.LuaApp.Components.NavbarExperimentation);
local l_FFlagEnableUniversalFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUniversalFocusNavigation;
local l_GetFFlagEnableNavigationPerformanceIntervals_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals;
local v29 = v1.PureComponent:extend("AppSystemBar");
v29.validateProps = v4.strictInterface({
    isVisible = v4.boolean, 
    displayOrder = v4.optional(v4.number), 
    layoutInfo = v4.optional(v4.table), 
    selectedIndex = v4.optional(v4.number), 
    items = v4.array(v4.any), 
    onActivated = v4.callback, 
    placement = v4.valueOf(l_Placements_0), 
    showStudioCTA = v4.optional(v4.boolean)
});
v29.defaultProps = {
    displayOrder = 0, 
    selectedIndex = 1, 
    placement = l_Placements_0.Bottom
};
local v30 = {
    [l_Placements_0.Bottom] = {
        placement = l_Placement_0.Bottom, 
        position = UDim2.fromScale(0, 1), 
        size = UDim2.new(1, 0, 0, 48)
    }, 
    [l_Placements_0.Left] = {
        placement = l_Placement_0.Left, 
        position = UDim2.new(0, -64, 0, 0), 
        size = UDim2.new(0, 64, 1, 0)
    }, 
    [l_Placements_0.VR] = {
        placement = l_Placement_0.Left, 
        position = UDim2.new(0, -4, 0, 0), 
        size = UDim2.new(1, 0, 1, 0), 
        clipsDescendants = false
    }
};
if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
    v29.init = function(v31)
        v31.alreadyTrackedPerformanceIntervals = {};
    end;
    v29.getPerformanceTrackerIntervalName = function(v32, v33)
        if v32.alreadyTrackedPerformanceIntervals[v33] ~= nil then
            return "go_to_" .. tostring(v33) .. "_" .. "warm";
        else
            v32.alreadyTrackedPerformanceIntervals[v33] = true;
            return "go_to_" .. tostring(v33) .. "_" .. "cold";
        end;
    end;
end;
v29.getPlacementProps = function(_)
    if not (v26.isEnabled() and v26.default:shouldShowNavbarLabels() or l_GetFFlagEnableNavBarLabels_0()) and not l_GetFFlagNavBarLabelsVRFix_0() then
        return v30;
    else
        return {
            [l_Placements_0.Bottom] = {
                placement = l_Placement_0.Bottom, 
                position = UDim2.fromScale(0, 1), 
                size = UDim2.new(1, 0, 0, v14.BOTTOM_BAR_SIZE), 
                experimentalTabSizePortraitY = v14.BOTTOM_BAR_SIZE
            }, 
            [l_Placements_0.Left] = {
                placement = l_Placement_0.Left, 
                position = UDim2.new(0, -64, 0, 0), 
                size = UDim2.new(0, 64, 1, 0)
            }, 
            [l_Placements_0.VR] = {
                placement = l_Placement_0.Left, 
                firstItemPaddingOffset = if (not not v26.isEnabled() and v26.default:shouldShowNavbarLabels() or l_GetFFlagEnableNavBarLabels_0()) or l_GetFFlagNavBarLabelsVRFix_0() then UDim.new(0, -14) else nil, 
                position = UDim2.new(0, -4, 0, 0), 
                size = UDim2.new(1, 0, 1, 0), 
                clipsDescendants = false
            }
        };
    end;
end;
v29.render = function(v35)
    local l_displayOrder_0 = v35.props.displayOrder;
    local l_layoutInfo_0 = v35.props.layoutInfo;
    local l_selectedIndex_0 = v35.props.selectedIndex;
    local l_items_0 = v35.props.items;
    local l_onActivated_0 = v35.props.onActivated;
    local l_placement_0 = v35.props.placement;
    local l_showStudioCTA_0 = v35.props.showStudioCTA;
    local v43 = not not l_layoutInfo_0 and l_layoutInfo_0.Background or {};
    local v46 = v2.List.map(l_items_0, function(v44)
        return {
            iconOn = v44.icon and l_Images_0[string.gsub(v44.icon.on, "^LuaApp/", "")], 
            iconOff = v44.icon and l_Images_0[string.gsub(v44.icon.off, "^LuaApp/", "")], 
            itemSize = if ((not not v26.isEnabled() and v26.default:shouldShowNavbarLabels() or l_GetFFlagEnableNavBarLabels_0()) or l_GetFFlagNavBarLabelsVRFix_0()) and l_placement_0 == l_Placements_0.Bottom then v44.itemSize else nil, 
            iconComponent = v44.iconComponent, 
            onActivated = function()
                if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                    local l_page_0 = v44.page;
                    if l_page_0 ~= nil then
                        l_IntervalPerformanceTracker_0:startTracking(v35:getPerformanceTrackerIntervalName(l_page_0), 2);
                    end;
                end;
                return l_onActivated_0(v44.page, v44.actionType);
            end, 
            bottomAligned = v44.bottomAligned, 
            badgeValue = v44.badgeCount
        };
    end);
    if l_showStudioCTA_0 and l_placement_0 == l_Placements_0.Left then
        table.insert(v46, {
            iconComponent = function(v47)
                return v1.createElement(v22, {
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0, 0), 
                    AnchorPoint = Vector2.new(0, 0), 
                    showTooltip = true, 
                    hovered = v47.hovered
                });
            end, 
            bottomAligned = true, 
            onActivated = function()
            end
        });
    end;
    local v48 = if (not not v26.isEnabled() and v26.default:shouldShowNavbarLabels() or l_GetFFlagEnableNavBarLabels_0()) or l_GetFFlagNavBarLabelsVRFix_0() then v35:getPlacementProps() else v30;
    return l_withStyle_0(function(v49)
        local v50 = {
            Background = if l_placement_0 == l_Placements_0.Bottom then v1.createElement("Frame", {
                AnchorPoint = v43.AnchorPoint, 
                Position = v43.Position, 
                Size = v43.Size, 
                BorderSizePixel = 0, 
                BackgroundTransparency = v49.Theme.NavigationBar.Transparency, 
                BackgroundColor3 = v49.Theme.NavigationBar.Color, 
                Active = true, 
                Visible = v35.props.isVisible, 
                ZIndex = 0
            }) else nil, 
            RealSystemBar = v1.createElement(l_SystemBar_0, v2.Dictionary.join(v48[l_placement_0], {
                itemList = v46, 
                selection = l_selectedIndex_0, 
                hidden = not v35.props.isVisible
            }))
        };
        return v1.createElement(v1.Portal, {
            target = l_CoreGui_0
        }, {
            SystemBar = v1.createElement(l_VRReadyWrapper_0, {
                component = "ScreenGui", 
                props = {
                    Enabled = true, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = l_displayOrder_0
                }, 
                vrProps = {
                    partSize = l_VRConstants_0.AppSystemBarSize, 
                    offset = not not l_GetFFlagAdjustVRFloor_0() and l_VRConstants_0.AppSystemBarPosition or CFrame.lookAt(l_VRConstants_0.AppSystemBarPosition, l_VRConstants_0.DefaultCameraPosition, (Vector3.new(0, 1, 0))), 
                    virtualScreenSize = l_VRConstants_0.AppSystemBarResolution, 
                    panelName = "AppSystemBar", 
                    roundedCornersFrameColor = v49.Theme.NavigationBar.Color, 
                    hidden = not v35.props.isVisible
                }
            }, if not l_FFlagEnableUniversalFocusNavigation_0 then v50 else v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.NavBar
            }, v50))
        });
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v51, _)
    return {
        placement = v51.getSystemBarPlacement(), 
        showStudioCTA = v51.getShowStudioCTA()
    };
end)(v29));
