local v0 = require(script.Signal);
local v1 = require(script.Immutable);
local v2 = require(script.Color);
local v3 = require(script.Functional);
local v4 = require(script.AsyncQueue.AsyncQueue);
local _ = require(script.AsyncQueue.AsyncQueueTypes);
return {
    Signal = v0, 
    Immutable = v1, 
    IsVRAppBuild = require(script.IsVRAppBuild), 
    Color = v2, 
    Functional = v3, 
    callOnce = require(script.callOnce), 
    memoize = require(script.memoize), 
    OrderedMap = require(script.OrderedMap), 
    Text = require(script.Text), 
    Symbol = require(script.Symbol), 
    ThrottleUserId = require(script.Release.ThrottleUserId), 
    rolloutByApplicationId = require(script.Release.rolloutByApplicationId), 
    AsyncQueue = v4, 
    Utils = require(script.utils), 
    isRunningInStudio = require(script.isRunningInStudio), 
    getDeviceType = require(script.getDeviceType)
};
