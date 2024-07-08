local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v4 = require(script.Parent.ConversationEntry);
local l_BidirectionalFlatList_0 = require(l_Parent_0.VirtualizedList).BidirectionalFlatList;
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.Cryo);
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v10 = require(script.Parent.ConversationGroupsEntry);
local v11 = require(script.Parent.UnfilteredThreads.PhoneVerificationUpsellContainer);
local v12 = require(script.Parent.UnfilteredThreads.UnfilteredAccessContainer);
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTabHideGroupsLinkOnVR);
local v14 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatLastConversationHiddenFix);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableNewChatTabGroupsLinkDisappearingFix);
local v17 = v2.PureComponent:extend("ConversationList");
v17.defaultProps = {
    focusIndex = 1, 
    focusLock = {}, 
    itemList = {}, 
    loadNext = nil, 
    loadPrevious = nil, 
    onActivated = nil, 
    isDebugEnabled = false, 
    Size = UDim2.fromScale(1, 1), 
    LayoutOrder = 1, 
    onScrollUpdate = function()
    end, 
    entryHeight = 64, 
    shouldShowPhoneVerificationUpsell = false, 
    shouldShowUnfilteredAccessFtux = false, 
    dismissUnfilteredThreadsFtux = function()
    end
};
v17.init = function(v18)
    v17.ENTRY_HEIGHT = not l_default_0.isEnabled() and 64 or v18.props.entryHeight;
    v18.onScrollUpdate = function(v19)
        v18.currentAnchor = math.floor(v19.CanvasPosition.Y / 64);
        v18.props.onScrollUpdate(v19);
    end;
    v18.focusLock = v18.props.focusLock;
    v18.identifier = function(v20)
        if v20 then
            return v20.id .. tostring(v20.unixTime);
        else
            return nil;
        end;
    end;
    v18.renderItem = function(v21, _)
        local l_item_0 = v21.item;
        if not v14() or not l_item_0.isPhoneVerificationUpsell then
            if not v14() or not l_item_0.isUnfilteredAccessFtux then
                if not l_default_0.isEnabled() or not l_item_0.isGroupLink then
                    return v2.createElement(v4, {
                        boldTitle = false, 
                        entryHeight = v18.ENTRY_HEIGHT, 
                        conversation = l_item_0, 
                        onActivated = v18.props.onActivated, 
                        key = "ConversationEntry" .. tostring(l_item_0.id)
                    }, v18.props.isDebugEnabled and {
                        debugCell = v2.createElement("StringValue", {
                            Value = tostring(l_item_0.id)
                        })
                    });
                else
                    return v2.createElement(v10, {
                        entryHeight = v18.ENTRY_HEIGHT, 
                        navigateToGroups = function()
                        end, 
                        key = "ConversationGroupsEntry"
                    });
                end;
            else
                return v2.createElement(v12, {
                    dismissUpsell = v18.props.dismissUnfilteredThreadsFtux
                });
            end;
        else
            return v2.createElement(v11, {
                dismissUpsell = v18.props.dismissUnfilteredThreadsFtux
            });
        end;
    end;
    v18.ref = v2.createRef();
end;
v17.willUpdate = function(v24, v25, _)
    if (v25.filterText and v25.filterText ~= "") and v25.filterText ~= v24.props.filterText then
        v24.focusLock = v25.filterText;
        return ;
    else
        if (not (not v25.itemList[1] or not v24.props.itemList[1]) and v25.itemList[1].id ~= v24.props.itemList[1].id) and v24.currentAnchor == 1 then
            v24.focusLock = {};
        end;
        return ;
    end;
end;
v17.render = function(v27)
    local l_itemList_0 = v27.props.itemList;
    local v29 = true;
    if v27.props.filterText ~= "" then
        v29 = v27.props.filterText == nil;
    end;
    local v30 = not v13() and true or not l_IsVRAppBuild_0();
    if not (((not l_default_0.isEnabled() or not l_default_0:getConnectTabLeadsToChatTab()) or not if not v16() then v27.props.filterText == "" else v29) or not v30) then
        l_itemList_0 = v7.List.join({
            {
                id = "ConversationGroupsEntry", 
                isGroupLink = true
            }
        }, l_itemList_0);
    end;
    local v31 = v27.props.shouldShowPhoneVerificationUpsell or v27.props.shouldShowUnfilteredAccessFtux;
    if not ((not v14() or not v31) or not v29) then
        l_itemList_0 = v7.List.join({
            {
                id = "UnfilteredThreadsFtux", 
                isPhoneVerificationUpsell = v27.props.shouldShowPhoneVerificationUpsell, 
                isUnfilteredAccessFtux = v27.props.shouldShowUnfilteredAccessFtux
            }
        }, l_itemList_0);
    end;
    local function v37(v32)
        return v2.createElement(l_BidirectionalFlatList_0, {
            data = l_itemList_0, 
            renderItem = v27.renderItem, 
            getItemLayout = function(_, v34)
                return {
                    length = v27.ENTRY_HEIGHT, 
                    offset = v27.ENTRY_HEIGHT * (v34 - 1), 
                    index = v34
                };
            end, 
            Size = if not v14() then v27.props.Size else nil, 
            style = {
                BackgroundColor3 = v32.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v32.Theme.BackgroundDefault.Transparency, 
                ScrollBarThickness = 0, 
                BorderSizePixel = if not l_default_0.isEnabled() then nil else 0
            }, 
            contentContainerStyle = {
                BackgroundColor3 = v32.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v32.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = if not l_default_0.isEnabled() then nil else 0
            }, 
            windowSize = 2, 
            initialNumToRender = 15, 
            onScroll = v27.onScrollUpdate, 
            onEndReached = function()
                v27.props.loadNext();
                return v6.resolve();
            end, 
            onStartReached = function()
                if v27.props.loadPrevious then
                    v27.props.loadPrevious();
                end;
                return v6.resolve();
            end, 
            AutomaticCanvasSize = if not v15() then Enum.AutomaticSize.X else Enum.AutomaticSize.XY, 
            CanvasSize = if not v15() then UDim2.new(0, 0, 0, #l_itemList_0 * v27.ENTRY_HEIGHT) else UDim2.fromScale(0, 0), 
            onEndReachedThreshold = v27.ENTRY_HEIGHT * 4, 
            onStartReachedThreshold = v27.ENTRY_HEIGHT * 4, 
            compareItemData = function(v35, v36)
                return v35.id == v36.id;
            end, 
            [v2.Ref] = v27.ref, 
            autoscrollToTopThreshold = 33, 
            enableAutoscrollToTop = true
        });
    end;
    return l_withStyle_0(function(v38)
        if #l_itemList_0 == 0 then
            return v2.createElement("Frame", {
                Size = v27.props.Size, 
                BackgroundColor3 = v38.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v38.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = v27.props.LayoutOrder
            });
        else
            return v37(v38);
        end;
    end);
end;
return v17;
