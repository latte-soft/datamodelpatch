local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Promise);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v4.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local v15 = require(script.Parent.Utils.searchFilterPredicate);
local v16 = require(script.Parent.Utils.sortComparator);
local v17 = require(script.Parent.SelectChatMembers);
local v18 = require(script.Parent.Utils.selectFriends);
local v22 = {
    topBarHeight = 64, 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    filterPredicate = v15, 
    sortComparator = v16, 
    conversation = {
        participants = {}
    }, 
    navigateToToast = function(_)
    end, 
    selectedUsersChanged = function(_, _)
    end
};
SelectChatMembersContainer = function(v23)
    local v24 = v3.Dictionary.join(v22, v23);
    local v25, v26 = l_useState_0({});
    local v28 = l_useSelector_0(l_useCallback_0(function(v27)
        return v18(v27, v24.conversation);
    end, l_dependencyArray_0(v24.conversation)));
    local v30 = l_useCallback_0(function(v29)
        if v25 and #v25 == v24.maxSelections then
            return v5.reject();
        else
            return v5.resolve(v3.List.join(v25, {
                v29
            }));
        end;
    end, l_dependencyArray_0(v25, v24.maxSelections));
    local v33 = l_useCallback_0(function(v31)
        return v5.resolve(v3.List.filter(v25, function(v32)
            return v32.id ~= v31;
        end));
    end, l_dependencyArray_0(v25));
    local v37 = l_useCallback_0(function(v34)
        for _, v36 in pairs(v25) do
            if v36.id == v34.id then
                return true;
            end;
        end;
        return false;
    end, l_dependencyArray_0(v25));
    local function _(v38)
        if not v37(v38) then
            return v30(v38);
        else
            return v33(v38.id);
        end;
    end;
    local function v41(v40)
        v24.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v40
                }
            }
        });
    end;
    local v42 = l_usePrevious_0(v25);
    l_useEffect_0(function()
        if v25 ~= v42 then
            v24.selectedUsersChanged(v25, v24.minSelections);
        end;
    end, l_dependencyArray_0(v25));
    local v43 = l_useStyle_0();
    local v44 = l_useLocalization_0({
        systemButtonText = v24.systemButtonText, 
        pageHeaderText = v24.pageHeaderText, 
        searchFriendsText = "Feature.Friends.Label.SearchFriends", 
        offlinePresenceText = "Common.Presence.Label.Offline", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        networkErrorText = "Feature.Chat.Response.NetworkError", 
        tooManyFriendsText = {
            "Feature.Chat.Message.ToastText"; 
            friendNum = 5
        }
    });
    return v4.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v43.Theme.BackgroundUIDefault.Color, 
        BorderSizePixel = 0, 
        Active = true, 
        AutoButtonColor = false
    }, {
        content = v4.createElement(v17, (v3.Dictionary.join(v24, v44, {
            onEntryActivated = function(v45)
                (if not v37(v45) then v30(v45) else v33(v45.id)):andThen(function(v46)
                    v26(v46);
                end):catch(function()
                    v41(v44.tooManyFriendsText);
                end);
            end, 
            selectedUsers = v25, 
            friendEntries = v28
        })))
    });
end;
return l_memo_0(SelectChatMembersContainer);
