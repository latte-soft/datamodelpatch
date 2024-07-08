local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useMemo_0 = v4.useMemo;
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v8 = if not v7() then require(l_script_FirstAncestor_0.SocialLibraries).Components.ChatBubbleContainerAutomaticSize else require(script.Parent.ChatBubbleContainerAutomaticSize);
local v9 = require(l_script_FirstAncestor_0.Components.ChatConversation.GameCardComponents.PlaceIdContainer);
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.GameCardComponents.GameCardContainer);
local v11 = {
    additionalProps = {
        placeId = nil, 
        universeId = nil, 
        senderUserId = nil, 
        onDetailsOpened = function()
        end, 
        openGameDetailsPage = function()
        end
    }, 
    hasTail = false, 
    innerPadding = 0, 
    isIncoming = false, 
    isPending = true, 
    isUnfiltered = false, 
    maxWidth = 0, 
    parentWidth = 0, 
    wideMode = false
};
return function(v12)
    local v13 = v12.additionalProps or v11.additionalProps;
    local v14 = not not v13.placeId and v9 or v10;
    local v15 = v12.parentWidth or v11.parentWidth;
    local v16 = v12.wideMode or v11.wideMode;
    local v17 = if v12.isPending ~= nil then v12.isPending else v11.isPending;
    local v18 = ((v7() and v12.isUnfiltered) and not v12.isIncoming) and not v17;
    return v3.createElement(v8, {
        hasTail = v12.hasTail or v11.hasTail, 
        isIncoming = v12.isIncoming or v11.isIncoming, 
        isPending = v17, 
        isUnfiltered = v12.isUnfiltered, 
        LayoutOrder = v12.LayoutOrder, 
        padding = v12.innerPadding or v11.innerPadding, 
        [v3.Change.AbsoluteSize] = v12[v3.Change.AbsoluteSize]
    }, {
        AssetCard = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v15 - (not v16 and 108 or 224), 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Card = v3.createElement(v14, if not v7() then v13 else l_useMemo_0(function()
                return v2.Dictionary.join(v13, {
                    shouldUseUnfilteredUI = v18
                });
            end, l_dependencyArray_0(v13, v18)))
        })
    });
end;
