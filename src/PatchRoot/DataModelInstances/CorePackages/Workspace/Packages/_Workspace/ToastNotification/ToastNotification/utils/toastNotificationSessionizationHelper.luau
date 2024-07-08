local l_SessionService_0 = game:GetService("SessionService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.constants);
local v3 = require(l_Parent_0.type);
return function(v4)
    if v4 == v3.ToastNotificationActionsEnum.Display then
        l_SessionService_0:SetSession(v2.ToastStructuralIdentifier.Level1, v2.ToastStructuralIdentifier.ToastNotification, v2.ToastStructuralIdentifier.ToastNotification);
        return ;
    else
        if not (v4 ~= v3.ToastNotificationActionsEnum.Dismissed) or v4 == v3.ToastNotificationActionsEnum.Ignored then
            l_SessionService_0:RemoveSession(v2.ToastStructuralIdentifier.ToastNotification);
        end;
        return ;
    end;
end;
