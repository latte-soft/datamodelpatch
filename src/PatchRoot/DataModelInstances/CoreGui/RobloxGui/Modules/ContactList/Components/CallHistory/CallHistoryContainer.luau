local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.ApolloClient);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Roact);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v9 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_useApolloClient_0 = v3.useApolloClient;
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v14 = require(l_ContactList_0.Actions.SetCurrentPage);
local v15 = require(l_ContactList_0.Enums.Pages);
local v16 = require(l_ContactList_0.dependencies);
local l_NetworkingCall_0 = v16.NetworkingCall;
local l_dependencyArray_0 = v16.Hooks.dependencyArray;
local l_useDispatch_0 = v16.Hooks.useDispatch;
local l_UIBlox_0 = v16.UIBlox;
local l_useSelector_0 = v16.Hooks.useSelector;
local v22 = nil;
local v23 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v23 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v22 = v16.Hooks.useLocalization;
end;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_LoadingSpinner_0 = l_UIBlox_0.App.Loading.LoadingSpinner;
local v26 = require(l_ContactList_0.Analytics.useAnalytics);
local v27 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v28 = require(l_ContactList_0.Components.CallHistory.CallHistoryItem);
local v29 = require(l_ContactList_0.Components.ContactListCommon.NoItemView);
local v30 = require(l_ContactList_0.Components.ContactListCommon.Constants);
local v31 = require(l_RobloxGui_0.Modules.BlockingUtility);
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v33 = not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function(v34)
    local v35 = l_useApolloClient_0();
    local v36 = v26();
    local v37 = l_useDispatch_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v39 = nil;
    if l_GetFFlagIrisUseLocalizationProvider_0() then
        v39 = v22({
            genericErrorLabel = "Feature.Call.Error.Description.Generic", 
            noCallsLabel = "Feature.Call.Prompt.FirstCall"
        });
    end;
    local v40 = v5.useRef(true);
    local v41 = v5.useRef(nil);
    local v42 = v5.useRef(0);
    local v43, v44 = v5.useState(l_RetrievalStatus_0.Fetching);
    local v45, v46 = v5.useState(false);
    local v47, v48 = v5.useState({});
    local v49, v50 = v5.useState("");
    local v52 = l_useSelector_0(function(v51)
        return v51.LastRemovedFriend.lastRemovedFriendId;
    end);
    local v54 = l_useSelector_0((v5.useCallback(function(v53)
        return v53.Navigation.currentPage;
    end, {})));
    local v68 = v5.useCallback(function(v55, v56)
        v40.current = true;
        v44(l_RetrievalStatus_0.Fetching);
        v37(l_NetworkingCall_0.GetCallHistory.API({
            cursor = v56, 
            limit = v56 == "" and 16 or 8, 
            universeId = game.GameId
        })):andThen(function(v57)
            local v58 = {};
            for _, v60 in ipairs(v55) do
                table.insert(v58, v60);
            end;
            for _, v62 in ipairs(v57.responseBody.callRecords) do
                table.insert(v58, v62);
            end;
            local v63 = {};
            for _, v65 in ipairs(v58) do
                for _, v67 in ipairs(v65.participants) do
                    v63[tostring(v67.userId)] = true;
                end;
            end;
            v35:query({
                query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
                variables = {
                    userIds = v4.Dictionary.keys(v63)
                }
            }):andThen(function()
                v48(v58);
                v50(v57.responseBody.nextPageCursor);
                v44(l_RetrievalStatus_0.Done);
            end):catch(function()
                v44(l_RetrievalStatus_0.Failed);
            end);
        end, function()
            v44(l_RetrievalStatus_0.Failed);
        end);
    end, {
        v52
    });
    v5.useEffect(function()
        v68({}, "");
        return function()
            v48({});
            v50("");
        end;
    end, {
        v68
    });
    local v69 = v5.useCallback(function()
        v36.fireEvent(v27.PhoneBookNavigate, {
            eventTimestampMs = os.time() * 1000, 
            startingPage = v54, 
            destinationPage = v15.FriendList
        });
        v37(v14(v15.FriendList));
    end, {
        v54
    });
    v5.useEffect(function()
        if v43 ~= l_RetrievalStatus_0.Fetching then
            v40.current = false;
        end;
    end, {
        v43
    });
    local v71 = v5.useMemo(function()
        local _ = nil;
        return v5.createElement(v29, {
            isImageEnabled = v43 ~= l_RetrievalStatus_0.Failed, 
            imageName = "icons/graphic/findfriends_xlarge", 
            isFailedButtonEnabled = v43 == l_RetrievalStatus_0.Failed, 
            onFailedButtonActivated = function()
                v68(v47, v49);
            end, 
            isCallButtonEnabled = v43 == l_RetrievalStatus_0.Done, 
            onCallButtonActivated = v69, 
            messageText = if not l_GetFFlagIrisUseLocalizationProvider_0() then if v43 == l_RetrievalStatus_0.Failed then v23:FormatByKey("Feature.Call.Error.Description.Generic") else v23:FormatByKey("Feature.Call.Prompt.FirstCall") else if v43 == l_RetrievalStatus_0.Failed then v39.genericErrorLabel else v39.noCallsLabel
        });
    end, l_dependencyArray_0(v47, v68, v69, v49, v43));
    local v73 = v5.useCallback(function(v72)
        v42.current = v72.Position.Y;
    end, {});
    local v75 = v5.useCallback(function(v74)
        if not (not (v30.TOUCH_SLOP < v74.Position.Y - v42.current) or not v41.current) and v41.current.CanvasPosition.Y == 0 then
            v46(true);
        end;
    end, {});
    local v76 = v5.useCallback(function()
        v46(false);
    end, {});
    local v85 = v5.useMemo(function()
        local v77 = {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v78 = {};
        for _, v80 in ipairs(v47) do
            local l_userId_0 = v80.participants[1].userId;
            if l_userId_0 == v33 then
                l_userId_0 = v80.participants[2].userId;
            end;
            if not v31:IsPlayerBlockedByUserId(l_userId_0) then
                table.insert(v78, v80);
            end;
        end;
        for v82, v83 in ipairs(v78) do
            v77[v82] = v5.createElement(v28, {
                callRecord = v83, 
                localUserId = v33, 
                showDivider = v82 ~= #v78, 
                dismissCallback = v34.dismissCallback, 
                layoutOrder = v82
            });
        end;
        if v49 ~= "" then
            local v84 = #v77 + 1;
            if v43 == l_RetrievalStatus_0.Failed then
                v77[v84] = v71;
                return v77;
            else
                v77[v84] = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v30.ITEM_HEIGHT), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v84
                }, {
                    LoadingSpinner = v5.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(48, 48), 
                        position = UDim2.fromScale(0.5, 0.5), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end;
        return v77;
    end, l_dependencyArray_0(v47, v49, v71, v43));
    local v87 = v5.useCallback(function(v86)
        if ((not v40.current and v43 ~= l_RetrievalStatus_0.Failed) and v49 ~= "") and (v86.AbsoluteCanvasSize.Y - v86.AbsoluteSize.Y) - 50 <= v86.CanvasPosition.Y then
            v68(v47, v49);
        end;
    end, l_dependencyArray_0(v47, v68, v49, v43));
    v5.useEffect(function()
        local v88 = (#v85 - 1) * v30.ITEM_HEIGHT;
        if v41.current and v88 <= v41.current.AbsoluteSize.Y then
            v87(v41.current);
        end;
    end, l_dependencyArray_0(v85, v87));
    return if #v47 == 0 and v43 == l_RetrievalStatus_0.Fetching then v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v30.ITEM_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        LoadingSpinner = v5.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(48, 48), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        })
    }) else if #v47 == 0 then v71 else v6.createFragment({
        v5.createElement("ScrollingFrame", {
            Size = UDim2.fromScale(1, 1), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollingEnabled = not v45 and v34.scrollingEnabled, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            ref = v41, 
            [v5.Change.CanvasPosition] = v87
        }, v85); 
        TouchStartedUserInputConnection = (v34.isSmallScreen and v34.scrollingEnabled) and v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchStarted, 
            callback = v73
        }), 
        TouchMovedUserInputConnection = (v34.isSmallScreen and v34.scrollingEnabled) and v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchMoved, 
            callback = v75
        }), 
        TouchEndedUserInputConnection = (v34.isSmallScreen and v34.scrollingEnabled) and v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchEnded, 
            callback = v76
        })
    });
end;
