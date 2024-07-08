local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v9 = require(l_Modules_0.Common.memoize);
local v10 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v10.Style.withStyle;
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local l_SpringAnimatedItem_0 = v10.Utility.SpringAnimatedItem;
local l_LoadingStateContainer_0 = v10.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v10.App.Loading.Enum.RetrievalStatus;
local l_RetrievalStatus_1 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v18 = require(l_Modules_0.LuaApp.FitChildren);
local v19 = require(l_Modules_0.LuaApp.Components.Generic.ItemListLayout);
local v20 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBackAndNextButton);
local v21 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v22 = require(l_Modules_0.LuaApp.Components.Authentication.TitleAndParagraph);
local v23 = require(l_Modules_0.LuaApp.Components.Authentication.CharacterSelector);
local v24 = require(l_Modules_0.LuaApp.Thunks.Authentication.FetchSignUpBundles);
local v25 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v26 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpSelectedBundleId);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.SignUpRedirectToLandingPage);
local v28 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v29 = v2.PureComponent:extend("CharacterSelectPage");
v29.init = function(v30)
    v30.state = {
        containerSize = Vector2.new(0, 0), 
        headerSize = Vector2.new(0, 0), 
        selectedBundleId = nil
    };
    v30.isMounted = false;
    v30.updateStateWithNewAbsoluteSize = function(v31, v32)
        if v32.X > 0 and v32.Y > 0 then
            spawn(function()
                if v30.isMounted then
                    v30:setState({
                        [v31] = v32
                    });
                end;
            end);
        end;
    end;
    v30.onAbsoluteSizeChange = function(v33)
        v30.updateStateWithNewAbsoluteSize("containerSize", v33.AbsoluteSize);
    end;
    v30.onHeaderAbsoluteSizeChange = function(v34)
        v30.updateStateWithNewAbsoluteSize("headerSize", v34.AbsoluteContentSize);
    end;
    v30.onSelectedCharacterChanged = function(v35)
        if v30.state.selectedBundleId ~= v35 then
            v30.props.authAnalytics.reportAvatarSelectedButtonClicked(v28.Context.SignupAvatarScreen, "bundleId=" .. v35);
            spawn(function()
                if v30.isMounted then
                    v30:setState({
                        selectedBundleId = v35
                    });
                end;
            end);
        end;
    end;
    v30.onContinueButtonActivated = function()
        if v30.state.selectedBundleId ~= nil then
            v30.props.setSignUpSelectedBundleId(v30.state.selectedBundleId);
            v30.props.authAnalytics.reportContinueButtonClicked(v28.Context.SignupAvatarScreen);
            v30.props.goToNextPage();
        end;
    end;
    v30.renderSelectorLoading = function()
        return nil;
    end;
    v30.renderOnCharacterSelectorLoaded = function()
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -(v30.state.headerSize.Y + 56)), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, v30.state.headerSize.Y), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            CharacterSelector = v2.createElement(v23, {
                bundleIds = v30.props.bundleIds, 
                onSelectedCharacterChanged = v30.onSelectedCharacterChanged
            })
        });
    end;
    v30.props.authAnalytics.reportScreenLoaded(v28.Context.SignupAvatarScreen);
end;
v29.didMount = function(v36)
    local l_networking_0 = v36.props.networking;
    local l_fetchSignUpBundles_0 = v36.props.fetchSignUpBundles;
    local l_signUpBundlesFetchStatus_0 = v36.props.signUpBundlesFetchStatus;
    v36.isMounted = true;
    if not (l_signUpBundlesFetchStatus_0 ~= l_RetrievalStatus_1.NotStarted) or l_signUpBundlesFetchStatus_0 == l_RetrievalStatus_1.Failed then
        l_fetchSignUpBundles_0(l_networking_0);
    end;
end;
v29.didUpdate = function(v40)
    local l_signUpBundlesFetchStatus_1 = v40.props.signUpBundlesFetchStatus;
    local l_setNetworkingErrorToast_0 = v40.props.setNetworkingErrorToast;
    local l_signUpRedirectToLandingPage_0 = v40.props.signUpRedirectToLandingPage;
    if l_signUpBundlesFetchStatus_1 == l_RetrievalStatus_1.Failed then
        l_signUpRedirectToLandingPage_0();
        l_setNetworkingErrorToast_0();
    end;
end;
v29.willUnmount = function(v44)
    v44.isMounted = false;
end;
v29.render = function(v45)
    local l_formFactor_0 = v45.props.formFactor;
    local l_signUpBundlesFetchStatus_2 = v45.props.signUpBundlesFetchStatus;
    local l_X_0 = v45.state.containerSize.X;
    local l_selectedBundleId_0 = v45.state.selectedBundleId;
    local _ = v45.state.headerSize.Y;
    local l_X_1 = v45.state.headerSize.X;
    local v52 = l_formFactor_0 == l_FormFactor_0.WIDE;
    local v53 = 10;
    local v54 = 20;
    local v55 = 5;
    local v56 = 20;
    if v52 then
        v53 = 90;
        v54 = 90;
        v55 = 25;
        v56 = math.max(20, l_X_0 * 0.525 - 400);
    end;
    return l_withStyle_0(function(v57)
        return v12({
            continueText = "Authentication.SignUp.Label.Continue"
        })(function(v58)
            return v2.createElement(v21, {
                BackgroundColor3 = v57.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v57.Theme.BackgroundDefault.Transparency, 
                includeStatusBar = true, 
                renderFullscreenBackground = function()
                    return v2.createElement("ImageLabel", {
                        Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/gradient_bg.jpg", 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0
                    });
                end
            }, {
                FocusVignette = v2.createElement(l_SpringAnimatedItem_0.AnimatedImageLabel, {
                    regularProps = {
                        Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/Vignette.png", 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        ZIndex = 2
                    }, 
                    animatedValues = {
                        imageTransparency = not l_selectedBundleId_0 and 1 or 0.5
                    }, 
                    mapValuesToProps = function(v59)
                        return {
                            ImageTransparency = v59.imageTransparency
                        };
                    end, 
                    springOptions = {
                        frequency = 3
                    }
                }), 
                Contents = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v2.Change.AbsoluteSize] = v45.onAbsoluteSizeChange, 
                    ZIndex = 3
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v53), 
                        PaddingBottom = UDim.new(0, v54)
                    }), 
                    SidePaddedHeaderAndFooter = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v56), 
                            PaddingRight = UDim.new(0, v56)
                        }), 
                        Header = v2.createElement(v19, {
                            size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v18.FitAxis.Height, 
                            Padding = UDim.new(0, v55), 
                            [v2.Change.AbsoluteContentSize] = v45.onHeaderAbsoluteSizeChange, 
                            renderItemList = {
                                v2.createElement(v22, {
                                    titleTextKey = "Authentication.SignUp.Heading.SelectStartingAvatar", 
                                    width = l_X_1, 
                                    maxTitleHeight = 45, 
                                    maxParagraphHeight = 0
                                })
                            }
                        }), 
                        Footer = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 56), 
                            AnchorPoint = Vector2.new(0.5, 1), 
                            Position = UDim2.new(0.5, 0, 1, 0), 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1
                        }, {
                            SizeConstraint = v52 and v2.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new(360, math.huge)
                            }), 
                            AuthBackAndNextButton = v2.createElement(v20, {
                                size = UDim2.new(1, 0, 0, 36), 
                                anchorPoint = Vector2.new(0.5, 1), 
                                position = UDim2.new(0.5, 0, 1, 0), 
                                nextButtonText = v58.continueText, 
                                nextButtonIsDisabled = not l_selectedBundleId_0, 
                                nextButtonIsLoading = l_signUpBundlesFetchStatus_2 == l_RetrievalStatus_1.Fetching, 
                                nextButtonOnActivated = v45.onContinueButtonActivated
                            })
                        })
                    })
                }), 
                CharacterSelectorAreaWrapper = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    ZIndex = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v53), 
                        PaddingBottom = UDim.new(0, v54)
                    }), 
                    CharacterSelectorArea = v2.createElement(l_LoadingStateContainer_0, {
                        dataStatus = l_RetrievalStatus_0.fromRawValue(l_signUpBundlesFetchStatus_2), 
                        renderOnLoaded = v45.renderOnCharacterSelectorLoaded, 
                        renderOnFailed = v45.renderSelectorLoading
                    })
                })
            });
        end);
    end);
end;
local v65 = v9(function(v60, v61)
    local v62 = {};
    if v61 == l_RetrievalStatus_1.Done then
        for _, v64 in ipairs(v60) do
            table.insert(v62, v64.bundleId);
        end;
    end;
    return v62;
end);
return (l_RoactServices_0.connect({
    networking = v6, 
    authAnalytics = v4
})((v3.connect(function(v66, _)
    local l_SignUpBundles_0 = v66.SignUpInfo.SignUpBundles;
    local v69 = v24.GetFetchingStatus(v66);
    return {
        formFactor = v66.FormFactor, 
        signUpBundlesFetchStatus = v69, 
        bundleIds = v65(l_SignUpBundles_0, v69)
    };
end, function(v70)
    return {
        fetchSignUpBundles = function(v71)
            return v70(v24.Fetch(v71));
        end, 
        signUpRedirectToLandingPage = function()
            v70(v27());
        end, 
        setNetworkingErrorToast = function(_)
            v70(v25({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        setSignUpSelectedBundleId = function(v73)
            v70(v26(v73));
        end, 
        goToNextPage = function()
            v70(v8({
                name = v7.UsernameSelectionPage
            }));
        end
    };
end)(v29))));
