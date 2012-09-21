GOAL_POINT    = {x:20, y:20}
Hash.class_eval do
  def path
    (self == GOAL_POINT) ? 1 : ((@@c ||= {})[self] ||= children.map(&:path).inject(:+))
  end
  def children
    [ (self[:x] == GOAL_POINT[:x] ? nil : { x: self[:x]+1, y: self[:y]   } ),
      (self[:y] == GOAL_POINT[:y] ? nil : { x: self[:x]  , y: self[:y]+1 } )
    ].compact
  end
end
puts ({x:0,y:0}.path)

