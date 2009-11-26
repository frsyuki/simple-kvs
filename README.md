# Simple distributed key-value storage with replication and load-balancing function in 54 lines.

## Manual Test

    gem install msgpack-rpc   # MessagePack-RPC library
    ./kvs kvs.yaml node1 &
    ./kvs kvs.yaml node2 &
    ./kvs kvs.yaml node3 &
    ./kvs kvs.yaml node4 &
    ./kvc kvs.yaml key1 val1  # set value
    ./kvc kvs.yaml key1       # get value

## Automated Test

    gem install chukan  # automation library for distributed systems
    ruby test.rb

