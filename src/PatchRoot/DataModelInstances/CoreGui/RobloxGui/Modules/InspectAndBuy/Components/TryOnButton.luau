local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Colors);
local v9 = require(l_Parent_0.Constants);
local v10 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v11 = require(l_Parent_0.Thunks.TryOnItem);
local v12 = require(l_Parent_0.getSelectionImageObjectRounded);
local v13 = require(l_Parent_0.Flags.FFlagEnableFavoriteButtonForUgc);
local l_TryOn_0 = require(script.Parent.Common.ControllerShortcutKeycodes).TryOn;
local v15 = v4.PureComponent:extend("TryOnButton");
v15.init = function(v16)
    v16.selectedImage = v12();
    l_ContextActionService_0:BindCoreAction("TryOnGamepadShortcut", function(_, v18, _)
        if v18 == Enum.UserInputState.End then
            v16:activateButton();
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, l_TryOn_0);
end;
v15.activateButton = function(v20)
    if v20.props.showTryOn then
        local l_assetInfo_0 = v20.props.assetInfo;
        local l_tryOnItem_0 = v20.props.tryOnItem;
        local l_takeOffItem_0 = v20.props.takeOffItem;
        local l_tryingOn_0 = v20.props.tryingOnInfo.tryingOn;
        local l_partOfBundleAndOffsale_0 = v20.props.partOfBundleAndOffsale;
        local l_bundleId_0 = v20.props.bundleId;
        local l_l_assetInfo_0_0 = l_assetInfo_0;
        if l_l_assetInfo_0_0 then
            l_l_assetInfo_0_0 = v20.props.localPlayerModel;
            if l_l_assetInfo_0_0 then
                l_l_assetInfo_0_0 = false;
                if v9.LayeredAssetTypes[l_assetInfo_0.assetTypeId] ~= nil then
                    l_l_assetInfo_0_0 = v20.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6;
                end;
            end;
        end;
        if not l_l_assetInfo_0_0 then
            if not l_tryingOn_0 then
                l_tryOnItem_0(true, l_assetInfo_0.assetId, l_assetInfo_0.assetTypeId, l_partOfBundleAndOffsale_0, l_bundleId_0);
            else
                l_takeOffItem_0();
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v15.willUnmount = function(_)
    l_ContextActionService_0:UnbindCoreAction("TryOnGamepadShortcut");
end;
v15.render = function(v29)
    local l_tryingOn_1 = v29.props.tryingOnInfo.tryingOn;
    local l_showTryOn_0 = v29.props.showTryOn;
    local l_locale_0 = v29.props.locale;
    local l_assetInfo_1 = v29.props.assetInfo;
    local v34 = not not l_assetInfo_1 and l_assetInfo_1.creatorId or 0;
    local l_tryOnButtonRef_0 = v29.props.tryOnButtonRef;
    local v36 = if not v13 then v34 == "1" and -32 or -5 else -32;
    local v37 = nil;
    v37 = not l_tryingOn_1 and "InGame.InspectMenu.Action.TryOn" or "InGame.InspectMenu.Action.TakeOff";
    local l_l_assetInfo_1_0 = l_assetInfo_1;
    if l_l_assetInfo_1_0 then
        l_l_assetInfo_1_0 = v29.props.localPlayerModel;
        if l_l_assetInfo_1_0 then
            l_l_assetInfo_1_0 = false;
            if v9.LayeredAssetTypes[l_assetInfo_1.assetTypeId] ~= nil then
                l_l_assetInfo_1_0 = v29.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6;
            end;
        end;
    end;
    return v4.createElement("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, v36, 0, 44), 
        Visible = l_showTryOn_0, 
        LayoutOrder = 2, 
        Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png", 
        ImageTransparency = not l_l_assetInfo_1_0 and 0 or 0.5, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(5, 5, 120, 20)
    }, {
        SelectionGainedImage = v4.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = false, 
            Image = "rbxasset://textures/ui/InspectMenu/Button_white.png", 
            ImageColor3 = v8.Pumice
        }), 
        TryOnTextKey = v4.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v3:FormatByKeyForLocale(v37, l_locale_0), 
            Font = l_AppFonts_0.default:getDefault(), 
            TextSize = 16, 
            TextColor3 = v8.White, 
            TextTransparency = not l_l_assetInfo_1_0 and 0 or 0.5, 
            SelectionImageObject = v29.selectedImage, 
            ZIndex = 2, 
            [v4.Event.SelectionGained] = function(v39)
                v39.Parent.SelectionGainedImage.Visible = true;
                v39.TextColor3 = v8.Carbon;
            end, 
            [v4.Event.SelectionLost] = function(v40)
                v40.Parent.SelectionGainedImage.Visible = false;
                v40.TextColor3 = v8.White;
            end, 
            [v4.Ref] = l_tryOnButtonRef_0, 
            [v4.Event.Activated] = function()
                v29:activateButton();
            end
        })
    });
end;
return v5.UNSTABLE_connect2(function(v41, _)
    return {
        locale = v41.locale, 
        view = v41.view, 
        assetInfo = v41.assets[v41.detailsInformation.assetId], 
        bundleInfo = v41.bundles, 
        tryingOnInfo = v41.tryingOnInfo
    };
end, function(v43)
    return {
        tryOnItem = function(v44, v45, v46, v47, v48)
            v43(v11(v44, v45, v46, v47, v48));
        end, 
        takeOffItem = function()
            v43(v10(false, nil, nil));
        end
    };
end)(v15);
