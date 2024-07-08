local v0 = {
    preScreenshot = function()
    end, 
    postScreenshot = function()
    end
};
return {
    setPreScreenshotHook = function(v1)
        v0.preScreenshot = v1;
    end, 
    setPostScreenshotHook = function(v2)
        v0.postScreenshot = v2;
    end, 
    doPreScreenshot = function()
        v0.preScreenshot();
    end, 
    doPostScreenshot = function()
        v0.postScreenshot();
    end
};
