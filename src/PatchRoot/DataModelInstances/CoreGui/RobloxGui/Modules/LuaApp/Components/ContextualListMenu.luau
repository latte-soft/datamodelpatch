local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_LuaApp_0 = l_Modules_0.LuaApp;
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_withStyle_0 = v4.Style.withStyle;
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v8.VRReadyWrapper;
local l_VRConstants_0 = v8.VRConstants;
local v11 = require(l_Modules_0.Common.Roact);
local v12 = require(l_Modules_0.Common.RoactRodux);
local v13 = require(l_LuaApp_0.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v16 = require(l_LuaApp_0.Components.FramePopOut);
local v17 = require(l_LuaApp_0.Components.FramePopup);
local l_GetFFlagAdjustVRFloor_0 = v5.GetFFlagAdjustVRFloor;
local v19 = v11.PureComponent:extend("ContextualListMenu");
v19.defaultProps = {
    menuWidth = v7.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH
};
v19.render = function(v20)
    local v21 = v20.props[v11.Children] or {};
    local l_callbackCancel_0 = v20.props.callbackCancel;
    local l_formFactor_0 = v20.props.formFactor;
    local l_screenSize_0 = v20.props.screenSize;
    local l_globalContextMenuInset_0 = v20.props.globalContextMenuInset;
    local l_menuWidth_0 = v20.props.menuWidth;
    local l_screenShape_0 = v20.props.screenShape;
    local v28 = l_formFactor_0 == l_FormFactor_0.WIDE;
    if not (l_screenSize_0.X > 0) or l_screenSize_0.Y <= 0 then
        return nil;
    else
        v21.Layout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        local v29 = v11.createElement(v13.FitFrame, {
            BackgroundTransparency = 1, 
            fitAxis = v13.FitAxis.Height, 
            Size = UDim2.new(1, 0, 0, 0)
        }, v21);
        local v30 = nil;
        v30 = if not v28 then v11.createElement(v17, {
            onCancel = l_callbackCancel_0
        }, {
            Content = v29
        }) else v11.createElement(v16, {
            itemWidth = l_menuWidth_0, 
            onCancel = l_callbackCancel_0, 
            parentShape = l_screenShape_0
        }, {
            Content = v29
        });
        local v31 = l_getSafeAreaSize_0(l_screenSize_0, l_globalContextMenuInset_0);
        return l_withStyle_0(function(v32)
            return v11.createElement(v11.Portal, {
                target = l_CoreGui_0
            }, {
                PortalUI = v11.createElement(l_VRReadyWrapper_0, {
                    component = "ScreenGui", 
                    props = {
                        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                        DisplayOrder = v7.DisplayOrder.ContextualListMenu
                    }, 
                    vrProps = {
                        partSize = l_VRConstants_0.MainScreenSize, 
                        offset = not not l_GetFFlagAdjustVRFloor_0() and l_VRConstants_0.MainScreenPosition or CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                        virtualScreenSize = l_VRConstants_0.MainScreenResolution, 
                        panelName = "ContextualListMenu", 
                        curvature = l_VRConstants_0.MainScreenCurvature
                    }
                }, {
                    Content = v11.createElement("Frame", {
                        Position = UDim2.new(0, -l_globalContextMenuInset_0.left, 0, -l_globalContextMenuInset_0.top), 
                        Size = UDim2.new(0, l_screenSize_0.X, 0, l_screenSize_0.Y), 
                        BackgroundColor3 = v32.Theme.Overlay.Color, 
                        BackgroundTransparency = v32.Theme.Overlay.Transparency, 
                        BorderSizePixel = 0, 
                        Active = true
                    }, {
                        SafeAreaFrame = v11.createElement("Frame", {
                            Position = UDim2.new(0, l_globalContextMenuInset_0.left, 0, l_globalContextMenuInset_0.top), 
                            Size = v31, 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true
                        }, {
                            Content = v30
                        })
                    })
                })
            });
        end);
    end;
end;
return (v12.connect(function(v33, _)
    return {
        formFactor = v33.FormFactor, 
        screenSize = v33.ScreenSize, 
        globalGuiInset = v33.GlobalGuiInset, 
        globalContextMenuInset = v33.GlobalContextMenuInset
    };
end)(v19));
