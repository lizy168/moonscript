
---@type number
x = 5

---doc comment
---@param a number
---@return number
f = (a) -> a

---@class Thing
class Thing
  ---@type number
  size: 10

  ---@param name string
  new: (@name) =>

  ---@param greeting string
  greet: (greeting) =>
    print greeting, @name

  ---annotated self prop
  @cool: -> 5

t =
  ---@type number
  age: 10
  ---@type string
  name: "hello"

g = ->
  ---@type table
  obj = {}
  obj

do
  ---@diagnostic disable-next-line
  y = 1

-- a detached annotation still passes through
---@alias Cool number

z = 2

---- four dashes is a plain comment, not passed through
zz = 3

x = z
---@cast x number
(print)(x)

-- an annotation before else is part of the body
if x
  y = 1
  ---inside body
else
  y = 2

switch x
  when 1
    ---inside case
    print "one"
  ---between cases, dropped
  when 2
    print "two"
  else
    print "other"

class Sub extends Thing
  ---@param name string
  new: (name) =>
    super name

nested = ->
  ---@return number
  inner = ->
    ---trailing annotation

class Methods
  m1: =>
    print "body"

  ---between methods, binds to m2
  ---@param x number
  m2: (x) => x
