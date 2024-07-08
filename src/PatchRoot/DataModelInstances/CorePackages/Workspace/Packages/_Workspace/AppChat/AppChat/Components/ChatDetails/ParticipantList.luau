local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_Parent_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v10 = require(script.Parent.Logger);
local l_presenceSortComparator_0 = v2.Utils.presenceSortComparator;
local l_SortedList_0 = v2.Components.SortedList;
local v13 = if not v2.Flags.getFFlagDeprecatedSocialLibrariesCells() then v2.Components.Cells.UserCell else require(l_script_FirstAncestor_0.Components.Cells.UserCell);
local v15 = {
    entries = {}, 
    entryHeight = 64, 
    onEntryActivated = function(_)
        v10:warning("onEntryActivated was not passed to ParticipantList");
    end, 
    shouldUseExpandedCell = false, 
    sortComparator = l_presenceSortComparator_0, 
    LayoutOrder = 0
};
ParticipantList = function(v16)
    local v17 = v3.Dictionary.join(v15, v16);
    local v18 = l_useStyle_0();
    local function v22(v19, v20)
        local _ = nil;
        return v4.createElement(v13, {
            boldTitle = true, 
            showDivider = not not v17.shouldUseExpandedCell or not v20, 
            subTitleText = if v19.presenceText == "Common.Presence.Label.Online" then v17.onlinePresenceText else if v19.presenceText == "Common.Presence.Label.Offline" then v17.offlinePresenceText else v19.presenceText, 
            style = v18, 
            user = v19, 
            childWidth = v17.childWidth, 
            onActivated = function()
                v17.onEntryActivated(v19);
            end, 
            shouldUseExpandedCell = v17.shouldUseExpandedCell
        }, v19.children);
    end;
    local v23 = {};
    for _, v25 in pairs(v17.entries) do
        local v26 = {};
        if not v25.isLocalUser then
            v26.children = {
                dots = v4.createElement("Frame", {
                    Size = UDim2.new(0, 64, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    Dots = v4.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/common/more"], 
                        ImageColor3 = v18.Theme.IconEmphasis.Color, 
                        ImageTransparency = v18.Theme.IconEmphasis.Transparency, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        ScaleType = Enum.ScaleType.Slice, 
                        Size = UDim2.new(0, 36, 0, 36)
                    })
                })
            };
        end;
        table.insert(v23, v3.Dictionary.join(v26, v25));
    end;
    return v4.createElement(l_SortedList_0, {
        entries = v23, 
        entryHeight = v17.entryHeight, 
        renderEntry = v22, 
        sortComparator = v17.sortComparator, 
        LayoutOrder = v17.LayoutOrder
    });
end;
return l_memo_0(ParticipantList);
