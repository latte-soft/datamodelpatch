local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactRoblox);
local v6 = require(l_Parent_0.ReactOtter);
local l_useState_0 = v4.useState;
local l_useEffect_0 = v4.useEffect;
local l_useMemo_0 = v4.useMemo;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v13 = require(script.Parent.Parent.Flags.GetFFlagManagerCloseModalOnMenuOpen);
local v14 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
return function(v15)
    local v16, v17 = l_useState_0({});
    local v18, v19 = l_useState_0(l_GuiService_0.MenuIsOpen);
    l_useEffect_0(function()
        local v20 = l_GuiService_0.MenuOpened:Connect(function()
            if not (not v13() or not v15.CloseModal) then
                v15.CloseModal();
            end;
            v19(true);
        end);
        local v21 = l_GuiService_0.MenuClosed:Connect(function()
            v19(false);
        end);
        return function()
            v20:Disconnect();
            v21:Disconnect();
        end;
    end, {});
    local v22, v23 = v6.useAnimatedBinding(0, function()
        if v16 ~= v15 then
            v17(v15);
        end;
    end);
    l_useEffect_0(function()
        local v24 = nil;
        if v15.ModalKey then
            v17(v15);
            v24 = l_UserInputService_0.InputBegan:Connect(function(v25)
                if not (not ((not (v25.KeyCode ~= Enum.KeyCode.Backspace) or v25.KeyCode == Enum.KeyCode.ButtonB) and l_UserInputService_0:GetFocusedTextBox() == nil) or not v15.CloseModal) then
                    v15.CloseModal();
                end;
            end);
        end;
        return function()
            if v24 then
                v24:Disconnect();
            end;
        end;
    end, {
        v15
    });
    local v26 = l_useMemo_0(function()
        if not (v15.ModalKey ~= nil) or v18 then
            return 0;
        else
            return 1;
        end;
    end, {
        v15.ModalKey, 
        v18
    });
    l_useEffect_0(function()
        v23(v6.spring(v26, v14));
    end, {
        v26
    });
    return v4.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ResetOnSpawn = false, 
        DisplayOrder = 0, 
        Enabled = v22:map(function(v27)
            return v27 > 0;
        end)
    }, {
        Background = v4.createElement("Frame", {
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 1, 
            BackgroundTransparency = v22:map(function(v28)
                return 1 - v28 * 0.5;
            end), 
            ZIndex = 0
        }), 
        Container = v4.createElement("TextButton", {
            ZIndex = 1, 
            Text = "", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Modal = true, 
            Selectable = false, 
            Position = v22:map(function(v29)
                return UDim2.new(0, 0, 1 - v29, 0);
            end), 
            [v5.Event.Activated] = function()
                if v15.CloseModal then
                    v15.CloseModal();
                end;
            end
        }, {
            LocalizationProvider = v4.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
                    ModalComponent = if not v16.Component then nil else v4.createElement(v16.Component, not not v16.Params and v16.Params.Props or {})
                })
            })
        })
    });
end;
