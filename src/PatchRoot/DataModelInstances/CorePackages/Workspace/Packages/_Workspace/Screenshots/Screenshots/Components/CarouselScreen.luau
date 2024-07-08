local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_Parent_1.AppCommonLib);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.RoactUtils);
local v8 = require(l_Parent_1.RobloxAppHooks);
local v9 = require(l_Parent_1.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetButton_0 = v9.Core.ImageSet.ImageSetButton;
local v12 = require(l_Parent_0.Enums.ShotsToastType);
local l_Signal_0 = v5.Signal;
local v14 = require(l_Parent_0.Components.ToastContainer);
local v15 = require(l_Parent_0.Actions.ToastTriggered);
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_useCallback_0 = v6.useCallback;
local l_useEffect_0 = v6.useEffect;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useRef_0 = v6.useRef;
local l_useScreenSize_0 = v8.useScreenSize;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_useState_0 = v6.useState;
local v24 = require(l_Parent_0.Components.CapturesCarousel);
local v25 = require(l_Parent_0.Actions.CarouselClosed);
local v26 = require(l_Parent_0.Components.CarouselCTAContainer);
local v27 = require(l_Parent_0.Constants);
local v28 = require(l_Parent_0.Thunks.DeleteCapture);
local v29 = require(l_Parent_0.Components.DeleteWarningModal);
local v30 = require(l_Parent_0.Analytics.EventNames);
local v31 = require(l_Parent_0.Experimentation.getIsFeatureVisibleToDesktopUser);
local v32 = require(l_Parent_0.Utils.getTimestampFromCapture);
local v33 = require(l_Parent_0.Components.PermissionModal);
local _ = require(l_Parent_0.Types);
local v35 = require(l_Parent_0.Analytics.useAnalytics);
local l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 = require(l_Parent_1.SharedFlags).FFlagCapturesCarouselCTABarUIUpdateEnabled;
local v37 = require(l_Parent_0.Flags.FFlagDecomposeDesktopCapturesEligibilityCheck);
local v38 = UDim2.fromOffset(32, 32);
local v39 = not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and 60 or 40;
local v40 = not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and 16 or 8;
local v41 = not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and 28 or 8;
local v42 = not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and 14 or 32;
local function v47(v43)
    local v44 = v32(v43);
    if v44 then
        assert(typeof(v44) == "number", "Expected timestamp to be a number");
        local v45 = DateTime.fromUnixTimestampMillis(v44);
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        return (("%* %*"):format(v45:FormatLocalTime("L", l_RobloxLocaleId_0), (v45:FormatLocalTime("LT", l_RobloxLocaleId_0))));
    else
        return "";
    end;
end;
return function(_)
    local v49 = v35();
    local v50 = l_useDispatch_0();
    local v51 = l_useStyle_0();
    local v53 = l_useSelector_0(function(v52)
        return v52.Screenshots.Captures;
    end);
    local v55 = l_useSelector_0(function(v54)
        return v54.Screenshots.Carousel.IsOpen;
    end);
    local v57 = l_useSelector_0(function(v56)
        return v56.Screenshots.Carousel.SelectedCaptureIndex;
    end);
    local v58 = l_useRef_0(l_Signal_0.new());
    local v59, v60 = l_useState_0(false);
    local v61, v62 = l_useState_0(false);
    local v63 = l_useScreenSize_0();
    l_useEffect_0(function()
        v50(v15(v12.None));
    end, {
        v55
    });
    local v64 = l_useCallback_0(function()
        v60(false);
        v49.fireEvent(v30.CapturesCarouselClosed);
        v50(v25());
    end, {});
    local v65 = l_useCallback_0(function()
        v60(false);
        v49.fireEvent(v30.CapturesCarouselClosedByKeyboard);
        v50(v25());
    end, {});
    local v66 = l_useCallback_0(function()
        v62(true);
    end, {});
    local v67 = l_useCallback_0(function()
        v62(false);
    end, {});
    local v69 = l_useCallback_0(function()
        v60(true);
        local v68 = v53[v57];
        v58.current:fire(function()
            v50(v28(v68));
            v60(false);
        end);
    end, {
        v53, 
        v57
    });
    l_useEffect_0(function()
        if v31() or v37 then
            if v55 then
                l_ContextActionService_0:BindCoreAction("CapturesCarouselCloseShortcutAction", function(_, v71)
                    if v71 == Enum.UserInputState.End then
                        v65();
                    end;
                end, false, Enum.KeyCode.Escape);
                return function()
                    l_ContextActionService_0:UnbindCoreAction("CapturesCarouselCloseShortcutAction");
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {
        v55, 
        v65
    });
    if v55 then
        local v72 = (((v63.Y - v42) - v39) - v41) - v40 * 4;
        if l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then
            v72 = ((((v63.Y - v42) - v39) - v41) - 16) - v40 * 2;
        end;
        local v73 = v47(v53[v57]);
        return v6.createElement("Frame", {
            Active = true, 
            BackgroundColor3 = v51.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v51.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then UDim2.fromOffset(0, -l_GuiService_0.TopbarInset.Height) else UDim2.fromOffset(0, 0), 
            Size = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then UDim2.new(1, 0, 1, l_GuiService_0.TopbarInset.Height) else UDim2.fromScale(1, 1)
        }, {
            CarouselContainer = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                UIListLayout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v40), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Padding = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then nil else v6.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 16), 
                    PaddingTop = UDim.new(0, v41)
                }), 
                TopPadding = if l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then nil else v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v41)
                }), 
                TitleFrame = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, v42), 
                    ZIndex = 2
                }, {
                    CloseButton = v6.createElement(l_ImageSetButton_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then l_Images_0["icons/controls/close-ingame"] else l_Images_0["icons/navigation/close"], 
                        ImageColor3 = v51.Theme.IconEmphasis.Color, 
                        ImageTransparency = v51.Theme.IconEmphasis.Transparency, 
                        Position = UDim2.new(0, 42, 0.5, 0), 
                        Size = v38, 
                        [v6.Event.Activated] = v64
                    }), 
                    DropShadow = v6.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        Font = v51.Font.Header2.Font, 
                        LayoutOrder = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 2), 
                        Size = UDim2.fromScale(0, 1), 
                        Text = v73, 
                        TextColor3 = v51.Theme.DropShadow.Color, 
                        TextSize = v51.Font.BaseSize * v51.Font.Header2.RelativeSize, 
                        TextTransparency = v51.Theme.DropShadow.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        ZIndex = 1
                    }, {
                        UIStroke = v6.createElement("UIStroke", {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, 
                            Color = v51.Theme.DropShadow.Color, 
                            LineJoinMode = Enum.LineJoinMode.Round, 
                            Thickness = 1, 
                            Transparency = v51.Theme.DropShadow.Transparency
                        })
                    }), 
                    Title = v6.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        Font = v51.Font.Header2.Font, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.fromScale(0, 1), 
                        Text = v73, 
                        TextColor3 = v51.Theme.TextEmphasis.Color, 
                        TextSize = v51.Font.BaseSize * v51.Font.Header2.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        ZIndex = 2
                    })
                }), 
                CapturesCarousel = v6.createElement(v24, {
                    deleteItemSignal = v58.current, 
                    isDisabled = v59, 
                    LayoutOrder = 2, 
                    maxHeight = v72, 
                    ZIndex = 1
                }), 
                CTAContainer = v6.createElement(v26, {
                    deleteItem = v69, 
                    height = v39, 
                    isDisabled = v59, 
                    LayoutOrder = 3, 
                    openPermissionModal = v66, 
                    ZIndex = 2
                })
            }), 
            DeleteWarningModal = v6.createElement(v29, {
                deleteItem = v69, 
                zIndex = 3
            }), 
            PermissionModal = v6.createElement(v33, {
                closeModal = v67, 
                visible = v61, 
                zIndex = 3
            }), 
            ToastsFrame = v6.createElement("Frame", {
                Active = false, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = v27.ZIndex.Toasts
            }, {
                ToastContainer = v6.createElement(v14)
            })
        });
    else
        return nil;
    end;
end;
