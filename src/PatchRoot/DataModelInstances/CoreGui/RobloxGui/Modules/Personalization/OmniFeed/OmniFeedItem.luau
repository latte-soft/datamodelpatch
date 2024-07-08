local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_CorePackages_0.FitFrame);
local v8 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v9 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedItemMap);
local v10 = require(l_Modules_0.LuaApp.mutedError);
local v11 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v12 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local v14 = game:DefineFastFlag("FixOmniFeedFocusEscape", false);
local v15 = v3.PureComponent:extend("OmniFeedItem");
v15.validateProps = v4.strictInterface({
    omniFeedItemType = v4.string, 
    layoutOrder = v4.optional(v4.number), 
    zIndex = v4.optional(v4.number), 
    impressionsTag = v4.string, 
    itemIndex = v4.number, 
    feedItemNameId = v4.string, 
    itemProps = v4.optional(v4.table), 
    onAbsoluteSizeChanged = v4.optional(v4.callback), 
    useGridPageLayout = v4.optional(v4.boolean), 
    eventIngest = v4.any
});
v15.init = function(v16)
    v16.feedItemRef = v3.createRef();
    v16.descendantGuiButtons = {};
    v16.addDescendantGuiButton = function(v17)
        local l_v17_Attribute_0 = v17:GetAttribute("GUID");
        if l_v17_Attribute_0 == nil then
            l_v17_Attribute_0 = l_HttpService_0:GenerateGUID();
            v17:SetAttribute("GUID", l_v17_Attribute_0);
        end;
        if v16.descendantGuiButtons[l_v17_Attribute_0] then
            v16.descendantGuiButtons[l_v17_Attribute_0].connection:Disconnect();
            v16.descendantGuiButtons[l_v17_Attribute_0] = nil;
        end;
        v16.descendantGuiButtons[l_v17_Attribute_0] = {
            name = v17.Name, 
            connection = v17.Activated:Connect(function(_)
                if v16.isMounted then
                    v16.props.eventIngest:setRBXEventStream(v11.EventContext, "feedItemClicked", {
                        fullPath = v17:GetFullName(), 
                        treatmentType = v16.props.omniFeedItemType, 
                        feedItemPos = v16.props.layoutOrder, 
                        feedItemNameId = v16.props.feedItemNameId
                    });
                    return ;
                else
                    return ;
                end;
            end)
        };
    end;
    v16.removeDescendantGuiButton = function(v20)
        if not (v20 ~= nil) or not v16.descendantGuiButtons[v20] then
            if not (not v16.isMounted or v16.descendantGuiButtonError) then
                v16.descendantGuiButtonError = true;
                v10((("OmniFeedItem: Expecting descendant button for guid: %*, feedItemNameId: %*"):format(v20, v16.props.feedItemNameId)));
            end;
            return ;
        else
            v16.descendantGuiButtons[v20].connection:Disconnect();
            v16.descendantGuiButtons[v20] = nil;
            return ;
        end;
    end;
    v16.descendantAdded = function(v21)
        if v21 and v21:IsA("GuiButton") then
            v16.addDescendantGuiButton(v21);
            return ;
        else
            return ;
        end;
    end;
    v16.descendantRemoving = function(v22)
        if v22 and v22:IsA("GuiButton") then
            v16.removeDescendantGuiButton((v22:GetAttribute("GUID")));
            return ;
        else
            return ;
        end;
    end;
    v16.addAllDescendantGuiButtons = function()
        local v23 = v16.feedItemRef and v16.feedItemRef.current;
        if v23 then
            local l_v23_Descendants_0 = v23:GetDescendants();
            if l_v23_Descendants_0 then
                for _, v26 in pairs(l_v23_Descendants_0) do
                    v16.descendantAdded(v26);
                end;
            end;
        end;
    end;
    v16.removeAllDescendantGuiButtons = function()
        for v27, _ in pairs(v16.descendantGuiButtons) do
            v16.removeDescendantGuiButton(v27);
        end;
        v16.descendantGuiButtons = {};
    end;
end;
v15.render = function(v29)
    local l_omniFeedItemType_0 = v29.props.omniFeedItemType;
    local l_layoutOrder_0 = v29.props.layoutOrder;
    local v32 = v9.getComponent(l_omniFeedItemType_0);
    if l_omniFeedItemType_0 ~= nil and v32 ~= nil then
        local v33 = v29.props.useGridPageLayout and l_omniFeedItemType_0 == v12.Carousel;
        return v3.createElement(not v33 and "Frame" or v7.FitFrameVertical, {
            width = if not v33 then nil else UDim.new(1, 0), 
            Size = if not v33 then UDim2.new(1, 0, 0, 0) else nil, 
            AutomaticSize = if not v33 then Enum.AutomaticSize.Y else nil, 
            SelectionGroup = not not v14 or nil, 
            SelectionBehaviorLeft = if not v14 then nil else Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = if not v14 then nil else Enum.SelectionBehavior.Stop, 
            LayoutOrder = l_layoutOrder_0, 
            ZIndex = v29.props.zIndex, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v3.Ref] = v29.feedItemRef, 
            [v3.Event.DescendantAdded] = function(_, v35)
                v29.descendantAdded(v35);
            end, 
            [v3.Event.DescendantRemoving] = function(_, v37)
                v29.descendantRemoving(v37);
            end, 
            [v3.Change.AbsoluteSize] = function(v38)
                if v38 then
                    local l_onAbsoluteSizeChanged_0 = v29.props.onAbsoluteSizeChanged;
                    if l_onAbsoluteSizeChanged_0 then
                        l_onAbsoluteSizeChanged_0(v38);
                    end;
                end;
            end
        }, {
            FeedItem = v3.createElement(v32, v29.props.itemProps)
        });
    else
        v10("OmniFeedItem: Unknown omni feed item type: " .. tostring(l_omniFeedItemType_0) .. ", should have already been filtered out.");
        return nil;
    end;
end;
v15.didMount = function(v40)
    v40.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v40.feedItemRef, v40.props.impressionsTag, v40.props.itemIndex);
    v40.addAllDescendantGuiButtons();
end;
v15.willUnmount = function(v41)
    v41.isMounted = false;
    v41.removeAllDescendantGuiButtons();
    l_ImpressionsTagUtility_0.RemoveTag(v41.feedItemRef, v41.props.impressionsTag, v41.props.itemIndex);
end;
v15.didUpdate = function(v42, v43)
    if not (v43.impressionsTag == v42.props.impressionsTag) or v43.itemIndex ~= v42.props.itemIndex then
        l_ImpressionsTagUtility_0.RemoveTag(v42.feedItemRef, v43.impressionsTag, v43.itemIndex);
        l_ImpressionsTagUtility_0.AddTag(v42.feedItemRef, v42.props.impressionsTag, v42.props.itemIndex);
    end;
    if v43.feedItemNameId ~= v42.props.feedItemNameId then
        v42.removeAllDescendantGuiButtons();
        v42.addAllDescendantGuiButtons();
    end;
end;
return l_RoactServices_0.connect({
    eventIngest = v8
})((l_RoactAppPolicy_0.connect(function(v44, _)
    return {
        useGridPageLayout = v44.useGridPageLayout()
    };
end)(v15)));
