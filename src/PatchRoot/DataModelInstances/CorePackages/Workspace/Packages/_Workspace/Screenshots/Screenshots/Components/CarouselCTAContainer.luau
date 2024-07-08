local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol.default;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.UIBlox);
local l_IconButton_0 = v6.App.Button.IconButton;
local l_Images_0 = v6.App.ImageSet.Images;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v10 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useRef_0 = v4.useRef;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local v14 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local v15 = require(l_Parent_0.Analytics.EventNames);
local v16 = require(l_Parent_0.Thunks.SaveCaptureToExternalStorage);
local v17 = require(l_Parent_0.App.ScreenshotsPolicy);
local v18 = require(l_Parent_0.Thunks.ShareCapture);
local _ = require(l_Parent_0.Types);
local v20 = require(l_Parent_0.Utils.getIsDeleteWarningModalOptedOut);
local v21 = require(l_Parent_0.Utils.getSaveToStoragePermission);
local v22 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementEnabled);
local l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 = require(l_Parent_1.SharedFlags).FFlagCapturesCarouselCTABarUIUpdateEnabled;
local v24 = require(l_Parent_0.Flags.FFlagCapturesCarouselPostButtonEnabled);
local v25 = require(l_Parent_0.Flags.FFlagScreenshotsSaveToDeviceToast);
local v26 = UDim.new(0.12, 0);
local v27 = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then UDim2.fromOffset(44, 44) else UDim2.fromOffset(36, 36);
local v28 = UDim.new(0, 8);
return (v17.connect(function(v29)
    return {
        enableShareCaptureCTA = v29.enableShareCaptureCTA()
    };
end)(function(v30)
    local v31 = v10();
    local v32 = l_useDispatch_0();
    local v33 = l_useStyle_0();
    local v34 = l_useRef_0(0);
    local v36 = l_useSelector_0(function(v35)
        return v35.Screenshots.Captures[v35.Screenshots.Carousel.SelectedCaptureIndex];
    end);
    local v37 = v4.useCallback(function()
        if not v30.isDisabled then
            if DateTime.now().UnixTimestampMillis - v34.current < 500 then
                return true;
            else
                return false;
            end;
        else
            return true;
        end;
    end, {
        v30.isDisabled
    });
    local v38 = v4.useCallback(function()
        v34.current = DateTime.now().UnixTimestampMillis;
    end, {});
    return v4.createElement("Frame", {
        AutomaticSize = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then Enum.AutomaticSize.X else Enum.AutomaticSize.None, 
        BackgroundColor3 = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then v33.Theme.UIEmphasis.Color else v33.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then v33.Theme.UIEmphasis.Transparency else v33.Theme.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v30.LayoutOrder, 
        Size = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then UDim2.fromOffset(0, v30.height) else UDim2.new(1, 0, 0, v30.height), 
        ZIndex = v30.ZIndex
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = v28
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then UDim.new(0, 30) else v26, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        SaveButton = v4.createElement(l_IconButton_0, {
            backgroundColor = v33.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/download_medium"], 
            layoutOrder = 1, 
            onActivated = v4.useCallback(function()
                if not v37() then
                    if not v22 then
                        l_default_0:hasPermissions({
                            l_default_0.Permissions.WRITE_MEDIA_STORAGE
                        }):andThen(function(v39)
                            local v40 = v39.status == l_default_0.Status.AUTHORIZED;
                            if not (l_UserInputService_0:GetPlatform() == Enum.Platform.Android) or v40 then
                                if not v25 or v40 then
                                    v32(v16(v36));
                                    return ;
                                else
                                    l_default_0:requestPermissions({
                                        l_default_0.Permissions.WRITE_MEDIA_STORAGE
                                    }):andThen(function(v41)
                                        if v41.status == l_default_0.Status.AUTHORIZED then
                                            v32(v16(v36));
                                        end;
                                    end):catch(function()
                                    end);
                                    return ;
                                end;
                            elseif v30.openPermissionModal then
                                assert(v30.openPermissionModal ~= nil, "props.openPermissionModal is not nil");
                                v30.openPermissionModal();
                                return ;
                            else
                                return ;
                            end;
                        end):catch(function()
                            if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                                return ;
                            elseif v30.openPermissionModal then
                                assert(v30.openPermissionModal ~= nil, "props.openPermissionModal is not nil");
                                v30.openPermissionModal();
                                return ;
                            else
                                return ;
                            end;
                        end);
                    else
                        v21(v36, v30.openPermissionModal, v32);
                    end;
                    v38();
                    v31.fireEvent(v15.CapturesCarouselSaveToExternalStorageActivated);
                    return ;
                else
                    return ;
                end;
            end, {
                v36, 
                v37, 
                v38, 
                v30.openPermissionModal
            }), 
            showBackground = not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and true or false, 
            size = v27
        }), 
        PostButton = v24 and v4.createElement(l_IconButton_0, {
            backgroundColor = v33.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/edit/add"], 
            layoutOrder = 2, 
            onActivated = v4.useCallback(function()
                if not v37() then
                    v38();
                    v31.fireEvent(v15.CapturesCarouselPostActivated);
                    return ;
                else
                    return ;
                end;
            end, {
                v36, 
                v30.isDisabled, 
                v37, 
                v38
            }), 
            showBackground = not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and true or false, 
            size = v27
        }), 
        ShareButton = v30.enableShareCaptureCTA and v4.createElement(l_IconButton_0, {
            backgroundColor = v33.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/share"], 
            layoutOrder = 3, 
            onActivated = v4.useCallback(function()
                if not v37() then
                    v38();
                    v31.fireEvent(v15.CapturesCarouselShareActivated);
                    v32(v18(v36));
                    return ;
                else
                    return ;
                end;
            end, {
                v36, 
                v30.isDisabled, 
                v37, 
                v38
            }), 
            showBackground = not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and true or false, 
            size = v27
        }), 
        DeleteButton = v4.createElement(l_IconButton_0, {
            icon = l_Images_0["icons/actions/edit/delete"], 
            layoutOrder = 4, 
            onActivated = v4.useCallback(function()
                if not v37() then
                    v38();
                    v31.fireEvent(v15.CapturesDeleteActivatedInCarousel);
                    if not v20() then
                        v32(v14());
                        return ;
                    else
                        assert(v30.deleteItem ~= nil, "props.deleteItem should not be nil");
                        v30.deleteItem();
                        return ;
                    end;
                else
                    return ;
                end;
            end, {
                v36, 
                v30.deleteItem, 
                v30.isDisabled, 
                v37, 
                v38
            }), 
            showBackground = not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and true or false, 
            size = v27
        })
    });
end));
