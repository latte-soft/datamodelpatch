local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_utils_0 = l_Parent_1.utils;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_1.FriendsMenuDependencies);
local v6 = require(l_Parent_1.Constants);
local _ = require(l_Parent_1.friendsMenuModalType);
local v8 = require(l_Parent_2.React);
local l_Requests_0 = require(l_Parent_2.Http).Requests;
local v10 = require(l_Parent_2.UserLib);
local v11 = require(l_Parent_2.RoactUtils);
local v12 = require(l_Parent_2.UserProfiles);
local v13 = require(l_Parent_2.SharedFlags);
local l_FFlagFixPreloadingThumbsNilEntries_0 = v13.FFlagFixPreloadingThumbsNilEntries;
local l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 = v13.GetFFlagEnableFriendsListSearchNormalizationErrorFix;
local l_UserModel_0 = v10.Models.UserModel;
local l_Constants_0 = v10.Utils.Constants;
local l_ApiFetchUsersPresences_0 = v10.Thunks.ApiFetchUsersPresences;
local l_UpdateUsers_0 = v10.Thunks.UpdateUsers;
local l_ThumbnailRequest_0 = v10.Utils.ThumbnailRequest;
local l_PreloadUsersThumbnail_0 = v10.Thunks.PreloadUsersThumbnail;
local l_networkImpl_0 = v5.networkImpl;
local l_sortFriendsByCorrectedPresenceAndRank_0 = v5.sortFriendsByCorrectedPresenceAndRank;
local l_useSelector_0 = v11.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local v26 = require(l_Parent_0.FriendsListContext);
local v27 = require(l_utils_0.generateDummyFriends);
local l_DEPRECATED_UsersGetFriends_0 = l_Requests_0.DEPRECATED_UsersGetFriends;
local l_UserSorts_0 = v6.UserSorts;
local v30 = {
    InviteAvatarThumbnailType = l_Constants_0.RbxAvatarThumbnailTypesFromEnum.HeadShot, 
    InviteAvatarThumbnailSize = l_Constants_0.RbxThumbnailSizes.Size150x150, 
    InviteAvatarRbxthumbType = l_Constants_0.RbxthumbTypes.AvatarHeadShot
};
v30.ThumbnailRequest = {
    InviteToGame = {
        l_ThumbnailRequest_0.fromData(v30.InviteAvatarThumbnailType, v30.InviteAvatarThumbnailSize)
    }
};
return function(v31)
    local v32 = nil;
    v32 = if not v31.networkImplOverride then l_networkImpl_0 else v31.networkImplOverride;
    local v33, v34 = v8.useState(false);
    local v35, v36 = v8.useState(false);
    local v37, v38 = v8.useState({});
    local v39, v40 = v8.useState("");
    local v41, v42 = v8.useState((v27(7)));
    local v43 = l_useDispatch_0();
    local v44 = nil;
    v44 = v12.Hooks.useUserProfilesFetch({
        userIds = v37, 
        query = v12.Queries.userProfilesAllNamesByUserIds
    });
    local function v59(v45)
        if v45 and v45.isFriend then
            if not (v39 ~= nil) or v39 == "" then
                return true;
            else
                local v46 = v45.displayName or "";
                local v47 = v45.name or "";
                local v48 = "";
                local v49 = "";
                local v50 = "";
                if not (not v44 or not v44.data) then
                    local l_names_0 = v12.Selectors.getUserProfileFromId(v44.data, v45.id).names;
                    if l_names_0 then
                        v48 = l_names_0.alias or "";
                        v46 = l_names_0.displayName or "";
                        v47 = l_names_0.username or "";
                        v49 = l_names_0.contactName or "";
                        v50 = l_names_0.platformName or "";
                    end;
                end;
                local v52 = utf8.nfdnormalize(v46);
                local v53 = utf8.nfdnormalize(v48);
                local v54 = utf8.nfdnormalize(v49);
                local v55 = utf8.nfdnormalize(v50);
                local v56 = nil;
                if not l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0() then
                    v56 = utf8.nfdnormalize(v39);
                else
                    pcall(function()
                        v56 = utf8.nfdnormalize(v39);
                    end);
                end;
                if not l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0() then
                    local v57 = true;
                    if string.find(v53:lower(), v56:lower(), 1, true) == nil then
                        v57 = true;
                        if string.find(v54:lower(), v56:lower(), 1, true) == nil then
                            v57 = true;
                            if string.find(v55:lower(), v56:lower(), 1, true) == nil then
                                v57 = true;
                                if string.find(v52:lower(), v56:lower(), 1, true) == nil then
                                    v57 = string.find(v47:lower(), v39:lower(), 1, true) ~= nil;
                                end;
                            end;
                        end;
                    end;
                    return v57;
                else
                    local v58;
                    if v56 then
                        v58 = true;
                        if string.find(v53:lower(), v56:lower(), 1, true) == nil then
                            v58 = true;
                            if string.find(v54:lower(), v56:lower(), 1, true) == nil then
                                v58 = true;
                                if string.find(v55:lower(), v56:lower(), 1, true) == nil then
                                    v58 = true;
                                    if not (string.find(v52:lower(), v56:lower(), 1, true) == nil) then
                                        goto label0;
                                    end;
                                else
                                    goto label0;
                                end;
                            else
                                goto label0;
                            end;
                        else
                            goto label0;
                        end;
                    end;
                    v58 = string.find(v47:lower(), v39:lower(), 1, true) ~= nil;
                    ::label0::;
                    return v58;
                end;
            end;
        else
            return false;
        end;
    end;
    local function _(v60)
        if not v44 or not v44.data then
            return v60.displayName;
        else
            return v12.Selectors.getCombinedNameFromId(v44.data, v60.id);
        end;
    end;
    v8.useEffect(function()
        local v62 = nil;
        if not (not l_Players_0 or not l_Players_0.LocalPlayer) then
            v62 = tostring(l_Players_0.LocalPlayer.UserId);
        end;
        if not (v33 or not v62) then
            v34(true);
            v36(false);
            if not l_FFlagFixPreloadingThumbsNilEntries_0 then
                l_DEPRECATED_UsersGetFriends_0(v32, v62, l_UserSorts_0.StatusFrequents):andThen(function(v63)
                    local l_responseBody_0 = v63.responseBody;
                    local v65 = {};
                    local v66 = {};
                    for v67, v68 in pairs(l_responseBody_0.data) do
                        local v69 = tostring(v68.id);
                        v68.isFriend = true;
                        v68.friendRank = v67;
                        local v70 = l_UserModel_0.fromDataTable(v68);
                        table.insert(v65, v69);
                        v66[v70.id] = v70;
                    end;
                    v43(l_UpdateUsers_0(v66));
                    v38(v65);
                    return v65;
                end, function(_)
                    v34(false);
                    v36(true);
                    return {};
                end):andThen(function(v72)
                    v43(l_PreloadUsersThumbnail_0(v72, v30.ThumbnailRequest.InviteToGame));
                    return v43(l_ApiFetchUsersPresences_0(v32, v72));
                end):andThen(function(_)
                    v34(false);
                end, function(_)
                    v34(false);
                    v36(true);
                end);
            else
                l_DEPRECATED_UsersGetFriends_0(v32, v62, l_UserSorts_0.StatusFrequents):andThen(function(v75)
                    local l_responseBody_1 = v75.responseBody;
                    local v77 = {};
                    local v78 = {};
                    for v79, v80 in pairs(l_responseBody_1.data) do
                        local v81 = tostring(v80.id);
                        v80.isFriend = true;
                        v80.friendRank = v79;
                        local v82 = l_UserModel_0.fromDataTable(v80);
                        table.insert(v77, v81);
                        v78[v82.id] = v82;
                    end;
                    v43(l_UpdateUsers_0(v78));
                    v38(v77);
                    return v77;
                end):andThen(function(v83)
                    v43(l_PreloadUsersThumbnail_0(v83, v30.ThumbnailRequest.InviteToGame));
                    return v43(l_ApiFetchUsersPresences_0(v32, v83));
                end):andThen(function()
                    v34(false);
                end):catch(function()
                    v34(false);
                    v36(true);
                    return {};
                end);
                return ;
            end;
        end;
    end, {});
    local v85 = l_useSelector_0(function(v84)
        return v84.Users;
    end);
    v8.useEffect(function()
        if not v33 then
            local v86 = {};
            for _, v88 in pairs(v85) do
                if v59(v88) then
                    v86[#v86 + 1] = v88;
                    v88.displayName = if not not v44 and v44.data then v12.Selectors.getCombinedNameFromId(v44.data, v88.id) else v88.displayName;
                end;
            end;
            table.sort(v86, l_sortFriendsByCorrectedPresenceAndRank_0);
            v42(v86);
            return ;
        else
            v42(v27(7));
            return ;
        end;
    end, {
        v85, 
        v39, 
        tostring(v33), 
        (tostring(v44 and v44.loading))
    });
    return v8.createElement(v26.Provider, {
        value = {
            friends = v41, 
            hasFriends = #v37 > 0, 
            isFetchingFriends = v33 or v31.isLoadingCustomParams, 
            isFriendsListFetchFailed = v35, 
            friendsNames = {
                loading = v44 and v44.loading
            }, 
            searchFriends = v40, 
            searchFriendsString = v39
        }
    }, v31.children);
end;
