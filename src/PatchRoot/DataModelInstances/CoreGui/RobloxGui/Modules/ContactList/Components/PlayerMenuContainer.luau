local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Roact);
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v8 = require(l_RobloxGui_0.Modules.PlayerList.Thunks.BlockPlayer);
local v9 = require(l_ContactList_0.dependencies);
local l_UnfriendTargetUserId_0 = v9.NetworkingFriends.UnfriendTargetUserId;
local l_UIBlox_0 = v9.UIBlox;
local l_useSelector_0 = v9.Hooks.useSelector;
local l_useDispatch_0 = v9.Hooks.useDispatch;
local v14 = nil;
local v15 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v15 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v14 = v9.Hooks.useLocalization;
end;
local v16 = require(l_ContactList_0.Actions.CloseCFM);
local v17 = require(l_ContactList_0.Analytics.useAnalytics);
local v18 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v19 = require(l_ContactList_0.Components.ContactListCommon.ConfigureFriendMenu);
local v20 = require(l_ContactList_0.Enums.FriendAction);
local v21 = require(l_ContactList_0.Actions.UpdateLastFriend);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v27 = not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function()
    local v28 = v17();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v30 = l_useDispatch_0();
    local v32 = l_useSelector_0(function(v31)
        return v31.PlayerMenu.isOpen;
    end);
    local v34 = l_useSelector_0(function(v33)
        return v33.PlayerMenu.friend;
    end);
    local v35 = nil;
    if l_GetFFlagIrisUseLocalizationProvider_0() then
        v35 = v14({
            blockTitle = {
                "Feature.Call.Label.Block"; 
                combinedName = v34.combinedName
            }, 
            blockAction = "Feature.Friends.Action.Block", 
            unfriendTitle = {
                "Feature.Call.Label.Unfriend"; 
                combinedName = v34.combinedName
            }, 
            unfriendAction = "Feature.Friends.Action.Unfriend", 
            cancelAction = "Feature.Friends.Label.Cancel", 
            confirmationDescription = {
                "Feature.SettingsHub.Message.BlockConfirmation"; 
                DISPLAY_NAME = v34.combinedName, 
                RBX_NAME = v34.userName
            }
        });
    end;
    local v36, v37 = v3.useState(v20.NoAction);
    local v38, v39 = v3.useState(Vector2.new(0, 0));
    local v40, v41 = v3.useState("");
    local v42, v43 = v3.useState("");
    local v46 = v3.useCallback(function()
        if v36 == v20.Block then
            v30(v8({
                UserId = v34.userId
            }));
            v30(v21(v34.userId));
            return ;
        else
            if v36 == v20.Unfriend then
                v30((l_UnfriendTargetUserId_0.API({
                    currentUserId = v27, 
                    targetUserId = v34.userId
                }))):andThen(function(_)
                    v28.fireEvent(v18.PhoneBookPlayerMenuUnfriendFinished, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v34.userId, 
                        success = true
                    });
                    v30(v21(v34.userId));
                end):catch(function(_)
                    v28.fireEvent(v18.PhoneBookPlayerMenuUnfriendFinished, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v34.userId, 
                        success = false
                    });
                end);
            end;
            return ;
        end;
    end, {
        v36, 
        v34.userId
    });
    v3.useEffect(function()
        if not l_GetFFlagIrisUseLocalizationProvider_0() then
            if v36 == v20.Block then
                v41(v15:FormatByKey("Feature.Call.Label.Block", {
                    combinedName = v34.combinedName
                }));
                v43(v15:FormatByKey("Feature.Friends.Action.Block"));
                return ;
            elseif v36 == v20.Unfriend then
                v41(v15:FormatByKey("Feature.Call.Label.Unfriend", {
                    combinedName = v34.combinedName
                }));
                v43(v15:FormatByKey("Feature.Friends.Action.Unfriend"));
            end;
        elseif v36 == v20.Block then
            v41(v35.blockTitle);
            v43(v35.blockAction);
            return ;
        elseif v36 == v20.Unfriend then
            v41(v35.unfriendTitle);
            v43(v35.unfriendAction);
            return ;
        end;
    end, {
        v36, 
        v34.combinedName
    });
    local v48 = v3.useCallback(function(v47)
        v37(v47);
    end, {});
    return v3.createElement(v4.Portal, {
        target = l_CoreGui_0
    }, {
        PlayerMenuScreen = v3.createElement("ScreenGui", {
            Enabled = v32, 
            IgnoreGuiInset = true, 
            DisplayOrder = 8, 
            [v3.Change.AbsoluteSize] = function(v49)
                v39(v49.AbsoluteSize);
            end
        }, {
            Overlay = v3.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                [v3.Event.Activated] = function()
                    v30(v16());
                    v37(v20.NoAction);
                end
            }), 
            PlayerMenu = if v36 == v20.NoAction then v3.useMemo(function()
                return v3.createElement(v19, {
                    initiateConfirmation = v48
                });
            end, {}) else v3.useMemo(function()
                return l_withStyle_0(function(_)
                    return v4.createElement(l_InteractiveAlert_0, {
                        title = v40, 
                        bodyText = if not l_GetFFlagIrisUseLocalizationProvider_0() then v15:FormatByKey("Feature.SettingsHub.Message.BlockConfirmation", {
                            DISPLAY_NAME = v34.combinedName, 
                            RBX_NAME = v34.userName
                        }) else v35.confirmationDescription, 
                        buttonStackInfo = {
                            buttons = {
                                {
                                    buttonType = l_ButtonType_0.Secondary, 
                                    props = {
                                        text = if not l_GetFFlagIrisUseLocalizationProvider_0() then v15:FormatByKey("Feature.Friends.Label.Cancel") else v35.cancelAction, 
                                        onActivated = function()
                                            v30(v16());
                                            v37(v20.NoAction);
                                        end
                                    }
                                }, 
                                {
                                    buttonType = l_ButtonType_0.Alert, 
                                    props = {
                                        text = v42, 
                                        onActivated = function()
                                            v46();
                                            v30(v16());
                                            v37(v20.NoAction);
                                        end
                                    }
                                }
                            }
                        }, 
                        screenSize = v38
                    });
                end);
            end, {
                v40, 
                v42, 
                v36, 
                v34.combinedName, 
                v34.userName
            })
        })
    });
end;
