---@type number
local x = 5
---doc comment
---@param a number
---@return number
local f
f = function(a)
  return a
end
---@class Thing
local Thing
do
  local _class_0
  local _base_0 = {
    ---@type number
    size = 10,
    ---@param greeting string
    greet = function(self, greeting)
      return print(greeting, self.name)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    ---@param name string
    __init = function(self, name)
      self.name = name
    end,
    __base = _base_0,
    __name = "Thing"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  ---annotated self prop
  self.cool = function()
    return 5
  end
  Thing = _class_0
end
local t = {
  ---@type number
  age = 10,
  ---@type string
  name = "hello"
}
local g
g = function()
  ---@type table
  local obj = { }
  return obj
end
do
  ---@diagnostic disable-next-line
  local y = 1
end
---@alias Cool number
local z = 2
local zz = 3
x = z;
---@cast x number
(print)(x)
if x then
  local y = 1
  ---inside body
else
  local y = 2
end
local _exp_0 = x
if 1 == _exp_0 then
  ---inside case
  print("one")
elseif 2 == _exp_0 then
  print("two")
else
  print("other")
end
local Sub
do
  local _class_0
  local _parent_0 = Thing
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    ---@param name string
    __init = function(self, name)
      return _class_0.__parent.__init(self, name)
    end,
    __base = _base_0,
    __name = "Sub",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Sub = _class_0
end
local nested
nested = function()
  ---@return number
  local inner
  inner = function()
    ---trailing annotation
  end
end
local Methods
do
  local _class_0
  local _base_0 = {
    m1 = function(self)
      return print("body")
    end,
    ---between methods, binds to m2
    ---@param x number
    m2 = function(self, x)
      return x
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "Methods"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Methods = _class_0
  return _class_0
end