local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Analytics.Events.buttonClick);
local v2 = require(l_Modules_0.LuaApp.Analytics.Events.formInteraction);
local v3 = require(l_Modules_0.LuaApp.Analytics.Events.modalAction);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.crossDeviceEnterCodeButtonClick);
local v5 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.upsellCardModalAction);
local v6 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.upsellCardButtonClick);
local v7 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.upsellCardFormInteraction);
local v8 = require(l_Modules_0.LuaApp.Analytics.Events.screenLoaded);
local v9 = require(l_Modules_0.LuaApp.Analytics.Events.formFieldValidation);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v12 = require(l_Modules_0.LuaApp.Analytics.Events.usernameSuggestionClick);
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthNewModalSchematization);
local v14 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v15 = require(l_Modules_0.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging);
local v16 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authPageLoad);
local v17 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authClientError);
local v18 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authModalShown);
local v19 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authButtonClick);
local v20 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.usernameSuggestionShown);
local v21 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authFormInteraction);
return {
    get = function(v22)
        local v23 = v10.get(v22);
        local v88 = {
            reportScreenLoaded = function(v24)
                v8(v23.EventStream, v24);
            end, 
            reportAuthPageload = function(v25, v26, v27)
                v16(v23.EventStream, v25, v26, v27);
            end, 
            reportAuthModalShown = function(v28, v29)
                v18(v23.EventStream, v28, v29);
            end, 
            reportAuthClientError = function(v30, v31)
                v17(v23.EventStream, v30, v31);
            end, 
            reportAuthButtonClick = function(v32, v33, v34, v35, v36)
                v19(v23.EventStream, v32, v33, v34, v35, v36);
            end, 
            reportModalShown = function(v37, v38)
                v3(v23.EventStream, v37, v11.ActionType.Shown, v38);
                local v39 = {
                    origin = v38
                };
                if v13() then
                    v23.EventStream:setRBXEventStream(v37, v11.AuthEventName.AuthModalShown, v39);
                end;
            end, 
            reportModalShownWithSection = function(v40, v41, v42)
                v5(v23.EventStream, v40, "", v11.ActionType.Shown, v41, v42);
            end, 
            reportModalShownWithSectionAndError = function(v43, v44, v45, v46, v47)
                v5(v23.EventStream, v43, v44, v11.ActionType.Shown, v45, v46, v47);
            end, 
            reportModalDismissed = function(v48, v49)
                v3(v23.EventStream, v48, v11.ActionType.Dismiss, v49);
            end, 
            reportModalDismissedWithSection = function(v50, v51, v52)
                v5(v23.EventStream, v50, "", v11.ActionType.Dismiss, v51, v52);
            end, 
            reportModalActionWithSection = function(v53, v54, v55, v56, v57, v58)
                v5(v23.EventStream, v53, v54, v55, v56, v57, v58);
            end, 
            reportBirthdaySelection = function(v59)
                local l_Submit_0 = v11.ActionType.Submit;
                v2(v23.EventStream, v59, v11.Field.BirthdayYear, l_Submit_0);
                v2(v23.EventStream, v59, v11.Field.BirthdayMonth, l_Submit_0);
                v2(v23.EventStream, v59, v11.Field.BirthdayDay, l_Submit_0);
            end, 
            reportAgeFocus = function(v61)
                v2(v23.EventStream, v61, v11.Field.BirthdayAge, v11.ActionType.Focus);
            end, 
            reportYearFocus = function(v62)
                v2(v23.EventStream, v62, v11.Field.BirthdayYear, v11.ActionType.Focus);
            end, 
            reportUsernameFocus = function(v63)
                v2(v23.EventStream, v63, v11.Field.Username, v11.ActionType.Focus);
            end, 
            reportDisplayNameFocus = function(v64)
                if not v15 then
                    v2(v23.EventStream, v64, v11.Field.DisplayName, v11.ActionType.Focus);
                    return ;
                else
                    v21(v23.EventStream, v11.Context.SinglePageSignUpScreen, v11.Field.DisplayName, v11.ActionType.Focus);
                    return ;
                end;
            end, 
            reportPasswordFocus = function(v65)
                v2(v23.EventStream, v65, v11.Field.Password, v11.ActionType.Focus);
            end, 
            report2SVCodeFocus = function(v66)
                v2(v23.EventStream, v66, v11.Field.TwoStepAuthCode, v11.ActionType.Focus);
            end, 
            reportFocus = function(v67, v68, v69)
                v2(v23.EventStream, v67, v68, v11.ActionType.Focus, v69);
            end, 
            report2SVInvalidCode = function(v70, v71)
                v9(v23.EventStream, v70, v11.Field.TwoStepAuthCode, v71);
            end, 
            reportErrorMessageShown = function(v72, v73, v74)
                v2(v23.EventStream, v72, v73, v11.ActionType.Shown, v74);
            end, 
            reportInteractWithAction = function(v75, v76, v77, v78, v79)
                v2(v23.EventStream, v75, v76, v77, v78, v79);
            end, 
            reportInteractWithActionAndSection = function(v80, v81, v82, v83, v84, v85)
                v7(v23.EventStream, v80, v81, v82, v83, v84, v85);
            end, 
            reportSignUpButtonClicked = function(v86)
                v1(v23.EventStream, v86, v11.Button.SignUp);
            end, 
            reportLogInButtonClicked = function(v87)
                v1(v23.EventStream, v87, v11.Button.LogIn);
            end
        };
        v88.reportSwitchAccountButtonClicked = function(v89)
            v88.reportAuthButtonClick(v89, v11.Button.SwitchAccounts, nil);
        end;
        v88.reportContinueButtonClicked = function(v90)
            v1(v23.EventStream, v90, v11.Button.Continue);
        end;
        v88.reportDismissCornerXButtonClicked = function(v91)
            v1(v23.EventStream, v91, v11.Button.DismissCornerX);
        end;
        v88.reportForgotPasswordButtonClicked = function(v92)
            v1(v23.EventStream, v92, v11.Button.ForgotPassword);
        end;
        v88.report2SVHelpButtonClicked = function(v93)
            v1(v23.EventStream, v93, v11.Button.NeedHelpLink);
        end;
        v88.reportResendCodeButtonClicked = function(v94)
            v1(v23.EventStream, v94, v11.Button.ResendCode);
        end;
        v88.reportRememberDeviceButtonClicked = function(v95)
            v1(v23.EventStream, v95, v11.Button.RememberDevice);
        end;
        v88.reportShowPasswordButtonClicked = function(v96)
            v1(v23.EventStream, v96, v11.Button.ShowPassword);
        end;
        v88.reportHidePasswordButtonClicked = function(v97)
            v1(v23.EventStream, v97, v11.Button.HidePassword);
        end;
        v88.reportAvatarSelectedButtonClicked = function(v98, v99)
            v1(v23.EventStream, v98, v11.Button.AvatarSelected, v99);
        end;
        v88.reportWeChatButtonClicked = function(v100)
            v1(v23.EventStream, v100, v11.Button.WeChat);
        end;
        v88.reportQQButtonClicked = function(v101)
            v1(v23.EventStream, v101, v11.Button.QQ);
        end;
        v88.reportButtonClicked = function(v102, v103)
            v1(v23.EventStream, v102, v103);
        end;
        v88.reportButtonClickedWithCType = function(v104, v105, v106)
            v4(v23.EventStream, v104, v105, nil, v106);
        end;
        v88.reportButtonClickedWithSectionAndOrigin = function(v107, v108, v109, v110)
            v6(v23.EventStream, v107, v108, nil, v109, v110);
        end;
        v88.reportUsernameSuggestionClicked = function(v111, v112, v113, v114)
            v12(v23.EventStream, v111, v112, v113, v114);
        end;
        v88.reportUsernameSuggestionShown = function(v115, v116, v117, v118)
            v20(v23.EventStream, v115, v116, v117, v118);
        end;
        v88.reportDisplayNameFieldLoaded = function(v119, v120, v121)
            v14("DisplayNameFieldLoaded", 1);
            v21(v23.EventStream, v119, v120, v121);
        end;
        v88.reportDisplayNameFieldBypassed = function(v122, v123)
            v14(v123, 1);
            v17(v23.EventStream, v122, v123);
        end;
        v88.reportUsernameGenerationFailed = function(v124, v125)
            v14(v125, 1);
            v17(v23.EventStream, v124, v125);
        end;
        v88.reportAuthFormInteraction = function(v126, v127, v128, v129, v130)
            v21(v23.EventStream, v126, v127, v128, v129, v130);
        end;
        return v88;
    end
};
