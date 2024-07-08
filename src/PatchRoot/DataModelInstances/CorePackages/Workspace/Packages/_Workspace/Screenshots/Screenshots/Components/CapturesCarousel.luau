local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(l_Parent_1.AppCommonLib);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.RobloxAppHooks);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useSignal_0 = v6.Hooks.useSignal;
local v12 = require(l_Parent_0.Components.CarouselItem);
local v13 = require(l_Parent_0.Components.CarouselNavArrow);
local v14 = require(l_Parent_0.Thunks.CarouselScrolled);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_Parent_0.Analytics.EventNames);
local v17 = require(l_Parent_0.Utils.getClosestItemToCenter);
local _ = require(l_Parent_0.Types);
local v19 = require(l_Parent_0.Analytics.useAnalytics);
local v20 = require(l_Parent_0.Hooks.useCarouselController);
local l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 = require(l_Parent_1.SharedFlags).FFlagCapturesCarouselCTABarUIUpdateEnabled;
local function _(v22, v23, v24)
    local l_v23_0 = v23;
    local v26 = math.floor(l_v23_0 * v22);
    if v24 < v26 then
        v26 = v24;
        l_v23_0 = math.floor(v26 / v22);
    end;
    return Vector2.new(math.floor(v26), (math.floor(l_v23_0)));
end;
local function _(v28, v29)
    local l_X_0 = (v29 - v28).X;
    if l_X_0 % 2 == 0 then
        local v31 = l_X_0 / 2;
        return v31, v31;
    else
        local v32 = math.floor(l_X_0 / 2);
        return v32 + 1, v32;
    end;
end;
local function _()
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v35 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v35 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    return (v35 and l_UserInputService_0.TouchEnabled) and not l_UserGameSettings_0.ReducedMotion;
end;
return function(v37)
    local v38 = v19();
    local v39 = l_useDispatch_0();
    local v40 = l_useScreenSize_0();
    local v42 = l_useSelector_0(function(v41)
        return v41.Screenshots.Captures;
    end);
    local v44 = l_useSelector_0(function(v43)
        return v43.Screenshots.Carousel.SelectedCaptureIndex;
    end);
    local v45, v46 = v5.useState(v44);
    local v47 = v40.X / v40.Y;
    local v48 = math.clamp(math.floor(v40.X * (not (v47 > 1) and 0.075 or 0.15)), 50, 200);
    local v49 = math.floor(v48 * 0.2);
    local l_maxHeight_0 = v37.maxHeight;
    local v51 = v40.X - v48 * 2;
    local v52;
    if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then
        local l_l_maxHeight_0_0 = l_maxHeight_0;
        local v54 = math.floor(l_l_maxHeight_0_0 * v47);
        if v51 < v54 then
            v54 = v51;
            l_l_maxHeight_0_0 = math.floor(v54 / v47);
        end;
        v52 = Vector2.new(math.floor(v54), (math.floor(l_l_maxHeight_0_0)));
    else
        v52 = Vector2.new(math.floor(v51), (math.floor(l_maxHeight_0)));
    end;
    local v55 = v52.X * #v42;
    local l_X_1 = (v40 - v52).X;
    local v57, v58;
    if l_X_1 % 2 == 0 then
        local v59 = l_X_1 / 2;
        v57 = v59;
        v58 = v59;
    else
        local v60 = math.floor(l_X_1 / 2);
        v57 = v60 + 1;
        v58 = v60;
    end;
    l_X_1 = v20(v52, v44, (v5.useCallback(function(v61)
        if not (v61 >= 1) or #v42 < v61 then
            return ;
        else
            v38.fireEvent(v16.CapturesCarouselScrolled, {
                direction = v61 < v44 and v15.CarouselDirection.Left or v15.CarouselDirection.Right
            });
            v39(v14(v61));
            return ;
        end;
    end, {
        v42, 
        v44
    })));
    local l_carouselRef_0 = l_X_1.carouselRef;
    local l_carouselInputBegan_0 = l_X_1.carouselInputBegan;
    local l_carouselInputEnded_0 = l_X_1.carouselInputEnded;
    local l_deleteSelectedItem_0 = l_X_1.deleteSelectedItem;
    local l_selectedItemFadeOutBinding_0 = l_X_1.selectedItemFadeOutBinding;
    local l_postDeletionItemBinding_0 = l_X_1.postDeletionItemBinding;
    local l_selectedItemRef_0 = l_X_1.selectedItemRef;
    l_useSignal_0(v37.deleteItemSignal, (v5.useCallback(function(v69)
        l_deleteSelectedItem_0(v69);
    end, {
        l_deleteSelectedItem_0
    })));
    local v72 = v5.useCallback(function(v70)
        local v71 = v17(v52, v70);
        if v71 ~= v45 then
            v46(v71);
        end;
    end, {
        v52, 
        v45, 
        v46
    });
    local v76 = v5.useCallback(function(v73, v74)
        if not (v45 + 3 >= v74) or v74 < v45 - 3 then
            return nil;
        else
            local v75 = true;
            if v74 ~= v45 - 1 then
                v75 = false;
                if v45 == 1 then
                    v75 = v74 == 2;
                end;
            end;
            return v5.createElement(v12, {
                capture = v73, 
                fadeOutBinding = if v74 == v44 then l_selectedItemFadeOutBinding_0 else nil, 
                transitionBinding = if v74 == v44 then l_selectedItemFadeOutBinding_0 else if v75 then l_postDeletionItemBinding_0 else nil, 
                imagePadding = v49, 
                itemIndex = v74, 
                itemSize = v52, 
                unfocusedSizeMultiplier = 0.8
            });
        end;
    end, {
        v52, 
        v45, 
        v49, 
        l_postDeletionItemBinding_0, 
        v44, 
        l_selectedItemFadeOutBinding_0
    });
    local v80 = v5.useMemo(function()
        local v77 = {
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            })
        };
        for v78, v79 in v42, nil, nil do
            v77[v79.contentId] = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v78, 
                Size = UDim2.fromOffset(v52.X, v52.Y), 
                ref = if v78 == v44 then l_selectedItemRef_0 else nil
            }, {
                Item = v76(v79, v78)
            });
        end;
        return v77;
    end, {
        v42, 
        v52, 
        v76, 
        v44
    });
    local v81 = math.floor(v52.Y * 0.8);
    local v82 = v45 > 1;
    local v83 = v45 < #v42;
    local v84 = v82 or v83;
    local l_createElement_0 = v5.createElement;
    local v86 = "Frame";
    local v87 = {
        BackgroundTransparency = 1, 
        LayoutOrder = v37.LayoutOrder, 
        Size = if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then UDim2.new(1, 0, 0, v52.Y) else UDim2.new(1, 0, 0, v37.maxHeight), 
        ZIndex = v37.ZIndex
    };
    local v88 = {};
    local l_createElement_1 = v5.createElement;
    local v90 = "ScrollingFrame";
    local v91 = {
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.new(0, v55, 1, 0), 
        ClipsDescendants = false, 
        Position = UDim2.fromOffset(v57, 0), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.X
    };
    local l_v84_0 = v84;
    if l_v84_0 then
        local l_l_UserInputService_0_Platform_1 = l_UserInputService_0:GetPlatform();
        local v94 = true;
        if l_l_UserInputService_0_Platform_1 ~= Enum.Platform.IOS then
            v94 = l_l_UserInputService_0_Platform_1 == Enum.Platform.Android;
        end;
        l_v84_0 = (v94 and l_UserInputService_0.TouchEnabled) and not l_UserGameSettings_0.ReducedMotion;
    end;
    v91.ScrollingEnabled = l_v84_0;
    v91.Size = UDim2.fromOffset(v52.X, v52.Y);
    v91[v5.Change.CanvasPosition] = v72;
    v91[v5.Event.InputBegan] = l_carouselInputBegan_0;
    v91[v5.Event.InputEnded] = l_carouselInputEnded_0;
    v91.ref = l_carouselRef_0;
    v88.AnimatedCarousel = l_createElement_1(v90, v91, v80);
    v88.LeftArrow = v82 and v5.createElement(v13, {
        direction = v15.CarouselDirection.Left, 
        isDisabled = v37.isDisabled, 
        Size = UDim2.fromOffset(v57 - v49, v81), 
        ZIndex = 2
    });
    v88.RightArrow = v83 and v5.createElement(v13, {
        direction = v15.CarouselDirection.Right, 
        isDisabled = v37.isDisabled, 
        Size = UDim2.fromOffset(v58 - v49, v81), 
        ZIndex = 2
    });
    return l_createElement_0(v86, v87, v88);
end;
