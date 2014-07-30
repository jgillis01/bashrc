# Docker development aliases

alias run_mongodb='docker run -p 27017:17017 -t dockerfile/mongodb'
alias run_memcached='docker run -p 11211:11211 -t tutum/memcached'
alias run_redis='docker run -p 6379:6379 -t orchardup/redis redis-server'
