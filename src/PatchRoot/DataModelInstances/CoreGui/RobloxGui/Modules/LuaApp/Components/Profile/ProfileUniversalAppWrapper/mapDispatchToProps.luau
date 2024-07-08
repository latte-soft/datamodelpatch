local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local v4 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local v5 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local l_NavigateDownToViewUserProfile_0 = v2.Thunks.NavigateDownToViewUserProfile;
local v7 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenProfilePeekView);
local v8 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenAppItemDetails);
local v9 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v11 = require(l_script_FirstAncestor_0.LuaApp.Http.UrlBuilder);
local v12 = require(l_script_FirstAncestor_0.LuaApp.Http.Url);
local v13 = require(l_script_FirstAncestor_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v14 = require(l_script_FirstAncestor_0.LuaApp.Thunks.SetNetworkingErrorToast);
local _ = require(l_CorePackages_0.Packages.Dash);
local l_TextKeys_0 = require(l_script_FirstAncestor_0.Profile).TextKeys;
local _ = require(l_CorePackages_0.Workspace.Packages.ProfileQRCode);
local _ = require(l_CorePackages_0.Workspace.Packages.SocialCommon);
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
return function(v20)
    return {
        navigateBackInAppRoute = function(v21)
            v20(v3(v21));
        end, 
        openViewUserFriends = function(v22, v23)
            if v22 == (v23 and v23.localUserId) then
                v20(v9({
                    name = v10.ViewFriends, 
                    extraProps = {
                        navigateToFriendsLandingEventStart = {
                            startPage = v10.ProfilePeekView, 
                            startTime = v23 and v23.startTime
                        }
                    }
                }, nil));
                return ;
            else
                v20(v9({
                    name = v10.GenericWebPage, 
                    detail = v11.user.friends({
                        userId = v22
                    }), 
                    extraProps = {
                        titleKey = l_TextKeys_0.Friends
                    }
                }, nil));
                return ;
            end;
        end, 
        openViewUserFollowers = function(v24)
            v20(v9({
                name = v10.GenericWebPage, 
                detail = string.format("%susers/%s/friends#/followers", v12.BASE_URL, v24), 
                extraProps = {
                    titleKey = l_TextKeys_0.Followers
                }
            }, nil));
        end, 
        openViewUserFollowing = function(v25)
            v20(v9({
                name = v10.GenericWebPage, 
                detail = string.format("%susers/%s/friends#/following", v12.BASE_URL, v25), 
                extraProps = {
                    titleKey = l_TextKeys_0.Following
                }
            }, nil));
        end, 
        openReportUser = function(v26)
            v20(v9({
                name = v10.GenericWebPage, 
                detail = string.format("%sabusereport/userprofile?id=%s", v12.BASE_URL, v26), 
                extraProps = {
                    titleKey = l_TextKeys_0.Report
                }
            }, nil));
        end, 
        openGameDetailsPeekView = function(v27, v28)
            v20(v4(v27, v28));
        end, 
        openProfileFullPage = function(v29)
            v20(l_NavigateDownToViewUserProfile_0(v29));
        end, 
        openProfilePeekView = function(v30, v31)
            v20(v7(v30, v31));
        end, 
        openAppItemDetails = function(v32, v33, v34)
            v20(v8(v32, v33, v34));
        end, 
        showPurchaseErrorToast = function(v35)
            v20(v13(v35));
        end, 
        showNetworkingErrorToast = function(v36)
            v20(v14(v36));
        end, 
        navigateTo3DQRCodePage = function(v37)
            v20(v5(v37));
        end, 
        enteredChatFromEntryPoint = function(v38)
            v20(l_EnteredChatFromEntryPoint_0(v38));
        end
    };
end;
