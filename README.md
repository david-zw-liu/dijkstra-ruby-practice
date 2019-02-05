# 說明
練習書上 Dijkstra 範例

# Requirements
* gem 'awesome_print'

# Output:
```ruby
========================================
Graph
{
    "start" => {
        "a" => 6,
        "b" => 2
    },
        "a" => {
        "final" => 1
    },
        "b" => {
            "a" => 3,
        "final" => 5
    },
    "final" => {}
}
========================================
Costs:
{
    "start" => Infinity,
        "a" => 5,
        "b" => 2,
    "final" => 6
}
========================================
Parents:
{
        "a" => "b",
        "b" => "start",
    "final" => "a"
}
========================================
Show path from start to final:
start -> b -> a -> final
Cost: 6
========================================
```
