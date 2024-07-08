local l_GuiService_0 = game:GetService("GuiService");
return {
    experimentOrRolloutEnabled = function(_)
        if not l_GuiService_0:IsTenFootInterface() then
            return true;
        else
            return false;
        end;
    end, 
    isProfileEnabled = function()
        if not l_GuiService_0:IsTenFootInterface() then
            return true;
        else
            return false;
        end;
    end
};
