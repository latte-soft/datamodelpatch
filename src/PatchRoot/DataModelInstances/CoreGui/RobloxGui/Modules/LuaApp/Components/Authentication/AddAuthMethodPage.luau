local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_Players_0 = game:GetService("Players");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v10 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v14 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v15 = require(l_Modules_0.LuaApp.Promise);
local v16 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v16.Core.Style.useStyle;
local l_DarkTheme_0 = v16.App.Style.Themes.DarkTheme;
local l_Images_0 = v16.App.ImageSet.Images;
local l_ImageSetButton_0 = v16.Core.ImageSet.ImageSetButton;
local v21 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v22 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v23 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local _ = v21.Components.PasswordBox;
local v25 = require(l_Modules_0.LuaApp.Thunks.Authentication.PasswordValidator);
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.InputValidity);
local l_Button_0 = v16.App.Button.Button;
local l_LinkButton_0 = v16.App.Button.LinkButton;
local l_ButtonType_0 = v16.App.Button.Enum.ButtonType;
local _ = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v31 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_Modules_0.LuaApp.Themes.Colors);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_DividerWithText_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiSharedComponents).DividerWithText;
local v36 = require(l_Modules_0.LuaApp.Components.Authentication.MultiPageSignupText);
local v37 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v38 = require(l_Modules_0.LuaApp.Thunks.Authentication.RegisterPasskey);
local v39 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v40 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v41 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v42 = require(l_Modules_0.LuaApp.Thunks.Authentication.SetPassword);
local v43 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v46 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v47 = require(l_Modules_0.LuaApp.Experiment.AppBtidLayers);
local v48 = game:DefineFastFlag("UseMultiPageSignupTextOnAddAuthMethodPage", false);
local v49 = not v48 and 60 or 24;
local v50 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupLogErrorBody);
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v52 = require(l_Modules_0.LuaApp.Flags.GetFFlagMultiPageSignupDevOverride);
local v53 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
l_GetTextBoundsParams_0.Text = "_unused";
l_GetTextBoundsParams_0.Font = Font.fromEnum(l_AppFonts_0.default:getDefault());
l_GetTextBoundsParams_0.Size = 19;
l_GetTextBoundsParams_0.Width = 0;
local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
return function(_)
    local v57 = v10(v11);
    local v58 = v10(l_AppGuiService_0);
    local v59 = v10(v13);
    local v62 = v46.useBrowserTrackerExperiment({
        v47.SignupLayer
    }, function(v60)
        local v61 = v60[v47.SignupLayer] or {};
        if v52() then
            v61.shouldUseV2FallbackScreen = true;
            v61.shouldSuppressPasskeyOnAddAuthMethodPage = true;
        end;
        return {
            shouldUseV2FallbackScreen = v61.shouldUseV2FallbackScreen, 
            shouldSuppressPasskeyOnAddAuthMethodPage = v61.shouldSuppressPasskeyOnAddAuthMethodPage
        };
    end);
    local l_shouldUseV2FallbackScreen_0 = v62.shouldUseV2FallbackScreen;
    local v64 = v53() and v62.shouldSuppressPasskeyOnAddAuthMethodPage;
    local v65, v66 = v6.useState(true);
    local v67, v68 = v6.useState("");
    local v69, v70 = v6.useState(false);
    local v71, v72 = v6.useState(true);
    local v73, v74 = v6.useState(false);
    local v75, v76 = v6.useState(false);
    local v77 = v6.useRef(nil);
    local v78 = l_useStyle_0();
    local v79 = l_useDispatch_0();
    local function _()
        local v80 = v39.getAuthenticatedTheme();
        if v80 ~= "" then
            v76(true);
            l_MemStorageService_0:Fire(v43.ThemeUpdate, v80);
        end;
    end;
    local function v82()
        v66(not v65);
    end;
    local function v85(v83, v84)
        v68(v83);
        v70(v84 == v26.Valid);
    end;
    local function v92()
        v59.reportAuthButtonClick(v14.Context.PasskeySignupPasswordFallback, v14.Button.Continue);
        v42(v57, v67):andThen(function(_)
            v39.setSignupActionRequired("");
            v39.flush();
            local v87 = if not l_Players_0.LocalPlayer then nil else l_Players_0.LocalPlayer.Name;
            if not ((not l_shouldUseV2FallbackScreen_0 or not v87) or not v67) then
                l_MemStorageService_0:Fire(v43.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                    cvalue = v87, 
                    password = v67, 
                    authType = "signup"
                }));
                if v73 then
                    l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, l_HttpService_0:JSONEncode({
                        username = v87, 
                        password = v67
                    }), 120):andThen(function(v88)
                        local v89 = if not v88 then {} else l_HttpService_0:JSONDecode(v88);
                        if v89 and v89.errorCode == nil then
                            l_Logger_0:info("Successfully registered password.");
                            return ;
                        else
                            l_Logger_0:warning("Error registering password: ", v89.errorMsg);
                            return ;
                        end;
                    end, function(v90)
                        l_Logger_0:warning("Error registering password: ", v90);
                    end);
                end;
            end;
            local v91 = v39.getAuthenticatedTheme();
            if v91 ~= "" then
                v76(true);
                l_MemStorageService_0:Fire(v43.ThemeUpdate, v91);
            end;
            v79(v41({
                {
                    name = v31.Home
                }
            }));
            return v15.resolve();
        end);
    end;
    local function v96()
        if v71 then
            v72(false);
            v59.reportAuthButtonClick(v14.Context.PasskeySignupPasswordFallback, v14.Button.SetupPasskey);
            return v38(v57):andThen(function(_)
                v59.reportAuthModalShown(v14.Context.SignupPasswordFallbackPasskeyCreated, "success");
                v39.setSignupActionRequired("");
                v39.flush();
                local v94 = v39.getAuthenticatedTheme();
                if v94 ~= "" then
                    v76(true);
                    l_MemStorageService_0:Fire(v43.ThemeUpdate, v94);
                end;
                v79(v41({
                    {
                        name = v31.Home
                    }
                }));
                return v15.resolve();
            end, function(v95)
                if not v95.name then
                    v59.reportAuthModalShown(v14.Context.SignupPasswordFallbackPasskeyCreated, "unknown");
                else
                    v59.reportAuthModalShown(v14.Context.SignupPasswordFallbackPasskeyCreated, v95.name);
                    if v50() and type(v95.body) == "string" then
                        v59.reportAuthClientError(v14.Context.SignupPasswordFallbackPasskeyCreated, v95.body);
                    end;
                end;
                v72(true);
                return v15.resolve();
            end);
        else
            return ;
        end;
    end;
    local function v97()
        v59.reportAuthButtonClick(v14.Context.PasskeySignupPasswordFallback, v14.Button.Close);
        v39.setSignupActionRequired("");
        v39.flush();
        v79(v37(v57, v58, v40.MultiStepSignupCanceled));
    end;
    v6.useEffect(function()
        if v77.current then
            v77.current:CaptureFocus();
        end;
        v59.reportAuthPageload(v14.Context.PasskeySignupPasswordFallback);
    end, {});
    v6.useEffect(function()
        if not v75 then
            l_MemStorageService_0:Fire(v43.ThemeUpdate, "dark");
        end;
    end, {
        v78
    });
    v6.useEffect(function()
        if l_shouldUseV2FallbackScreen_0 then
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v98)
                local v99 = false;
                if not (not v98.password or not v98.password.isAvailable) then
                    v99 = true;
                end;
                v74(v99);
            end):catch(function(v100)
                l_Logger_0:warning("Error checking for available credential types. Error: ", v100);
            end);
        end;
    end, {
        l_shouldUseV2FallbackScreen_0
    });
    local v101 = if not l_Players_0.LocalPlayer then nil else l_Players_0.LocalPlayer.Name;
    local v102 = v78.Font.BaseSize * v78.Font.Header1.RelativeSize;
    return l_withLocalization_0({
        userGreetingHeaderText = {
            "Authentication.SignUp.Heading.UserGreetingWithName"; 
            username = v101
        }, 
        userPasswordOnlyGreetingHeaderText = {
            "Authentication.SignUp.Title"; 
            username = v101
        }, 
        continueText = "Authentication.SignUp.Label.Continue", 
        doneText = "CommonUI.Controls.Action.Done", 
        signUpLabel = "Authentication.SignUp.Label.SignUp", 
        oneMoreStepText = "Authentication.SignUp.Description.OneMoreStep", 
        setUpPasskeyLabel = "Authentication.SignUp.Label.SetUpPasskey", 
        createAPasskeyLabel = "Authentication.SignUp.Action.CreateAPasskey", 
        createAPasswordText = "Authentication.SignUp.Description.CreateAPassword", 
        ensureNeverLoseAccountText = "Authentication.SignUp.Description.EnsureNeverLoseAccount", 
        dividerText = "Authentication.SignUp.Description.Or"
    })(function(v103)
        local v104 = if not not l_shouldUseV2FallbackScreen_0 and v101 then v103.userGreetingHeaderText else v103.oneMoreStepText;
        local l_createAPasswordText_0 = v103.createAPasswordText;
        if not (not v53() or not v64) then
            v104 = v103.userPasswordOnlyGreetingHeaderText;
            l_createAPasswordText_0 = v103.ensureNeverLoseAccountText;
        end;
        return v6.createElement(v22, {
            BackgroundTransparency = 0, 
            includeStatusBar = true, 
            BackgroundColor3 = l_DarkTheme_0.BackgroundUIDefault.Color
        }, {
            HeaderFrameListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            HeaderPadding = v6.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 25)
            }), 
            HeaderFrame = v6.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 48), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                LogoutButton = if l_shouldUseV2FallbackScreen_0 then nil else v6.createElement(l_ImageSetButton_0, {
                    Size = UDim2.new(0, 36, 0, 36), 
                    AutoButtonColor = false, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 12, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = l_Images_0["icons/navigation/close"], 
                    ImageColor3 = l_DarkTheme_0.UIEmphasis.Color, 
                    ImageTransparency = 0, 
                    [v6.Event.Activated] = v97
                }), 
                Title = v6.createElement("TextLabel", {
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    Text = v103.signUpLabel, 
                    TextWrapped = true, 
                    Font = v78.Font.CaptionHeader.Font, 
                    TextSize = v102, 
                    TextColor3 = l_DarkTheme_0.TextEmphasis.Color, 
                    TextTransparency = l_DarkTheme_0.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Center
                })
            }), 
            Divider = v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0.5, 0, 0, 48), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_DarkTheme_0.UIEmphasis.Color, 
                LayoutOrder = 2
            }), 
            ContentFrame = v6.createElement("Frame", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -49), 
                Position = UDim2.new(0.5, 0, 0, 49), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                ContainerListLayout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 5)
                }), 
                ContentPadding = v6.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, v49)
                }), 
                MultiPageSignupText = if not v48 then nil else v6.createElement(v36, {
                    layoutOrder = 1, 
                    titleText = v104, 
                    helpText = l_createAPasswordText_0
                }), 
                InstructionsHeadingText = if not v48 then v6.createElement("TextLabel", {
                    Text = v104, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = v78.Theme.TextEmphasis.Color, 
                    Font = v78.Font.Header1.Font, 
                    TextSize = 24
                }, {
                    UIPadding = v6.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 36)
                    })
                }) else nil, 
                InstructionsHeadingBody = if not v48 then v6.createElement("TextLabel", {
                    Text = l_createAPasswordText_0, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextColor3 = v78.Theme.TextDefault.Color, 
                    Font = v78.Font.Header2.Font, 
                    TextSize = 14, 
                    TextWrapped = true
                }, {}) else nil, 
                Spacing = v6.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 16)
                }), 
                PasswordValidator = v6.createElement(v23, {
                    layoutOrder = 4, 
                    titleTextKey = "CommonUI.Messages.Label.Password", 
                    summaryErrorTextKey = "Authentication.SignUp.Label.ErrorsWithPassword", 
                    prerequisiteMet = true, 
                    textInputType = Enum.TextInputType.Password, 
                    onInputTextChanged = v85, 
                    onInputTextValidated = v85, 
                    validator = v25, 
                    validatorAdditionalProps = {
                        username = v101
                    }, 
                    returnKeyType = Enum.ReturnKeyType.Next, 
                    hidePassword = v65, 
                    onToggleCallback = v82, 
                    showDetailedError = true, 
                    textBoxRef = v77
                }), 
                Spacing2 = v6.createElement("Frame", {
                    LayoutOrder = 5, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 8)
                }), 
                ContinueButton = v6.createElement(l_Button_0, {
                    layoutOrder = 6, 
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    text = if not l_shouldUseV2FallbackScreen_0 then v103.continueText else v103.doneText, 
                    size = UDim2.new(1, 0, 0, 48), 
                    onActivated = v92, 
                    isDisabled = not v69
                }), 
                DividerWithText = if not l_shouldUseV2FallbackScreen_0 or v64 then nil else v6.createElement(l_DividerWithText_0, {
                    layoutOrder = 7, 
                    width = 0, 
                    height = 0, 
                    size = UDim2.new(1, 0, 0, 32), 
                    font = v78.Font.BodySmall.Font, 
                    fontSize = v78.Font.BaseSize * v78.Font.BodySmall.RelativeSize, 
                    color3 = v78.Theme.TextMuted.Color, 
                    transparency = v78.Theme.TextMuted.Transparency, 
                    text = v103.dividerText, 
                    padding = 8
                }), 
                PasskeyButton = if not v64 then if not l_shouldUseV2FallbackScreen_0 then v6.createElement(l_LinkButton_0, {
                    layoutOrder = 7, 
                    text = v103.setUpPasskeyLabel, 
                    onActivated = v96, 
                    isDisabled = not v71
                }) else v6.createElement(l_Button_0, {
                    layoutOrder = 8, 
                    buttonType = l_ButtonType_0.Secondary, 
                    text = v103.createAPasskeyLabel, 
                    size = UDim2.new(1, 0, 0, 48), 
                    onActivated = v96, 
                    isDisabled = not v71
                }) else nil
            })
        });
    end);
end;
