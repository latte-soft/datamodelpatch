local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.UIBlox);
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_Images_0 = v5.App.ImageSet.Images;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v10 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useRef_0 = v3.useRef;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v15 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local v16 = require(l_Parent_0.Analytics.EventNames);
local v17 = require(l_Parent_0.App.ScreenshotsPolicy);
local v18 = require(l_Parent_0.Thunks.ShareCapture);
local v19 = require(l_Parent_0.Utils.getIsDeleteWarningModalOptedOut);
local v20 = require(l_Parent_0.Utils.getSaveToStoragePermission);
local v21 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementM2Enabled);
local v22 = game:DefineFastInt("CapturesSaveToExternalStorageLimit", 10);
local v23 = UDim2.new(0.33, 0, 0, 36);
local v24 = not v21 and 1 or v22;
return (v17.connect(function(v25)
    return {
        enableShareCaptureCTA = v25.enableShareCaptureCTA()
    };
end)(function(v26)
    local v27 = v10();
    local v28 = l_useDispatch_0();
    local v29 = l_useStyle_0();
    local v30 = l_useRef_0(0);
    local v32 = l_useSelector_0(function(v31)
        return v31.Screenshots.CaptureManager.SelectedCaptures;
    end);
    local v33 = #v32;
    local v34 = true;
    if #v32 ~= 0 then
        v34 = #v32 > 1;
    end;
    local v35 = true;
    if #v32 ~= 0 then
        v35 = v24 < #v32;
    end;
    local v36 = #v32 == 0;
    local v37 = if not v26.isHorizontal then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal;
    local v38 = if not v26.isHorizontal then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left;
    local v39 = if not v26.isHorizontal then UDim2.new(1, 0, 0, 38) else UDim2.new(0, v26.width - 279, 0, v26.height);
    local v40 = if not v26.isHorizontal then UDim2.new(1, 0, 0, 44) else UDim2.new(0, 279, 0, v26.height);
    local v41 = l_useLocalization_0({
        selectCaptureLabel = "Feature.Captures.Label.SelectCapture", 
        oneCaptureSelectedLabel = "Feature.Captures.Label.OneCaptureSelected", 
        multipleCapturesSelectedLabel = {
            "Feature.Captures.Label.MultipleCapturesSelected"; 
            numberOfCaptures = v33
        }
    });
    local v42 = v3.useCallback(function()
        if v33 == 0 then
            return v41.selectCaptureLabel;
        elseif v33 == 1 then
            return v41.oneCaptureSelectedLabel;
        else
            return v41.multipleCapturesSelectedLabel;
        end;
    end, {
        v33
    });
    local v43 = v3.useCallback(function()
        if not v26.isDisabled then
            if DateTime.now().UnixTimestampMillis - v30.current < 500 then
                return true;
            else
                return false;
            end;
        else
            return true;
        end;
    end, {
        v26.isDisabled
    });
    local v44 = v3.useCallback(function()
        v30.current = DateTime.now().UnixTimestampMillis;
    end, {});
    return v3.createElement("Frame", {
        BackgroundColor3 = v29.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = v29.Theme.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v26.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v26.height), 
        ZIndex = v26.ZIndex
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = v37, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 16)
        }), 
        CapturesLabel = v3.createElement("TextLabel", {
            AnchorPoint = Vector2.new(1, 0.5), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            Font = v29.Font.Header2.Font, 
            LayoutOrder = 1, 
            Position = UDim2.new(1, 0, 1, 0), 
            Size = v39, 
            Text = v42(), 
            TextColor3 = v29.Theme.TextEmphasis.Color, 
            TextSize = v29.Font.BaseSize * v29.Font.CaptionHeader.RelativeSize, 
            TextXAlignment = v38, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 1
        }), 
        CTAContainer = v3.createElement("Frame", {
            BackgroundColor3 = v29.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v29.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = v26.LayoutOrder, 
            Size = v40, 
            ZIndex = v26.ZIndex
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            BulkSaveButton = v3.createElement(l_IconButton_0, {
                backgroundColor = v29.Theme.BackgroundUIContrast, 
                icon = l_Images_0["icons/actions/download_medium"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v35, 
                layoutOrder = 1, 
                onActivated = v3.useCallback(function()
                    if v43() or #v32 == 0 then
                        return ;
                    else
                        if not v21 then
                            v20(v32[1], v26.openPermissionModal, v28);
                            v27.fireEvent(v16.CapturesManagerSaveToExternalStorageActivated);
                        else
                            v20(v32, v26.openPermissionModal, v28);
                            v27.fireEvent(v16.CapturesManagerBulkSaveToExternalStorageActivated);
                        end;
                        v44();
                        return ;
                    end;
                end, {
                    v32, 
                    v43, 
                    v44, 
                    v26.openPermissionModal
                }), 
                size = v23
            }), 
            BulkShareButton = v26.enableShareCaptureCTA and v3.createElement(l_IconButton_0, {
                backgroundColor = v29.Theme.BackgroundUIContrast, 
                icon = l_Images_0["icons/actions/share"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v34, 
                layoutOrder = 1, 
                onActivated = v3.useCallback(function()
                    if v43() or #v32 == 0 then
                        return ;
                    else
                        local v45 = v32[1];
                        v44();
                        v27.fireEvent(v16.CapturesManagerShareActivated);
                        v28(v18(v45));
                        return ;
                    end;
                end, {
                    v32, 
                    v26.isDisabled, 
                    v43, 
                    v44
                }), 
                size = v23
            }), 
            BulkDeleteButton = v3.createElement(l_IconButton_0, {
                icon = l_Images_0["icons/actions/edit/delete"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v36, 
                layoutOrder = 2, 
                onActivated = v3.useCallback(function()
                    if v43() or #v32 == 0 then
                        return ;
                    else
                        v44();
                        v27.fireEvent(v16.CapturesDeleteActivatedInCaptureManager);
                        if not v19() then
                            v28(v15());
                            return ;
                        else
                            assert(v26.deleteItem ~= nil, "props.deleteItem should not be nil");
                            v26.deleteItem();
                            return ;
                        end;
                    end;
                end, {
                    v26.deleteItem, 
                    v26.isDisabled, 
                    v43, 
                    v44
                }), 
                size = v23
            })
        })
    });
end));
