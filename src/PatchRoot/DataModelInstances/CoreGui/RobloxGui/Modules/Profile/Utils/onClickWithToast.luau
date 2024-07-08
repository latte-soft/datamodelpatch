local l_Parent_0 = script.Parent.Parent;
local l_memoize_0 = require(l_Parent_0.dependencies).memoize;
local v2 = require(l_Parent_0.Common.ProfileScreens);
return function(v3, v4)
    local v8 = l_memoize_0(function(v5, v6, v7)
        (not not v4.replaceScreen and v3.replace or v3.navigate)(v2.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v5, 
                    toastSubtitle = v6, 
                    iconImage = v7
                }, 
                position = UDim2.new(0.5, 0, 0, 40)
            }
        });
    end);
    return function()
        if not v4.showToast then
            v4.actionCallback();
            return ;
        else
            v4.actionCallback():andThen(function()
                v8(v4.successTitle, v4.successMessage, v4.successIcon);
            end):catch(function()
                v8(v4.errorTitle, v4.errorMessage, v4.errorIcon);
            end);
            return ;
        end;
    end;
end;
