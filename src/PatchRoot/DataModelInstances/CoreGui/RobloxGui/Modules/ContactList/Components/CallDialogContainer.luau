local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v9 = require(l_ContactList_0.Actions.OpenOrUpdateDialog);
local v10 = require(l_ContactList_0.dependencies);
local l_UIBlox_0 = v10.UIBlox;
local l_useSelector_0 = v10.Hooks.useSelector;
local l_useDispatch_0 = v10.Hooks.useDispatch;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v17 = require(l_ContactList_0.Enums.ErrorType);
local v18 = require(l_ContactList_0.Actions.CloseDialog);
local v19 = require(l_ContactList_0.Analytics.useAnalytics);
local v20 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v21 = {
    callProtocol = v5.CallProtocol.default
};
return function(v22)
    local v23 = v4.Dictionary.join(v21, v22);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v25 = l_useDispatch_0();
    local v26 = v19();
    local v27, v28 = v2.useState(Vector2.new(0, 0));
    local v32 = l_useSelector_0(function(v29)
        return v29.Dialog.title;
    end, function(v30, v31)
        return v30 == v31;
    end);
    local v36 = l_useSelector_0(function(v33)
        return v33.Dialog.bodyText;
    end, function(v34, v35)
        return v34 == v35;
    end);
    local v40 = l_useSelector_0(function(v37)
        return v37.Dialog.dismissCallback;
    end, function(v38, v39)
        return v38 == v39;
    end);
    local v44 = l_useSelector_0(function(v41)
        return v41.Dialog.isOpen;
    end, function(v42, v43)
        return v42 == v43;
    end);
    v2.useEffect(function()
        local v46 = v23.callProtocol:listenToHandleCallMessage(function(v45)
            if v45.messageType == v5.Enums.MessageType.CallError.rawValue() then
                if v45.errorType == v17.CallerIsInAnotherCall then
                    v25(v9(v7:FormatByKey("Feature.Call.Error.Title.CouldntMakeCall"), v7:FormatByKey("Feature.Call.Error.Description.AlreadyInCall")));
                elseif v45.errorType == v17.CalleeIsInAnotherCall then
                    v25(v9(v7:FormatByKey("Feature.Call.Error.Title.FriendBusy"), v7:FormatByKey("Feature.Call.Error.Description.FriendBusy", {
                        calleeCombinedName = v45.callInfo.calleeCombinedName
                    })));
                elseif not (v45.errorType ~= v17.UniverseIsNotVoiceEnabled) or v45.errorType == v17.PlaceIsNotVoiceEnabled then
                    v25(v9(v7:FormatByKey("Feature.Call.Error.Title.ExperienceError"), v7:FormatByKey("Feature.Call.Description.ExperienceError")));
                    v26.fireEvent(v20.PhoneBookCallFriendFailed, {
                        eventTimestampMs = os.time() * 1000, 
                        calleeUserId = v45.callInfo.calleeId, 
                        callerUserId = v45.callInfo.callerId, 
                        errorMsg = "Universe or place is not voice enabled."
                    });
                elseif v45.errorType == v17.CallerIsNotVoiceEnabled then
                    v25(v9(v7:FormatByKey("Feature.Call.Modal.EnableChatVoiceTitle"), v7:FormatByKey("Feature.Call.Modal.EnableChatVoiceBody")));
                    v26.fireEvent(v20.PhoneBookCallFriendFailed, {
                        eventTimestampMs = os.time() * 1000, 
                        calleeUserId = v45.callInfo.calleeId, 
                        callerUserId = v45.callInfo.callerId, 
                        errorMsg = "User is not voice enabled."
                    });
                else
                    v25(v9(v7:FormatByKey("Feature.Call.Error.Label.OhNo"), v7:FormatByKey("Feature.Call.Error.Description.Generic")));
                end;
                if v45.errorType == v17.UniverseAgeIsNotValid then
                    warn("Experience must be at least one week old to place a call");
                    return ;
                elseif v45.errorType == v17.ReservedServerAccessCodeIsNotProvided then
                    warn("Reserved server access code was not provided via OnCallInviteInvoked callback");
                end;
            end;
        end);
        return function()
            v46:Disconnect();
        end;
    end, {
        v23.callProtocol
    });
    return v2.createElement(v3.Portal, {
        target = l_CoreGui_0
    }, {
        CallDialogScreen = v2.createElement("ScreenGui", {
            Enabled = v44, 
            IgnoreGuiInset = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            DisplayOrder = 8, 
            [v2.Change.AbsoluteSize] = function(v47)
                v28(v47.AbsoluteSize);
            end
        }, {
            Overlay = v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = ""
            }), 
            CallDialog = v2.createElement(l_InteractiveAlert_0, {
                screenSize = v27, 
                title = v32, 
                bodyText = v36, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                text = v7:FormatByKey("InGame.CommonUI.Button.Ok"), 
                                onActivated = function()
                                    if v40 then
                                        v40();
                                    end;
                                    v25(v18());
                                end
                            }
                        }
                    }
                }
            })
        })
    });
end;
