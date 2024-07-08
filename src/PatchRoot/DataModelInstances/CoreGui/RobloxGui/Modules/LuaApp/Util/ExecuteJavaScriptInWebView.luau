local l_BrowserService_0 = game:GetService("BrowserService");
return {
    Execute = function(v1, v2)
        l_BrowserService_0:ExecuteJavaScript("(function() { CoreRobloxUtilities.hybridResponseService.injectNativeResponse(" .. v1 .. ", " .. v2 .. "); })();");
    end
};
