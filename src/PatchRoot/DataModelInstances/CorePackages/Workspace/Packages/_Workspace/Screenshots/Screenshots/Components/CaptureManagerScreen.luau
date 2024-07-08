local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.Localization);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.RobloxAppHooks);
local v8 = require(l_Parent_1.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_GridView_0 = v8.App.Grid.GridView;
local l_useStyle_0 = v8.Core.Style.useStyle;
local v13 = require(l_Parent_0.Analytics.useAnalytics);
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local v20 = require(l_Parent_0.Actions.CaptureManagerClosed);
local v21 = require(l_Parent_0.Components.CaptureManagerItem);
local v22 = require(l_Parent_0.Components.CaptureManagerCTAContainer);
local v23 = require(l_Parent_0.Constants);
local v24 = require(l_Parent_0.Thunks.DeleteCaptures);
local v25 = require(l_Parent_0.Components.DeleteWarningModal);
local v26 = require(l_Parent_0.Analytics.EventNames);
local v27 = require(l_Parent_0.Components.PermissionModal);
local v28 = require(l_Parent_0.Components.ShowMoreButton);
local v29 = require(l_Parent_0.Components.ToastContainer);
local _ = require(l_Parent_0.Types);
local v31 = require(l_Parent_0.Actions.UpdateSelectedCaptures);
local v32 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementM2Enabled);
local v33 = require(l_Parent_0.Flags.FFlagCapturesRemoveOldMenuTheme);
local v34 = UDim2.fromOffset(32, 32);
local v35 = not v32 and 4 or 3;
local v36 = not v33 and 12 or 1;
local v37 = if not v33 then v36 + 4 else v36 + 8;
local function _(v38)
    return (math.clamp(math.floor(v38 / 90), 1, v35));
end;
local function _(v40, v41)
    local v42 = math.clamp(math.floor(v41 / 90), 1, v35);
    local v43 = (v41 - 4 * (v42 - 1)) / v42;
    return Vector2.new(math.floor(v43), (math.floor(v43 * v40)));
end;
local function v47(v45, v46)
    return v5.createElement(v21, {
        capture = v45, 
        captureIndex = v46
    });
end;
return function(_)
    local v49 = v13();
    local v50 = l_useDispatch_0();
    local v51 = l_useStyle_0();
    local v53 = l_useSelector_0(function(v52)
        return v52.Screenshots.Captures;
    end);
    local v55 = l_useSelector_0(function(v54)
        return v54.Screenshots.CaptureManager.SelectedCaptures;
    end);
    local v57 = l_useSelector_0(function(v56)
        return v56.Screenshots.CaptureManager.IsOpen;
    end);
    local v58 = l_useLocalization_0({
        cancelSelectAllAction = "Feature.Captures.Action.CancelSelectAllCaptures", 
        selectAllAction = "Feature.Captures.Action.SelectAllCaptures"
    });
    local v59 = v5.useRef(nil);
    local v60, v61 = l_useState_0(Vector2.new(0, 0));
    local v62, v63 = l_useState_0(false);
    local v64, v65 = l_useState_0(false);
    local v66, v67 = v5.useState(24);
    local v68 = if #v55 == 0 then v58.selectAllAction else v58.cancelSelectAllAction;
    local v69 = l_useScreenSize_0();
    v5.useEffect(function()
        if v59.current then
            v61(v59.current.AbsoluteSize);
        end;
    end, {});
    local v71 = l_useCallback_0(function(v70)
        v61(v70.AbsoluteSize);
    end, {});
    local v72 = l_useCallback_0(function()
        v63(false);
        v50(v20());
    end, {});
    local v73 = l_useCallback_0(function()
        v65(true);
    end, {});
    local v74 = l_useCallback_0(function()
        v65(false);
    end, {});
    local v75 = l_useCallback_0(function()
        v50(v24(v55));
    end, {
        v55
    });
    local v76 = l_useCallback_0(function()
        if #v55 == 0 then
            v50(v31(v53));
            v49.fireEvent(v26.CapturesManagerSelectAllActivated);
            return ;
        else
            v50(v31({}));
            return ;
        end;
    end, {
        v55, 
        v53
    });
    local v77 = v5.useCallback(function()
        v67(v66 + 24);
    end, {
        v66
    });
    local v78 = v5.useMemo(function()
        return v3.slice(v53, 1, (math.min(#v53, v66)));
    end, {
        v53, 
        v66
    });
    if v57 then
        local v79 = false;
        if v60.X > 0 then
            v79 = v60.Y > 0;
        end;
        local v80 = math.clamp(v69.Y / v69.X, 0.42857142857142855, 1);
        local l_Y_0 = v60.Y;
        local v82 = v60.X - (v37 + 32);
        local l_v82_0 = v82;
        local v84 = math.clamp(math.floor(l_v82_0 / 90), 1, v35);
        local v85 = (l_v82_0 - 4 * (v84 - 1)) / v84;
        local v86 = Vector2.new(math.floor(v85), (math.floor(v85 * v80)));
        l_v82_0 = l_Y_0 < v82;
        v84 = not l_v82_0 and 82 or 44;
        v85 = v5.createElement;
        local v87 = "Frame";
        local v88 = {
            Active = true, 
            BackgroundColor3 = v51.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v51.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.fromOffset(0, -l_GuiService_0.TopbarInset.Height), 
            ref = v59, 
            Size = UDim2.new(1, 0, 1, l_GuiService_0.TopbarInset.Height), 
            [v5.Change.AbsoluteSize] = v71
        };
        local v89 = {};
        local l_createElement_0 = v5.createElement;
        local v91 = "Frame";
        local v92 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        };
        local v93 = {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Padding = v5.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 8), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 8), 
                PaddingTop = UDim.new(0, 40)
            }), 
            TitleFrame = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 32), 
                ZIndex = 2
            }, {
                CloseButton = v5.createElement(l_ImageSetButton_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["icons/navigation/close"], 
                    ImageColor3 = v51.Theme.IconEmphasis.Color, 
                    ImageTransparency = v51.Theme.IconEmphasis.Transparency, 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = v34, 
                    [v5.Event.Activated] = v72
                }), 
                DropShadow = v5.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    Font = v51.Font.Header2.Font, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(1, -16, 0.5, 2), 
                    Size = UDim2.fromScale(0, 1), 
                    Text = v68, 
                    TextColor3 = v51.Theme.DropShadow.Color, 
                    TextSize = v51.Font.BaseSize * v51.Font.Header2.RelativeSize, 
                    TextTransparency = v51.Theme.DropShadow.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 1
                }, {
                    UIStroke = v5.createElement("UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, 
                        Color = v51.Theme.DropShadow.Color, 
                        LineJoinMode = Enum.LineJoinMode.Round, 
                        Thickness = 1, 
                        Transparency = v51.Theme.DropShadow.Transparency
                    })
                }), 
                SelectOrDeselectAllButton = v5.createElement("TextButton", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    Font = v51.Font.Header2.Font, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(1, -16, 0.5, 2), 
                    Size = UDim2.fromScale(0, 1), 
                    Text = v68, 
                    TextColor3 = v51.Theme.TextEmphasis.Color, 
                    TextSize = v51.Font.BaseSize * v51.Font.Header2.RelativeSize, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 2, 
                    [v5.Event.Activated] = v76
                })
            })
        };
        local l_createElement_1 = v5.createElement;
        local v95 = "ScrollingFrame";
        local v96 = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.fromScale(1, 0), 
            LayoutOrder = 2, 
            ScrollBarThickness = v36, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.new(1, 0, 1, -(40 + v84))
        };
        local v97 = {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            GridView = v79 and v5.createElement(l_GridView_0, {
                itemPadding = Vector2.new(4, 4), 
                items = v78, 
                itemSize = v86, 
                LayoutOrder = 1, 
                renderItem = v47
            })
        };
        local v98 = false;
        if v66 < #v53 then
            v98 = v5.createElement(v28, {
                buttonHeight = 40, 
                LayoutOrder = 2, 
                onActivated = v77
            });
        end;
        v97.ShowMoreButton = v98;
        v93.ScrollingFrame = l_createElement_1(v95, v96, v97);
        v93.CTAContainer = v5.createElement(v22, {
            deleteItem = v75, 
            height = v84, 
            isDisabled = v62, 
            isHorizontal = l_v82_0, 
            LayoutOrder = 3, 
            openPermissionModal = v73, 
            width = v82, 
            ZIndex = 2
        });
        v89.CaptureManagerContainer = l_createElement_0(v91, v92, v93);
        v89.DeleteWarningModal = v5.createElement(v25, {
            deleteItem = v75, 
            zIndex = 3
        });
        v89.PermissionModal = v5.createElement(v27, {
            closeModal = v74, 
            visible = v64, 
            zIndex = 3
        });
        v89.ToastsFrame = v5.createElement("Frame", {
            Active = false, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v23.ZIndex.Toasts
        }, {
            ToastContainer = v5.createElement(v29)
        });
        return v85(v87, v88, v89);
    else
        return nil;
    end;
end;
