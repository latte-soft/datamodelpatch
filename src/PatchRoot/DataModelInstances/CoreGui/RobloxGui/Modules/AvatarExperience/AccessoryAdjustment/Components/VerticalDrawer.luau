local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useProperty;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_withNavigationFocus_0 = require(l_CorePackages_0.RoactNavigation).withNavigationFocus;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v16 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v19 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v19.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v19.Utils.Constants;
local v22 = UDim.new(0, 6);
local function v24(v23)
    return v23.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
end;
local function v26(v25)
    return v16.getEquippedAccessories(v25);
end;
local function v28(v27)
    return v27.TopBar.topBarHeight;
end;
local function v31(v29)
    local l_GlobalGuiInset_0 = v29.GlobalGuiInset;
    return ((((v29.ScreenSize.Y - v29.TopBar.topBarHeight) - l_GlobalGuiInset_0.bottom) - l_GlobalGuiInset_0.top) - 32) - 48;
end;
local function v40(v32, v33, v34)
    local v35 = l_useSelector_0(v26);
    local v36 = {};
    local l_Theme_0 = l_useStyle_0().Theme;
    v36.UIListLayout = v3.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical, 
        Padding = UDim.new(0, 8), 
        ref = v32
    });
    v36.UIPadding = v3.createElement("UIPadding", {
        PaddingTop = UDim.new(0, 16), 
        PaddingBottom = UDim.new(0, 16), 
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 8)
    });
    for v38, v39 in v35, nil, nil do
        v36[v39] = v4.createElement(l_Focusable_0.Frame, {
            Size = UDim2.fromOffset(50, 50), 
            BackgroundTransparency = 1, 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            LayoutOrder = v38, 
            ref = v33[v38], 
            [v4.Event.Activated] = function()
                v34.navigation.navigate(v18.AdjustAccessoryView);
            end, 
            inputBindings = {
                SelectSlot = v6.Input.onBegin(Enum.KeyCode.ButtonA, function()
                    v34.navigation.navigate(v18.AdjustAccessoryView);
                end, {
                    key = ""
                })
            }, 
            NextSelectionDown = v38 < #v35 and v33[v38 + 1] or nil, 
            NextSelectionUp = v38 > 1 and v33[v38 - 1] or nil, 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset)
        }, {
            BackgroundImage = v4.createElement("Frame", {
                BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 0
            }, {
                Image = v4.createElement(l_LoadableImage_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = l_getRbxthumbWithTypeSizeAndOptions_0(v39, l_Constants_0.RbxthumbTypes.Asset, 150), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 0, 
                    cornerRadius = v22, 
                    showFailedStateWhenLoadingFailed = true, 
                    useShimmerAnimationWhileLoading = true
                }), 
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = v22
                })
            })
        });
    end;
    return v36;
end;
local v49 = l_withNavigationFocus_0((v15(function(v41)
    local l_Theme_1 = l_useStyle_0().Theme;
    local l_forwardRef_0 = v41.forwardRef;
    local v44 = v6.useRefCache();
    local v45 = l_useSelector_0(v28);
    local v46 = v3.useRef(nil);
    local v47 = l_useProperty_0(v46, "AbsoluteContentSize") or Vector2.new(0, 0);
    local function _()
        return (math.min(l_useSelector_0(v31), v47.Y + 32));
    end;
    return v3.createElement(l_Focusable_0.Frame, {
        AnchorPoint = Vector2.new(1, 0), 
        Size = UDim2.new(0, 66, 0, (math.min(l_useSelector_0(v31), v47.Y + 32))), 
        Position = UDim2.new(1, -(not l_useSelector_0(v24) and 88 or 12), 0, v45 + 4), 
        BackgroundColor3 = l_Theme_1.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_1.BackgroundMuted.Transparency, 
        ClipsDescendants = true, 
        defaultChild = v44[1], 
        ref = l_forwardRef_0, 
        NextSelectionLeft = v41.NextSelectionLeft, 
        restorePreviousChildFocus = true
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        ScrollingFrame = v3.createElement("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.fromScale(1, 1)
        }, (v40(v46, v44, v41)))
    });
end)));
return v4.forwardRef(function(v50, v51)
    return v4.createElement(v49, v2.Dictionary.join(v50, {
        forwardRef = v51
    }));
end);
