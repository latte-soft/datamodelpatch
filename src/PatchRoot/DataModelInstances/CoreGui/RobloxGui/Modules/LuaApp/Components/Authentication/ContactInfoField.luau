local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("TextService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v7 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local v10 = require(l_Modules_0.LuaApp.Util.isStringEmail);
local l_isStringPhone_0 = v5.Utils.isStringPhone;
local v12 = require(l_Modules_0.LuaApp.Util.debounce);
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local _ = v7.App.Button.LinkButton;
local l_TextBoxStateWrapper_0 = v5.Components.TextBoxStateWrapper;
local l_GenericTextBox_0 = v5.Components.GenericTextBox;
local l_PhoneNumberTextBox_0 = v5.Components.PhoneNumberTextBox;
local v19 = require(l_Modules_0.LuaApp.Enum.CredentialType);
local _ = require(l_Modules_0.LuaApp.Enum.InputValidity);
local v21 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v22 = require(l_Modules_0.LuaApp.EventStreamConstants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v24 = l_Images_0["icons/navigation/pushRight"];
local v25 = l_Images_0["icons/actions/accept_small"];
local v26 = UDim2.new(0, 18, 0, 18);
local v27 = v4.Component:extend("ContactInfoField");
v27.defaultProps = {
    TextBoxHeight = 36
};
v27.init = function(v28)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v30 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v30 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    v28:setState({
        Type = not not v30 and v19.PhoneNumber or v19.Email, 
        LinkHover = false, 
        EmailInput = "", 
        EmailValid = false, 
        CountryCode = {
            code = "US", 
            name = "United States", 
            prefix = "1"
        }, 
        PhoneInput = "", 
        PhoneValid = false
    });
    v28.MouseEnterLink = function()
        v28:setState({
            LinkHover = true
        });
    end;
    v28.MouseLeaveLink = function()
        v28:setState({
            LinkHover = false
        });
    end;
    v28.LinkActivated = function()
        v28:setState({
            Type = v28.state.Type == v19.Email and v19.PhoneNumber or v19.Email, 
            Focused = false
        });
        local v31 = nil;
        if v28.state.Type == v19.Email then
            v31 = v22.Field.UseEmail;
        elseif v28.state.Type == v19.PhoneNumber then
            v31 = v22.Field.UsePhone;
        end;
        v28.props.authAnalytics.reportInteractWithAction(v22.Context.SinglePageSignUpScreen, v31, v22.ActionType.Click, "", "");
    end;
    v28.UpdateEmailInput = function(v32, v33)
        v28:setState({
            EmailInput = v32, 
            EmailValid = v33
        });
        if v28.props.SetEmail then
            v28.props.SetEmail(v32, v33);
        end;
    end;
    v28.UpdatePhoneInput = function(v34, v35)
        v28:setState({
            PhoneInput = v34, 
            PhoneValid = v35
        });
        if v28.props.SetPhoneNumber then
            v28.props.SetPhoneNumber(v28.state.CountryCode, v34, v35);
        end;
    end;
    v28.InputFocused = function(_)
        v28:setState({
            Focused = true
        });
        local v37 = nil;
        if v28.state.Type == v19.Email then
            v37 = v22.Field.Email;
        elseif v28.state.Type == v19.PhoneNumber then
            v37 = v22.Field.Phone;
        end;
        v28.props.authAnalytics.reportInteractWithAction(v22.Context.SinglePageSignUpScreen, v37, v22.ActionType.Focus, "", "");
    end;
    v28.EmailInputChanged = v12(function(v38)
        v28.UpdateEmailInput(v38.Text, v10(v38.Text));
    end, 1.5);
    v28.EmailInputFocusLost = function(v39)
        v28:setState({
            Focused = false
        });
        v28.UpdateEmailInput(v39.Text, v10(v39.Text));
    end;
    v28.PhoneInputChanged = v12(function(v40)
        v28.UpdatePhoneInput(v40.Text, l_isStringPhone_0(v40.Text));
    end, 1.5);
    v28.PhoneInputFocusLost = function(v41)
        v28:setState({
            Focused = false
        });
        v28.UpdatePhoneInput(v41.Text, l_isStringPhone_0(v41.Text));
    end;
    v28.SetCountryCode = function(v42)
        v28:setState({
            CountryCode = v42
        });
        if v28.props.SetPhoneNumber then
            v28.props.SetPhoneNumber(v42, v28.state.PhoneInput, v28.state.PhoneValid);
        end;
    end;
end;
v27.didMount = function(v43)
    v43.mounted = true;
    if v43.props.SetContactMethod then
        v43.props.SetContactMethod(v43.state.Type);
    end;
end;
v27.didUpdate = function(v44, v45, v46)
    local l_contactMethod_0 = v44.props.contactMethod;
    if (l_contactMethod_0 and l_contactMethod_0 ~= v45.contactMethod) and l_contactMethod_0 ~= v44.state.Type then
        v44:setState({
            Type = l_contactMethod_0
        });
    end;
    if not (not (v44.state.Type ~= v46.Type) or not v44.props.SetContactMethod) then
        v44.props.SetContactMethod(v44.state.Type);
    end;
end;
v27.willUnmount = function(v48)
    v48.mounted = false;
end;
v27.getDerivedStateFromProps = function(v49, v50)
    if v49.Under13 and v50.Type ~= v19.Email then
        return {
            Type = v19.Email
        };
    else
        return ;
    end;
end;
v27.render = function(v51)
    local v52 = v51.state.Type == v19.Email;
    local v53 = not v52 and "Authentication.SignUp.Label.PhoneNumber" or "Authentication.SignUp.Label.EmailAddress";
    local v54 = not v52 and "Authentication.SignUp.Response.InvalidPhoneNumber" or "Authentication.SignUp.Response.InvalidEmail";
    local v55 = not v52 and "Authentication.SignUp.Action.UseEmail" or "Authentication.SignUp.Action.UsePhoneNumber";
    local v56;
    if not ((not v52 or v51.state.EmailValid) or v51.state.Focused) then
        v56 = true;
        if not (v51.state.EmailInput == "") then
            goto label0;
        end;
    end;
    v56 = ((not v52 and not v51.state.PhoneValid) and not v51.state.Focused) and v51.state.PhoneInput ~= "";
    ::label0::;
    return v9({
        Title = if not v51.props.Under13 then v53 else "Authentication.SignUp.Label.ParentEmailAddress", 
        Placeholder = v53, 
        Error = not not v56 and v54 or nil, 
        LinkText = v55
    })(function(v57)
        return l_withStyle_0(function(v58)
            local l_Font_0 = v58.Font.Body.Font;
            local v60 = v58.Font.BaseSize * v58.Font.Body.RelativeSize;
            local l_Color_0 = v58.Theme.TextDefault.Color;
            local l_Transparency_0 = v58.Theme.TextDefault.Transparency;
            local l_Color_1 = v58.Theme.BackgroundUIContrast.Color;
            local l_Transparency_1 = v58.Theme.BackgroundUIContrast.Transparency;
            local l_Color_2 = v58.Theme.UIDefault.Color;
            local v66 = v58.Font.BaseSize * v58.Font.CaptionBody.RelativeSize;
            local v67 = v57.LinkText .. string.rep(" ", math.ceil(v66 / math.max(1, l_Text_0.GetTextWidth(" ", l_Font_0, v66))) + 1);
            local v68 = l_Text_0.GetTextWidth(v67, l_Font_0, v66);
            local v69 = not v51.props.Under13;
            if v51.state.LinkHover then
                v67 = "<u>" .. v67 .. "</u>";
            end;
            return v4.createElement("Frame", {
                LayoutOrder = v51.props.layoutOrder, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5)
                }), 
                Title = v4.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Text = v57.Title, 
                    TextWrapped = true, 
                    Font = v58.Font.CaptionHeader.Font, 
                    TextSize = v58.Font.BaseSize * v58.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v58.Theme.TextEmphasis.Color, 
                    TextTransparency = v58.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Spacer = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 0, 0, 5), 
                    LayoutOrder = 1
                }), 
                CValue = v4.createElement(l_TextBoxStateWrapper_0, {
                    ChildClass = not not v52 and l_GenericTextBox_0 or l_PhoneNumberTextBox_0, 
                    ErrorState = v56, 
                    Icon = (not not v52 and v51.state.EmailValid or not v52 and v51.state.PhoneValid) and v25, 
                    IconSize = v26, 
                    Size = UDim2.new(1, 0, 0, v51.props.TextBoxHeight), 
                    LayoutOrder = 2, 
                    ChildProps = {
                        CountryCode = not v52 and v51.state.CountryCode or nil, 
                        SetCountryCode = not v52 and v51.SetCountryCode or nil, 
                        Text = not not v52 and v51.state.EmailInput or v51.state.PhoneInput, 
                        PlaceholderText = v57.Placeholder, 
                        Font = l_Font_0, 
                        TextSize = v60, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Color = l_Color_1, 
                        Transparency = l_Transparency_1, 
                        TextColor = l_Color_0, 
                        PlaceholderColor = l_Color_2, 
                        TextTransparency = l_Transparency_0, 
                        ClearTextOnFocus = false, 
                        PaddingX = 12, 
                        onChangeText = not not v52 and v51.EmailInputChanged or v51.PhoneInputChanged, 
                        onFocused = v51.InputFocused, 
                        onFocusLost = not not v52 and v51.EmailInputFocusLost or v51.PhoneInputFocusLost, 
                        phoneCountryCodeSelectorCallback = v51.props.phoneCountryCodeSelectorCallback
                    }
                }), 
                Footer = v4.createElement("Frame", {
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, v66 + 10), 
                    BackgroundTransparency = 1
                }, {
                    ErrorText = v56 and v4.createElement("TextLabel", {
                        Size = UDim2.new(1, -12 - v68, 1, 0), 
                        Position = UDim2.new(0, 12, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v57.Error, 
                        TextWrapped = true, 
                        Font = l_Font_0, 
                        TextSize = v66, 
                        TextColor3 = v58.Theme.Alert.Color, 
                        TextTransparency = v51.issueSummaryTextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    Arrow = v69 and v4.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, v66, 0, v66), 
                        Position = UDim2.new(1, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(1, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = v24, 
                        ImageColor3 = v58.Theme.IconEmphasis.Color, 
                        ImageTransparency = v58.Theme.IconEmphasis.Transparency
                    }), 
                    Link = v69 and v4.createElement("TextButton", {
                        Text = v67, 
                        Size = UDim2.new(0, v68, 1, 0), 
                        TextSize = v66, 
                        Position = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        RichText = true, 
                        BackgroundTransparency = 1, 
                        TextColor3 = l_Color_0, 
                        Font = l_Font_0, 
                        [v4.Event.MouseEnter] = v51.MouseEnterLink, 
                        [v4.Event.MouseLeave] = v51.MouseLeaveLink, 
                        [v4.Event.Activated] = v51.LinkActivated
                    })
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    authAnalytics = v21
})(v27));
