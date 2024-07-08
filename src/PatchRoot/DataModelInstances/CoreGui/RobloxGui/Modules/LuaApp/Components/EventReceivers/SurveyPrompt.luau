local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local v8 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = require(l_Modules_0.LuaApp.Constants);
local v12 = v1.PureComponent:extend("SurveyPrompt");
local function _(v13, v14)
    if v14 and v14 ~= "" then
        return v14;
    else
        return v13;
    end;
end;
v12.init = function(v16)
    v16.closePrompt = function()
        v16.props.closeAlert();
        v16.props.closeFunc();
    end;
    v16.openSurvey = function()
        v16.props.closeAlert();
        v16.props.continueFunc();
    end;
end;
v12.render = function(v17)
    return v7({
        titleText = "Feature.QualtricsSurveyPrompt.Heading.Title", 
        cancelButtonText = "Feature.QualtricsSurveyPrompt.Action.Close", 
        confirmButtonText = "CommonUI.Features.Action.Go"
    })(function(v18)
        local l_titleText_0 = v18.titleText;
        local l_titleText_1 = v17.props.titleText;
        local v21 = if not not l_titleText_1 and l_titleText_1 ~= "" then l_titleText_1 else l_titleText_0;
        l_titleText_1 = v17.props.localization:Format("Feature.QualtricsSurveyPrompt.Description.PromptText", v17.props.displayName);
        local l_bodyText_0 = v17.props.bodyText;
        l_titleText_0 = if not not l_bodyText_0 and l_bodyText_0 ~= "" then l_bodyText_0 else l_titleText_1;
        l_bodyText_0 = v18.cancelButtonText;
        local l_cancelButtonText_0 = v17.props.cancelButtonText;
        l_titleText_1 = if not not l_cancelButtonText_0 and l_cancelButtonText_0 ~= "" then l_cancelButtonText_0 else l_bodyText_0;
        l_cancelButtonText_0 = v18.confirmButtonText;
        local l_confirmButtonText_0 = v17.props.confirmButtonText;
        return (v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v11.Color.BLACK, 
            BackgroundTransparency = 0.5, 
            Active = true, 
            Selectable = false
        }, {
            AlertWindow = v1.createElement(l_InteractiveAlert_0, {
                bodyText = l_titleText_0, 
                title = v21, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v17.closePrompt, 
                                text = l_titleText_1
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v17.openSurvey, 
                                text = if not not l_confirmButtonText_0 and l_confirmButtonText_0 ~= "" then l_confirmButtonText_0 else l_cancelButtonText_0
                            }
                        }
                    }
                }, 
                screenSize = v17.props.screenSize
            })
        }));
    end);
end;
return (l_RoactServices_0.connect({
    localization = v5
})((v2.connect(function(v25, _)
    local v27 = v25.Users[v25.LocalUserId];
    return {
        screenSize = v25.ScreenSize, 
        displayName = not v27 and "Robloxian" or (v27.displayName or v27.name)
    };
end, function(v28)
    return {
        closeAlert = function()
            return v28(v6());
        end
    };
end)(v12))));
