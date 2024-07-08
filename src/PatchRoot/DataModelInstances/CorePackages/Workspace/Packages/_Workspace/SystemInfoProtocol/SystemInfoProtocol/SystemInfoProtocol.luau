local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.t);
local _ = require(script.Parent.SystemInfoProtocolTypes);
local v4 = {
    GET_SYSTEM_INFO_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId("SystemInfo", "getSystemInfo"), 
        validateParams = v2.table
    }, 
    InfoNames = {
        MANUFACTURER = "manufacturer", 
        DEVICE_NAME = "deviceName", 
        MAX_MEMORY = "maxMemory", 
        MAX_RESOLUTION = "maxResolution", 
        BASE_OS = "baseOs", 
        SYSTEM_VERSION = "systemVersion", 
        APP_VERSION = "appVersion", 
        CPU_MAKE = "cpuMake", 
        IS_64BIT = "is64bit", 
        CPU_LOGICAL_COUNT = "cpuLogicalCount", 
        CPU_CORE_COUNT = "cpuCoreCount", 
        CPU_PHYS_COUNT = "cpuPhysCount", 
        CPU_SPEED = "cpuSpeed", 
        GPU = "GPU", 
        AVAIL_RAM = "availRAM", 
        NETWORK_TYPE = "networkType"
    }
};
v4.ALL_INFO_NAMES = {
    v4.InfoNames.MANUFACTURER, 
    v4.InfoNames.DEVICE_NAME, 
    v4.InfoNames.MAX_MEMORY, 
    v4.InfoNames.MAX_RESOLUTION, 
    v4.InfoNames.BASE_OS, 
    v4.InfoNames.SYSTEM_VERSION, 
    v4.InfoNames.APP_VERSION, 
    v4.InfoNames.CPU_MAKE, 
    v4.InfoNames.IS_64BIT, 
    v4.InfoNames.CPU_LOGICAL_COUNT, 
    v4.InfoNames.CPU_CORE_COUNT, 
    v4.InfoNames.CPU_PHYS_COUNT, 
    v4.InfoNames.CPU_SPEED, 
    v4.InfoNames.GPU, 
    v4.InfoNames.AVAIL_RAM, 
    v4.InfoNames.NETWORK_TYPE
};
v4.__index = v4;
v4.new = function(v5)
    return (setmetatable({
        messageBus = v5 or l_MessageBus_0
    }, v4));
end;
v4.getSystemInfo = function(v6, v7)
    return v6.messageBus.call(v6.GET_SYSTEM_INFO_DESCRIPTOR, v7);
end;
v4.default = v4.new();
return v4;
