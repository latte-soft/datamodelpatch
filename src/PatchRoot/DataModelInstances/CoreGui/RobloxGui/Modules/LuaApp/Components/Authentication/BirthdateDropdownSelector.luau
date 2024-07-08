local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_TimeUnit_0 = require(l_CorePackages_0.Workspace.Packages.Time).TimeUnit;
local l_DateHelper_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Modules_0.LuaApp.Models.Authentication.Birthday);
local v8 = require(l_Modules_0.LuaApp.Components.Authentication.DateDropdownSelector);
return function(v9)
    local v10, v11 = v2.useState(nil);
    local l_SignUpView_0 = l_useDesignTokens_0().LuaApps.SignUpView;
    return v2.createElement(v8, {
        size = UDim2.new(0.75, 0, 1, 0), 
        titleKey = "Authentication.SignUp.Label.Birthday", 
        errorTextKey = v10 == false and "Authentication.SignUp.Response.InvalidBirthday" or nil, 
        onDateSelected = v2.useCallback(function(v13)
            local v14 = v13[l_TimeUnit_0.Years];
            local v15 = v13[l_TimeUnit_0.Months];
            local v16 = v13[l_TimeUnit_0.Days];
            if (v14 ~= 0 and v15 ~= 0) and v16 ~= 0 then
                local v17 = v7.new({
                    Year = v14, 
                    Month = v15, 
                    Day = v16
                });
                local v18 = false;
                if l_DateHelper_0:isValidDate(v15, v16, v14) then
                    v18 = true;
                    if l_DateHelper_0:isFutureDate(v15, v16, v14) then
                        v18 = false;
                    end;
                end;
                v11(v18);
                v9.onBirthdaySelected(v17, v18);
            end;
        end, {
            v9.onBirthdaySelected
        }), 
        horizontalInnerPadding = UDim.new(0, 18), 
        fixedListHeight = math.min(l_useSelector_0(function(v19)
            return v19.ScreenSize or Vector2.new(1920, 1080);
        end).Y, 480), 
        alignment = v9.alignment, 
        layoutOrder = v9.layoutOrder, 
        designTokens = v2.useMemo(function()
            return {
                textCaptionHeaderSize = l_SignUpView_0.textCaptionHeaderSize, 
                textBodySize = l_SignUpView_0.textBodySize, 
                dropdownHeight = l_SignUpView_0.dropdownHeight, 
                dropdownHorizontalPadding = l_SignUpView_0.dropdownHorizontalPadding, 
                dropdownVerticalPadding = l_SignUpView_0.dropdownVerticalPadding, 
                dateDropdownWidth = l_SignUpView_0.dateDropdownWidth
            };
        end, {
            l_SignUpView_0
        })
    });
end;
