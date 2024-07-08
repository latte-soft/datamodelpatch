local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Toast_0 = v3.App.Dialog.Toast;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Colors_0 = v3.App.Style.Colors;
local v7 = require(l_Parent_0.Cryo);
local l_CoPlayFooter_0 = v3.App.Tile.ExperienceTileMetadata.CoPlayFooter;
local l_getLocalizedStrings_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper.getLocalizedStrings;
local v10 = require(l_script_FirstAncestor_0.Enums.SocialContextToastAnalyticsActionTypes);
local v11 = require(l_script_FirstAncestor_0.SocialContextToastEvents);
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
local v13 = Vector2.new(48, 48);
local v14 = Vector2.new(36, 36);
local function _(v15, v16, v17)
    return function(v18)
        local l_Offset_0 = v18.Size.X.Offset;
        local v20 = if #v15 == 1 then l_Offset_0 else (l_Offset_0 - -9) / 2;
        return v2.createElement(l_CoPlayFooter_0, {
            users = v15, 
            size = v18.Size, 
            faceGroupCount = 1, 
            showEmphasisBorder = v17, 
            styleProps = {
                faceWidth = v20, 
                faceHeight = v20, 
                faceGroupGap = -9, 
                badgeHeight = v20, 
                badgeBorderColor = v16.Theme.SystemPrimaryContent, 
                faceBorderColor = v16.Theme.SystemPrimaryContent, 
                faceBackgroundColor = {
                    l_Colors_0.Smoke; 
                    Transparency = 0
                }, 
                showEmphasisBorder = v17
            }
        });
    end;
end;
local v22 = {
    areUsersActive = true
};
return function(v23)
    local v24 = v7.Dictionary.join(v22, v23);
    local v25 = nil;
    if l_GetFFlagSocialContextToastEventStream_0() then
        local l_analyticsProps_0 = v24.analyticsProps;
        local l_l_analyticsProps_0_0 = l_analyticsProps_0 --[[ copy: 3 -> 12 ]];
        v25 = v2.useCallback(function()
            local v28 = nil;
            if v24.userIdList then
                v28 = table.concat(v24.userIdList);
            end;
            v11(l_l_analyticsProps_0_0.eventIngest, {
                toastType = l_l_analyticsProps_0_0.toastType, 
                friendId = v28, 
                universeId = l_l_analyticsProps_0_0.gameId, 
                placeId = l_l_analyticsProps_0_0.placeId, 
                actionType = v10.ForceDismissed
            });
        end);
    end;
    if v24.onActivated == nil then
        if not l_GetFFlagSocialContextToastEventStream_0() then
            v24.onActivated = function()
            end;
        else
            v24.onActivated = v25;
        end;
    end;
    local v29 = l_useStyle_0();
    local v30 = l_getLocalizedStrings_0(v24.toastStrings);
    local l_userIdList_0 = v24.userIdList;
    local l_createElement_0 = v2.createElement;
    local l_l_Toast_0_0 = l_Toast_0;
    local v34 = {
        duration = 6
    };
    local v35 = {};
    local v36;
    if l_userIdList_0 then
        local l_areUsersActive_0 = v24.areUsersActive;
        v36 = function(v38)
            local l_Offset_1 = v38.Size.X.Offset;
            local v40 = if #l_userIdList_0 == 1 then l_Offset_1 else (l_Offset_1 - -9) / 2;
            return v2.createElement(l_CoPlayFooter_0, {
                users = l_userIdList_0, 
                size = v38.Size, 
                faceGroupCount = 1, 
                showEmphasisBorder = l_areUsersActive_0, 
                styleProps = {
                    faceWidth = v40, 
                    faceHeight = v40, 
                    faceGroupGap = -9, 
                    badgeHeight = v40, 
                    badgeBorderColor = v29.Theme.SystemPrimaryContent, 
                    faceBorderColor = v29.Theme.SystemPrimaryContent, 
                    faceBackgroundColor = {
                        l_Colors_0.Smoke; 
                        Transparency = 0
                    }, 
                    showEmphasisBorder = l_areUsersActive_0
                }
            });
        end;
        if v36 then
            goto label0;
        end;
    end;
    v36 = nil;
    ::label0::;
    v35.iconImage = v36;
    v35.toastTitle = v30.label;
    v35.iconSize = if not not l_userIdList_0 and #l_userIdList_0 > 1 then v13 else v14;
    v35.onActivated = v24.onActivated;
    v35.buttonText = v30.button;
    v35.buttonType = v24.buttonType;
    v35.onTouchSwipeUp = if not l_GetFFlagSocialContextToastEventStream_0() then nil else v25;
    v34.toastContent = v35;
    return l_createElement_0(l_l_Toast_0_0, v34);
end;
