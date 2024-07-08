local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useFocusController_0 = v3.useFocusController;
local l_SlotTray_0 = require(l_CorePackages_0.UIBlox).App.Control.Slot.SlotTray;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v10.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v10.Utils.getRbxthumbWithTypeSizeAndOptions;
local function v14(v13)
    return v13.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
end;
local function v16(v15)
    return v15.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot;
end;
local v17 = v8.wrap(v9.strictInterface({
    slotsCount = v9.integer, 
    lockNavigationCallback = v9.optional(v9.callback), 
    unlockNavigationCallback = v9.optional(v9.callback), 
    onActivated = v9.optional(v9.callback), 
    LayoutOrder = v9.optional(v9.integer), 
    NextSelectionUp = v9.optional(v9.table), 
    NextSelectionDown = v9.optional(v9.table), 
    itemsListRef = v9.table, 
    forwardRef = v9.optional(v9.table), 
    onFocusChanged = v9.optional(v9.callback), 
    itemsListFocused = v9.optional(v9.boolean), 
    darkenItemsGrid = v9.optional(v9.boolean)
}));
local function v18()
end;
local function v43(v19)
    assert(v17(v19));
    local v20 = l_useSelector_0(v14);
    local v21 = l_useSelector_0(v16);
    local v22 = l_useFocusController_0();
    local v23 = v7.useRef(nil);
    local v24, v25 = v7.useState(nil);
    local v27 = v7.useCallback(function(v26)
        v25((math.round(v26.AbsoluteSize.X)));
    end);
    local v28 = v19.lockNavigationCallback or v18;
    local v29 = v19.unlockNavigationCallback or v18;
    v7.useEffect(function()
        return function()
            if v23.current then
                v23.current = nil;
                v28();
            end;
        end;
    end, {
        v28
    });
    local v32 = v7.useCallback(function(_, v31)
        if v31.UserInputState == Enum.UserInputState.Begin then
            v23.current = v31;
            v28();
        end;
    end, {
        v28
    });
    local v35 = v7.useCallback(function(_, v34)
        if v34 == v23.current and v34.UserInputState == Enum.UserInputState.End then
            v23.current = nil;
            v29();
        end;
    end, {
        v29
    });
    local l_slotsCount_0 = v19.slotsCount;
    local v37 = {};
    local v38 = v19.itemsListFocused or v19.darkenItemsGrid;
    for v39 = 1, l_slotsCount_0 do
        local v40 = not not v20[v39] and v20[v39].assetId or nil;
        local v41 = v21 == v39;
        local v42 = nil;
        if v40 then
            v42 = l_getRbxthumbWithTypeSizeAndOptions_0(v40, l_Constants_0.RbxthumbTypes.Asset, 150);
        end;
        v37[v39] = {
            thumbnail = v42, 
            displayText = if not v42 then tostring(v39) else nil, 
            isDisabled = v38 and not v41
        };
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 72), 
        [v2.Change.AbsoluteSize] = v27
    }, {
        SlotTray = v2.createElement(l_SlotTray_0, {
            defaultSelectedSlotIndex = v21, 
            width = v24, 
            inputBindings = {
                SelectSlot = v3.Input.onBegin(Enum.KeyCode.ButtonA, function()
                    v22.moveFocusTo(v19.itemsListRef);
                end, {
                    key = "Feature.Avatar.Action.SelectSlot"
                }), 
                MoveToNav = v3.Input.onBegin(Enum.KeyCode.ButtonB, function()
                    v22.moveFocusUp();
                end)
            }, 
            slots = v37, 
            onChange = v19.onActivated, 
            onInputBegan = v32, 
            onInputEnded = v35, 
            darken = v38, 
            onFocusChanged = v19.onFocusChanged, 
            NextSelectionUp = v19.NextSelectionUp, 
            NextSelectionDown = v19.NextSelectionDown, 
            scrollingFrameRef = v19.forwardRef
        })
    });
end;
return v2.forwardRef(function(v44, v45)
    return v2.createElement(v43, v1.Dictionary.join(v44, {
        forwardRef = v45
    }));
end);
