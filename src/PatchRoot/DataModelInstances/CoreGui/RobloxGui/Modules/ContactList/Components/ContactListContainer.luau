local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_SocialService_0 = game:GetService("SocialService");
local v3 = require(l_CorePackages_0.Packages.React);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v13 = require(l_ContactList_0.dependencies);
local l_dependencyArray_0 = v13.Hooks.dependencyArray;
local l_useSelector_0 = v13.Hooks.useSelector;
local l_useDispatch_0 = v13.Hooks.useDispatch;
local l_useStyle_0 = v13.UIBlox.Core.Style.useStyle;
local v18 = require(l_ContactList_0.Analytics.useAnalytics);
local v19 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v20 = require(l_ContactList_0.Components.ContactListHeader);
local v21 = require(l_ContactList_0.Components.CallHistory.CallHistoryContainer);
local v22 = require(l_ContactList_0.Components.FriendList.FriendListContainer);
local v23 = require(l_ContactList_0.Components.ContactListSearchBar);
local v24 = require(l_ContactList_0.Actions.SetCurrentPage);
local v25 = require(l_ContactList_0.Actions.SetCurrentTag);
local v26 = require(l_ContactList_0.Actions.OpenOrUpdateDialog);
local v27 = require(l_ContactList_0.Enums.Pages);
local v28 = require(l_ContactList_0.Parent.TopBar.Constants);
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableSocialServiceIrisInvite");
local l_game_EngineFeature_1 = game:GetEngineFeature("EnableSocialServiceCallingRename");
local v33 = 12 + v28.TopBarHeight;
return function()
    local v34 = v18();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v36 = l_useDispatch_0();
    local v37 = v3.useRef(nil);
    local v38, v39 = v3.useState(0);
    local v40, v41 = v3.useState(l_CurrentCamera_0.ViewportSize.X < 640);
    local v42, v43 = v3.useState("");
    local v44, v45 = v3.useState(l_CurrentCamera_0.ViewportSize.Y - v33);
    local v46, v47 = v3.useState(nil);
    local v48 = v3.useRef(l_Signal_0.new());
    local v50 = l_useSelector_0((v3.useCallback(function(v49)
        return v49.Navigation.currentPage;
    end, {})));
    if l_game_EngineFeature_0 then
        v3.useEffect(function()
            local v55 = l_SocialService_0.PromptIrisInviteRequested:Connect(function(v51, v52)
                if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v51.UserId then
                    local l_UserInputService_0 = game:GetService("UserInputService");
                    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
                    if not l_UserInputService_0.VREnabled and (not (((l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.UWP) and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX) and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS) or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android) then
                        v36(v25(v52));
                        v34.fireEvent(v19.PhoneBookNavigate, {
                            eventTimestampMs = os.time() * 1000, 
                            startingPage = v50, 
                            destinationPage = v27.CallHistory
                        });
                        v36(v24(v27.CallHistory));
                        l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                            Volume = 0.5
                        }, l_SoundGroups_0.Iris);
                        return ;
                    else
                        v36(v26(v11:FormatByKey("Feature.Call.Error.Label.OhNo"), v11:FormatByKey("Feature.Call.Error.Description.DeviceNotSupported"), function()
                            l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                        end));
                    end;
                end;
            end);
            local _ = nil;
            local v58 = (if not l_game_EngineFeature_1 then game:GetService("SocialService").IrisInvitePromptClosed else l_SocialService_0.PhoneBookPromptClosed):Connect(function(v57)
                if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v57.UserId then
                    v34.fireEvent(v19.PhoneBookNavigate, {
                        eventTimestampMs = os.time() * 1000, 
                        startingPage = tostring(v50), 
                        destinationPage = nil
                    });
                    v36(v24(nil));
                    v39(v38 + 1);
                end;
            end);
            return function()
                v55:Disconnect();
                v58:Disconnect();
            end;
        end, l_dependencyArray_0(v38, v50));
    end;
    local v59 = v3.useCallback(function()
        if v40 or not v37.current then
            if not (not v48 or not v48.current) then
                v48.current:fire();
            end;
            return ;
        else
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            pcall(function()
                v37.current:TweenPosition(UDim2.new(0, -376, 0, v33), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function()
                    l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                end);
            end);
            return ;
        end;
    end, {
        v40
    });
    local v61 = v3.useCallback(function(v60)
        v43(v60);
    end, {});
    v3.useEffect(function()
        local v62 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function()
            if l_CurrentCamera_0.ViewportSize.X < 640 then
                v41(true);
            else
                v41(false);
            end;
            v45(l_CurrentCamera_0.ViewportSize.Y - v33);
        end);
        return function()
            v62:Disconnect();
        end;
    end, {});
    v3.useEffect(function()
        if not ((not v50 or v40) or not v37.current) then
            pcall(function()
                v37.current:TweenPosition(UDim2.new(0, 12, 0, v33), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true);
            end);
        end;
        v43("");
    end, {
        v40, 
        v50
    });
    local v65 = v3.useCallback(function(v63, _)
        if v63 == l_PeekViewState_0.Closed then
            if not (not l_LocalPlayer_0 or not l_game_EngineFeature_0) then
                l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
            end;
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
        end;
        v47(v63);
    end, {});
    local v66 = v3.useCallback(function()
        v34.fireEvent(v19.PhoneBookSearchClicked, {
            eventTimestampMs = os.time() * 1000
        });
        if v50 ~= v27.FriendList then
            v34.fireEvent(v19.PhoneBookNavigate, {
                eventTimestampMs = os.time() * 1000, 
                startingPage = v50, 
                destinationPage = v27.FriendList
            });
        end;
        v36(v24(v27.FriendList));
        v47(l_PeekViewState_0.Full);
    end, {
        v50
    });
    local v68 = v3.useMemo(function()
        local v67 = nil;
        if v50 == v27.CallHistory then
            v67 = v3.createElement(v21, {
                dismissCallback = v59, 
                isSmallScreen = v40, 
                scrollingEnabled = not v40 or v46 == l_PeekViewState_0.Full, 
                searchText = v42
            });
        elseif v50 == v27.FriendList then
            v67 = v3.createElement(v22, {
                dismissCallback = v59, 
                isSmallScreen = v40, 
                scrollingEnabled = not v40 or v46 == l_PeekViewState_0.Full, 
                searchText = v42
            });
        end;
        return v3.createElement("ImageButton", {
            Size = if not v40 then UDim2.new(0, 376, 1, -v33) else UDim2.new(1, 0, 0, v44 - 25), 
            Position = if not v40 then UDim2.new(0, -376, 0, v33) else UDim2.new(0, 0, 0, 0), 
            AutoButtonColor = false, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            ref = v37
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), 
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = if not v40 then UDim.new(0, 8) else UDim.new(0, 0)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            Header = v3.createElement(v20, {
                currentPage = v50, 
                headerHeight = 36, 
                layoutOrder = 1, 
                dismissCallback = v59
            }), 
            SearchBar = v3.createElement(v23, {
                layoutOrder = 2, 
                onSearchChanged = v61, 
                searchBarHeight = 36, 
                searchText = v42, 
                onFocused = v66
            }), 
            ContentContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -88)
            }, v67)
        });
    end, l_dependencyArray_0(v44, v50, v59, v46, v40, v42));
    local v69 = {};
    if not v40 then
        v69.Content = v68;
    else
        v69["Content" .. tostring(v38)] = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v33), 
            Position = UDim2.fromOffset(0, v33), 
            BackgroundTransparency = 1
        }, {
            v3.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0.6, 0), 
                canDragFullViewToBrief = true, 
                closeSignal = v48.current, 
                elasticBehavior = Enum.ElasticBehavior.Never, 
                peekViewState = v46, 
                viewStateChanged = v65
            }, {
                Content = v68
            })
        });
    end;
    if not v50 then
        return nil;
    else
        return (v3.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v3.Event.Activated] = function()
                v59();
            end
        }, v69));
    end;
end;
